from django.urls import path
from .views import get_odoo_partners, partners_view

urlpatterns = [
    path('partners/', get_odoo_partners, name='get_odoo_partners'),
    path("partners/", partners_view, name="partners_view"),

]
