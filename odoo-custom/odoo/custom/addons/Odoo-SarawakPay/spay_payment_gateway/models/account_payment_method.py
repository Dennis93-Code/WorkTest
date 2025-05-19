# -*- coding: utf-8 -*-
from odoo import api, models


class AccountPaymentMethod(models.Model):
    """" Inherits account payment method to add spay payment method """
    _inherit = 'account.payment.method'

    @api.model
    def _get_payment_method_information(self):
        """ Payment method for spay """
        res = super()._get_payment_method_information()
        res['spay'] = {'mode': 'multi', 'domain': [('type', '=', 'bank')]}
        return res
