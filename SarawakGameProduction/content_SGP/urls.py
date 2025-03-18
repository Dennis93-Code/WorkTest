from django.urls import path
from content_SGP import views
from odoo_management_sgp.views import partners_view

urlpatterns = [
    #login page
    path('sgp_login/', views.sgp_login, name='sgp_login'),
    # Topup page
    path('topup/', views.topup_page, name='topup'),
    path('topup/initiate/', views.initiate_topup, name='initiate_topup'),
    path('topup/callback/', views.topup_callback, name='topup_callback'),
    # Related under the view to get data from xml.
    path("partners/", partners_view, name="partners_page"),
    # All pages
    path('mainpage/', views.mainpage, name='mainpage'),
]
