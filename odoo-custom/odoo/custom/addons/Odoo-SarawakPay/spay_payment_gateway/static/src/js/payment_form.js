/** @odoo-module **/

import { _t } from "@web/core/l10n/translation";
import paymentForm from '@payment/js/payment_form';

paymentForm.include({

    async _prepareInlineForm(providerId, providerCode, paymentOptionId, paymentMethodCode, flow) {
        if (providerCode !== 'spay') {
            this._super(...arguments);
            return;
        }
        this._setPaymentFlow('direct');
    },

    async _processDirectFlow(providerCode, paymentOptionId, paymentMethodCode, processingValues) {
        if (providerCode !== 'spay') {
            this._super(...arguments);
            return;
        }
        this.processSPayPayment(processingValues);
    },

    async processSPayPayment(processingValues) {
        const response = await new Promise((resolve, reject) => {
            $.ajax({
               url: '/spay/process',
               type: 'POST',
               contentType: 'application/json',
               data: JSON.stringify({
                'values': processingValues
               }),
               success: resolve,
               error: (xhr) => reject(xhr.responseText),
            });
         });
        if(!response.result.error){
            window.location.href = response.result.url;
        }
        else{
            this._displayErrorDialog(_t(response.result.title), response.result.message);
            this._enableButton?.();
        }
    },
});
