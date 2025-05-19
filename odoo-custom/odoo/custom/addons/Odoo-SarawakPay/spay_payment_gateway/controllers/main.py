# -*- coding: utf-8 -*-
from odoo import http
from odoo.http import request
import logging

import json
import hmac
import hashlib
import urllib.parse

_logger = logging.getLogger(__name__)

class PaymentController(http.Controller):

    @http.route(['/payment/confirm'], type='http', auth="public", website=True)
    def payment_confirm(self, **post):
        order = request.website.sale_get_order()
        payment_acquirer = order.payment_acquirer_id
        payment_url = payment_acquirer._get_spay_payment_url(order.amount_total, order.name)
        _logger.info('Redirecting to payment URL: %s', payment_url)
        return http.redirect(payment_url)

    @http.route(['/payment/response'], type='json', auth="public", website=True)
    def payment_response(self, **data):
        _logger.info('Payment Response Data: %s', data)
        if data.get('status') == 'success':
            order = request.website.sale_get_order()
            order.payment_acquirer_id.form_feedback(data, '')
            return {'status': 'success'}
        else:
            return {'status': 'failed'}

    @http.route(['/spay/payment/call_back'], type='http', auth='public', methods=['GET'], csrf=False)
    def spay_callback(self, **kwargs):
        _logger.info("Received SPay callback with data: %s", kwargs)
        status_id = kwargs.get('status_id')
        order_id = kwargs.get('order_id')
        transaction_id = kwargs.get('transaction_id')
        msg = kwargs.get('msg')
        hash_received = kwargs.get('hash')

        _logger.info(f"SPay callback received: {kwargs}")

        # Optional: Validate the hash to ensure authenticity
        # For example: if not self.validate_hash(order_id, status_id, transaction_id, hash_received):
        #     return "Invalid hash", 400

        # You can now search for the corresponding order using `order_id`
        order = request.env['pos.order'].sudo().search([('pos_reference', '=', order_id)], limit=1)

        if not order:
            _logger.warning(f"No POS Order found for order_id: {order_id}")
            return "Order not found", 404

        if status_id == '1':
            # Payment was successful
            order.write({
                'transaction_id': transaction_id,
                'payment_status': 'paid',
                'payment_msg': msg,
            })
            # Add any post-payment logic here
        else:
            # Payment failed or pending
            order.write({
                'payment_status': 'failed',
                'payment_msg': msg,
            })

        return "Callback received and processed", 200


class SPayController(http.Controller):

    @http.route(['/spay/process'], type='json', auth='public', methods=['POST'], csrf=False)
    def process_payment(self, **kwargs):
        raw_data = request.httprequest.data.decode("utf-8")
        json_data = json.loads(raw_data)
        params = json_data.get('values')

        partner_id = request.env["res.partner"].sudo().browse(params.get('partner_id'))
        if not partner_id.name or not partner_id.phone or not partner_id.email:
            return {"error": True, "title": "Customer Information Error" ,"message": "Customer name, phone and email required. Kindly check customer profile and confirm!!!"}

        provider_id = request.env['payment.provider'].sudo().browse(params.get('provider_id'))
        merchant_id = provider_id.spay_merchant_id
        secretkey = provider_id.spay_secret_key

        # Build string and hash it
        raw_string = secretkey + urllib.parse.unquote(params.get("reference")) + urllib.parse.unquote(str(params.get("amount"))) + urllib.parse.unquote(params.get("reference"))
        hashed = hmac.new(
            bytes(secretkey, 'utf-8'),
            msg=bytes(raw_string, 'utf-8'),
            digestmod=hashlib.sha256
        ).hexdigest()

        # Prepare redirect URL (set spay payment url)
        base_url = f"{provider_id._set_spay_payment_url()}{merchant_id}"
        vals = {
            "order_id": params.get("reference"),
            "detail": params.get("reference"),
            "amount": params.get("amount"),
            "name": partner_id.name,
            "email": partner_id.email,
            "phone": partner_id.phone,
            "hash": hashed,
            "target_url": ""
        }
        redirect_url = f"{base_url}?{urllib.parse.urlencode(vals)}"
        return {'error': False, 'url': redirect_url}
