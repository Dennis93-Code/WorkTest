# Create your views here but mostly under odoo related information.
import xmlrpc.client
from django.http import JsonResponse

ODOO_URL = "http://localhost:8069"  # Change if Odoo runs on another port
ODOO_DB = "sgp_odoo"  # Replace with your actual Odoo database name
ODOO_USERNAME = "admin"  # Your Odoo admin username
ODOO_PASSWORD = "Speeddy5158*"  # Odoo admin password

# Authenticate
common = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/common")
uid = common.authenticate(ODOO_DB, ODOO_USERNAME, ODOO_PASSWORD, {})

if uid:
    print(f"✅ Connected to Odoo! User ID: {uid}")
else:
    print("❌ Failed to authenticate with Odoo.")
    
def odoo_connect():
    """Authenticate with Odoo and return the connection objects"""
    common = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/common")
    uid = common.authenticate(DB, USERNAME, PASSWORD, {})

    if uid:
        models = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/object")
        return uid, models
    return None, None

def get_odoo_partners(request):
    """Retrieve Odoo partners and return JSON response"""
    uid, models = odoo_connect()
    if not uid:
        return JsonResponse({"error": "Failed to connect to Odoo"}, status=500)

    partners = models.execute_kw(DB, uid, PASSWORD, 'res.partner', 'search_read', [[]], {'fields': ['name', 'email']})
    return JsonResponse({"partners": partners})