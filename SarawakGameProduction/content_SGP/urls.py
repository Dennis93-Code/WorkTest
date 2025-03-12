from django.urls import path
from . import views

urlpatterns = [
    path('topup/', views.topup_page, name='topup'),
    path('topup/initiate/', views.initiate_topup, name='initiate_topup'),
    path('topup/callback/', views.topup_callback, name='topup_callback'),
]
