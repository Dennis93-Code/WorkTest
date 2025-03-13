from django.urls import path
from .views import get_odoo_partners

urlpatterns = [
    path('partners/', get_odoo_partners, name='get_odoo_partners'),
]
