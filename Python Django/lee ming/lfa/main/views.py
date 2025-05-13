from django.shortcuts import render, get_object_or_404
from .models import Product, Service, PortfolioItem, BlogPost
from itertools import zip_longest, islice
from django.conf import settings

def home_draft(request):
    featured_products = Product.objects.filter(is_featured=True)  # Example filter
    return render(request, 'main/home.html', {'featured_products': featured_products})
    
    
def chunk_list(data, chunk_size):
    """Helper function to split the list into chunks."""
    return [data[i:i + chunk_size] for i in range(0, len(data), chunk_size)]

def chunked_portfolio_items(items, chunk_size):
    """Helper function to chunk the portfolio items."""
    it = iter(items)
    return list(iter(lambda: list(islice(it, chunk_size)), []))
    
def home(request): 
    # Fetch all featured products without chunking
    featured_products = Product.objects.filter(is_featured=True)
    
    # Fetch all portfolio items and chunk them
    portfolio_items = PortfolioItem.objects.all()
    chunked_items = chunked_portfolio_items(portfolio_items, 3)
    
    context = {
        'featured_products': featured_products,  # Pass the unchunked featured products
        'portfolio_chunks': chunked_items,       # Pass the chunked portfolio items
        'MEDIA_URL': settings.MEDIA_URL
    }
    
    return render(request, 'main/home.html', context)

def about(request):
    portfolio_items = PortfolioItem.objects.all()
    
    context = {
                'portfolio_items':portfolio_items,
                'MEDIA_URL': settings.MEDIA_URL
              }
    return render(request, 'main/about.html', context)

def products(request):
    portfolio_items = PortfolioItem.objects.all()
    products = Product.objects.all()
    # Group products by category
    categories = {}
    for product in products:
        if product.category not in categories:
            categories[product.category] = []
        categories[product.category].append(product)
    context = {
                'categories': categories, 
                'portfolio_items':portfolio_items,
                'MEDIA_URL': settings.MEDIA_URL
              }
    return render(request, 'main/products.html', context)

def product_detail(request, product_id):
    # Retrieve the product instance based on the provided product_id
    product = get_object_or_404(Product, productid=product_id)
    # Render the product detail page with the product context
    return render(request, 'main/product_detail.html', {'product': product})
    
def services(request):
    services = Service.objects.all()
    return render(request, 'main/services.html', {'services': services})

def portfolio(request):
    portfolio_items = PortfolioItem.objects.all()
    return render(request, 'main/portfolio.html', {'portfolio_items': portfolio_items})

def blog(request):
    blog_posts = BlogPost.objects.all()
    return render(request, 'main/blog.html', {'blog_posts': blog_posts})

def contact(request):
    return render(request, 'main/contact.html')

def request_quote(request):
    return render(request, 'main/request_quote.html')

def careers(request):
    return render(request, 'main/careers.html')
    
def terms_and_conditions(request):
    return render(request, 'main/terms_and_conditions.html')

def privacy_policy(request):
    return render(request, 'main/privacy_policy.html')
