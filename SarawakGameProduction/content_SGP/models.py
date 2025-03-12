from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class TopUpTransaction(models.Model):
    payment_methods = [
        ('credit_debit', 'Credit/Debit Card'),
        ('fpx', 'FPX Online Banking'),
        ('qrscan', 'QR Scan (DuitNow, Sarawak Pay)'),
    ]

    status_choices = [
        ('pending', 'Pending'),
        ('success', 'Success'),
        ('failed', 'Failed'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    transaction_id = models.CharField(max_length=100, unique=True)
    payment_method = models.CharField(max_length=20, choices=payment_methods)
    status =models.CharField(max_length=10, choices=status_choices, default="pending")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.username} - {self.amount} - {self.payment_method} - {self.status}"

