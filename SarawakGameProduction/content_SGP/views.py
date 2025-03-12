import uuid
import requests
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import TopUpTransaction

# Current example: Dummy bank API URL (replace with your bank/payment provider's API)
# It would be replaced by the real api url under the bank api provided. Might need 2 to more main user to test it out.

# For sarawak pay section, might be wise to ask the developer from their side.
#### Customer Service Phone: 082-22 45 99
#### Email: customerservice@spayglobal.my

BANK_API_URLS = {
    "fpx": "https://api.examplebank.com/fpx",
    "credit_debit": "https://api.examplebank.com/creditcard",
    "qrscan": "https://api.examplebank.com/qrscan"
}

@login_required
def topup_page(request):
    return render(request, "topup.html")

@login_required
def initiate_topup(request):
    if request.method == "POST":
        amount = request.POST.get("amount")
        payment_method = request.POST.get("payment_method")  # Get from HTML form

        if not amount or not payment_method:
            return JsonResponse({"error": "Invalid amount or payment method"}, status=400)

        try:
            amount = float(amount)  # Ensure it's a valid number
            if amount <= 0:
                raise ValueError("Amount must be greater than zero")
        except ValueError:
            return JsonResponse({"error": "Invalid amount format"}, status=400)

        if payment_method not in BANK_API_URLS:
            return JsonResponse({"error": "Invalid payment method"}, status=400)
        
        # Generate unique transaction ID
        transaction_id = str(uuid.uuid4())

        # Create transaction record
        transaction = TopUpTransaction.objects.create(
            user=request.user,
            amount=amount,
            transaction_id=transaction_id,
            status="pending"
        )

        # Redirect to bank API (Simulated)
        payment_data = {
            "transaction_id": transaction_id,
            "amount": amount,
            "user_email": request.user.email,
            "redirect_url": request.build_absolute_uri("/topup/callback/")
        }

        try:
            response = requests.post(BANK_API_URLS[payment_method], json=payment_data)
            response.raise_for_status()  # Raise exception for HTTP errors

            payment_url = response.json().get("payment_url")
            if payment_url:
                return redirect(payment_url)
            else:
                raise ValueError("Missing payment URL in response")
        except (requests.RequestException, ValueError) as e:
            transaction.status = "failed"
            transaction.save()
            return JsonResponse({"error": f"Payment failed: {str(e)}"}, status=400)

@login_required
def topup_callback(request):
    transaction_id = request.GET.get("transaction_id")
    status = request.GET.get("status")  # Assume bank returns 'success' or 'failed'

    try:
        transaction = TopUpTransaction.objects.get(transaction_id=transaction_id)
        transaction.status = status
        transaction.save()
        return render(request, "topup_status.html", {"status": status})
    except TopUpTransaction.DoesNotExist:
        return JsonResponse({"error": "Invalid transaction"}, status=400)
