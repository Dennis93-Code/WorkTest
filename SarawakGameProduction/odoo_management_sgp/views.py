# Create your views here but mostly under odoo related information.
import xmlrpc.client
from django.http import JsonResponse
from django.conf import settings
from django.shortcuts import render
import xml.etree.ElementTree as ET
import os

ODOO_URL = "http://localhost:8069"  # Change if Odoo runs on another port
ODOO_DB = "sgp_odoo"  # Replace with your actual Odoo database name
ODOO_USERNAME = "denniswong"  # Your Odoo admin username
ODOO_PASSWORD = "speeddy5158*"  # Odoo admin password
XML_PATH = os.path.join(settings.BASE_DIR, "odoo_management_sgp/assets/data.xml") # Your file XML path located.
    
def odoo_connect():
    """Authenticate with Odoo and return user ID & models proxy."""
    try:
        common = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/common")
        uid = common.authenticate(ODOO_DB, ODOO_USERNAME, ODOO_PASSWORD, {})

        if uid:
            models = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/object")
            return uid, models
    except Exception as e:
        print(f"❌ Odoo Connection Error: {e}")
    return None, None

def get_odoo_partners(request):
    """Retrieve Odoo partners and return JSON response"""
    uid, models = odoo_connect()
    if not uid:
        return JsonResponse({"error": "Failed to connect to Odoo"}, status=500)

    try:
        partners = models.execute_kw(
            ODOO_DB, uid, ODOO_PASSWORD,
            'res.partner', 'search_read',
            [[]], {'fields': ['name', 'email']}
        )
        return JsonResponse({"partners": partners})
    except Exception as e:
        return JsonResponse({"error": f"Failed to fetch Odoo partners: {e}"}, status=500)

def load_xml_data():
    """Read the XML file and return structured data."""
    if not os.path.exists(XML_PATH):
        return {"error": "XML file not found"}
    
    tree = ET.parse(XML_PATH)
    root = tree.getroot()
    
    partners = []
    for partner in root.findall("partner"):
        name = partner.find("name").text if partner.find("name") is not None else "Unknown"
        email = partner.find("email").text if partner.find("email") is not None else "No email"
        partners.append({"name": name, "email": email})
    
    return partners

def partners_view(request):
    """View to send XML data to website template."""
    data = load_xml_data()
    return render(request, "SGP_templates/mainpage.html", {"partners": data})

def save_to_xml(request):
    uid, models = odoo_connect()
    if not uid:
        return JsonResponse({"error": "Failed to connect Odoo"}, status=500)
    
    try: 
        partners = models.execute_kw(ODOO_DB, uid, ODOO_PASSWORD, 'res.partner', 'search_read', [[]], {'fields':['name', 'email']})
        
        # Create XML Structure
        root = ET.Element("partners")
        for partner in partners:
            partner_elem = ET.SubElement(root, "partner")
            ET.SubElement(partner_elem, "name").text = partner['name']
            ET.SubElement(partner_elem, "email").text = partner['email']
            
        # Save XML File
        os.makedirs(os.path.dirname(XML_PATH), exist_ok=True)
        tree = ET.ElementTree(root)
        tree.write(XML_PATH)
    
        return JsonResponse({"message": "Data saved to XML success", "file": XML_PATH})
    except Exception as e:
        return JsonResponse({"error": f"Failed to save XML: {e}"}, status=500)