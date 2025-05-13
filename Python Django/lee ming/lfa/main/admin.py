from django.contrib import admin
from .models import Product, Service, PortfolioItem, BlogPost

admin.site.register(Product)
admin.site.register(Service)
admin.site.register(PortfolioItem)
admin.site.register(BlogPost)
