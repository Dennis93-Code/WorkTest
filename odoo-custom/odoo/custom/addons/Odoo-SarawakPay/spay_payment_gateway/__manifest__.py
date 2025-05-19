# -*- coding: utf-8 -*-
{
    'name': 'SPay Payment Gateway',
    'version': '1.0',
    'category': 'Accounting/Payment',
    'summary': 'Integration with SarawakPay payment gateway.',
    'author': 'Dennis Wong',
    'depends': ['payment', 'web', 'website', 'website_sale'],
    'data': [
        'data/spay_payment_method_data.xml',
        'data/spay_payment_provider_data.xml',
        'views/payment_provider_views.xml',
        'views/spay_templates.xml',
        'views/iframe_template.xml',
    ],
    'assets': {
        'web.assets_frontend': [
            'spay_payment_gateway/static/src/js/payment_form.js',
        ],
    },
    'installable': True,
    'application': False,
}
