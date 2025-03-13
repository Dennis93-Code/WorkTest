"""
URL configuration for SarawakGameProduction project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from content_SGP import views

urlpatterns = [
    #
    path('odoo/', include('odoo_mgmt.urls')),
    # under python django session
    path('admin/', admin.site.urls),
    path('mainpage/', views.mainpage, name='mainpage' ),
    path('topup/', views.topup_page, name='topup_page' ),
    path('sgp_login/', views.sgp_login, name='sgp_login'),
]
