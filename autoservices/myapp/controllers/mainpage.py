from odoo import http
from odoo.http import request

class MainPageController(http.Controller):

    @http.route('/mainpage', auth='public', website=True)
    def mainpage(self):
        return request.render('WorkTest.mainpage_template')
