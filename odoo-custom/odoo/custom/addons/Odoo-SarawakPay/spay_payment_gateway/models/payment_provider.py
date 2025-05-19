    # -*- coding: utf-8 -*-
import requests
import hashlib
from odoo.http import request
from urllib.parse import urlencode
from odoo import models, fields, api

from odoo import http
from werkzeug.utils import redirect
import hashlib
from bs4 import BeautifulSoup


import webbrowser



class PaymentProviderSPay(models.Model):
    _inherit = 'payment.provider'

    code = fields.Selection(selection_add=[('spay', 'SPay')],
                            ondelete={'spay': 'set default'},
                            string='Code',
                            help='Identifying the payment method')
    spay_merchant_id = fields.Char(string="Merchant ID", required_if_provider='spay')
    spay_secret_key = fields.Char(string="Secret Key", required_if_provider='spay')

    def _get_spay_payment_url(self, amount, reference):
        """ Generate the URL for payment redirection """
        data = {
            'merchant_id': self.spay_merchant_id,
            'amount': amount,
            'reference': reference,
            'callback_url': self.get_base_url() + '/payment/response',
        }
        # Example: Generate hash and add it to data (as per SPay documentation)
        hash_string = f"{data['merchant_id']}{data['amount']}{data['reference']}{self.spay_secret_key}"
        hash_value = hashlib.sha256(hash_string.encode('utf-8')).hexdigest()
        data['hash'] = hash_value
        return f"https://sandbox.spay.my/payment?{self._encode_url_params(data)}"

    def _encode_url_params(self, params):
        """ Encode parameters to URL query string """
        return '&'.join([f"{k}={v}" for k, v in params.items()])

    def form_generate_values(self, tx_values):
        """ Generate values for form submission """
        return {
            'merchant_id': self.spay_merchant_id,
            'amount': tx_values.get('amount'),
            'reference': tx_values.get('reference'),
            'callback_url': self.get_base_url() + '/payment/response',
        }

    def form_feedback(self, data, signature):
        """ Process the feedback from SPay after payment """
        if self._validate_feedback_signature(data, signature):
            # Handle successful payment (Update order status, etc.)
            return True
        else:
            return False

    def _validate_feedback_signature(self, data, signature):
        """ Validate signature based on received data """
        hash_string = f"{data['merchant_id']}{data['amount']}{data['reference']}{self.spay_secret_key}"
        hash_value = hashlib.sha256(hash_string.encode('utf-8')).hexdigest()
        return hash_value == signature

    def _set_spay_payment_url(self):
        if self.state == 'enabled':
            return 'https://app.spay.my/payment/'
        if self.state == 'test':
            return 'https://sandbox.spay.my/payment/'

    def send_spay_payment_request(self, params):
        partner_id = self.env["res.partner"].sudo().browse(params.get('partner_id'))
        if not partner_id.name or not partner_id.phone or not partner_id.email:
            return {"error": True, "title": "Customer Information Error" ,"message": "Customer name, phone and email required. Kindly check customer profile and confirm!!!"}

        provider_id = self.browse(params.get('provider_id'))
        hash_string = f"{provider_id.spay_merchant_id}{params['amount']}{params['reference']}{provider_id.spay_secret_key}"
        hash_value = hashlib.sha256(hash_string.encode('utf-8')).hexdigest()
        vals = {
            "order_id": params.get("reference"),
            "detail": params.get("reference"),
            "amount": params.get("amount"),
            "name": partner_id.name,
            "email": partner_id.email,
            "phone": partner_id.phone,
            "hash": hash_value,
            "target_url": ""
        }

        # auth = requests.auth.HTTPBasicAuth(provider_id.spay_merchant_id, None)
        # response = requests.post(
        #     provider_id._set_spay_payment_url() + provider_id.spay_merchant_id,
        #     auth=auth,
        #     data=vals,
        #     timeout=60,
        # )
        # print(response.text)

        ''' Below return for js '''
        # if response.status_code == 200:
        return {"error": False, "url": provider_id._set_spay_payment_url() + provider_id.spay_merchant_id, "values": vals, "username": provider_id.spay_merchant_id}
        # return {"error": True, "title": "Payment Processing Error", "message": "Message"}


        ''' Below code for python '''
        # if response.status_code == 200:
        #     # return request.redirect(provider_id._set_s_payment_url() + provider_id.spay_merchant_id)
        #     return request.redirect('/web/login')
















            # Parse the response to find the payment page URL
            # soup = BeautifulSoup(response.text, "html.parser")
            # payment_url = soup.find("meta", {"property": "og:url"})
            # if payment_url:
            #     return redirect(payment_url["content"])

                # return request.render('spay_payment_gateway.spay_payment_page', {'payment_url': payment_url["content"]})
        



            # webbrowser.open(provider_id._set_spay_payment_url() + provider_id.spay_merchant_id, new=2)  # Opens in a new tab


            # file_path = "spay.html"
            # with open(file_path, "w", encoding="utf-8") as file:
            #     file.write(response.text)

            # webbrowser.open(file_path)



        # return request.render('your_module.template_error', {
        #     "title": "Payment Error",
        #     "message": "Unable to process the payment. Please try again later."
        # })




        # return {"error": False, "url": provider_id._set_spay_payment_url() + provider_id.spay_merchant_id, "values": vals}