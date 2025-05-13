from django import forms
from django.db import models

class Product(models.Model):
    CATEGORY_CHOICES = [
        ('Fabric', 'Fabric'),
        ('Tent', 'Tent'),
        ('General Sticker', 'General Sticker'),
        ('Computer Die-Cut Sticker', 'Computer Die-Cut Sticker'),
        ('Mounting Box', 'Mounting Box'),
        ('Display System', 'Display System'),
        ('Poster & Lightbox', 'Poster & Lightbox'),
        ('Backdrop', 'Backdrop'),
    ]
    productid = models.CharField(max_length=50, primary_key=True)  # Use CharField or another field type suitable for your IDs
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES)
    name = models.CharField(max_length=100)
    description = models.TextField()
        
    image = models.ImageField(upload_to='products/', blank=True)
    is_featured = models.BooleanField(default=False)
    
    features = models.TextField(help_text='Enter features separated by commas.', blank=True)

    def get_features_list(self):
        return [feature.strip() for feature in self.features.split(',')]

    def set_features_list(self, features):
        self.features = ', '.join(features)

    def __str__(self):
        return f"{self.name} ({self.category})"

class Service(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='services/')

    def __str__(self):
        return self.name

class PortfolioItem(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='portfolio/')

    def __str__(self):
        return self.title

class BlogPost(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    publish_date = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to='blog/')

    def __str__(self):
        return self.title
