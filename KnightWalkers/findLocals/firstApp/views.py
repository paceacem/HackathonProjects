from django.shortcuts import render,redirect
from firstApp import forms, models
from django.contrib import messages
from firstApp.models import formModel,UserAddress, UserProduct, UserTradition,Product
from django.contrib.auth.decorators import login_required
# from .forms import AddressForm, ProductForm, TraditionForm
from firstApp.forms import AddProduct


def index(request):
#     query = request.GET.get('query', '')  # Get the query parameter
#     if query:
#         # Filter or process data based on the query
#         results = MyModel.objects.filter(location__icontains=query)
#     else:
#         results = MyModel.objects.all()  # Default data

    return render(request, 'firstApp/index.html', )#{'results': results, 'query': query})

def form(request):
    if request.method == "POST":
        form = forms.localGuide(request.POST, request.FILES)
        if form.is_valid():
            models.formModel.objects.create(
                guideName=form.cleaned_data['guideName'],
                guideNumber=form.cleaned_data['guideNumber'],
                guideAddress=form.cleaned_data['guideAddress'],
                guideEmail=form.cleaned_data['guideEmail'],
                guideUserName=form.cleaned_data['guideUserName'],
                guidePassword=form.cleaned_data['guidePassword'],
                guideReEnterPassword=form.cleaned_data['guideReEnterPassword'],
                guidePhoto=form.cleaned_data['guidePhoto'],
                guideCertifiedDocument=form.cleaned_data['guideCertifiedDocument'],
            )
            messages.success(request, "Your data has been submitted successfully!")
            return redirect('form')  
        else:
            messages.error(request, "Please correct the errors in the form.")
    else:
        form = forms.localGuide()
    return render(request, "firstApp/localTourist.html", {"form": form})

def login(request):
    if request.method == "POST":
        phone_number = request.POST.get("phone_number")  
        password = request.POST.get("password")  
        

        user = formModel.objects.filter(guideNumber=phone_number, guidePassword=password).first()

        
        if user:
            return redirect('localVendor')  
        else:
            messages.error(request, "Invalid phone number or password.")
    
    return render(request, "firstApp/loginPage.html")


def local_vendor(request):
    return render(request, "firstApp/localVendor.html")

# @login_required
# def add_address(request):
#     if request.method == 'POST':
#         form = AddressForm(request.POST)
#         if form.is_valid():
#             address = form.save(commit=False)
#             address.user = request.user  # Associate the address with the logged-in user
#             address.save()
#             return redirect('profile')  # Redirect to a page showing the user's profile
#     else:
#         form = AddressForm()
#     return render(request, 'firstApp/add_address.html', {'form': form})

@login_required
def add_product(request):
    if request.method == 'POST':
        form = AddProduct(request.POST)
        if form.is_valid():
            product = form.save(commit=False)
            product.user = request.user
            product.save()
            return redirect('profile')
    else:
        form = AddProduct()
    return render(request, 'firstApp/add_product.html', {'form': form})

# @login_required
# def add_tradition(request):
#     if request.method == 'POST':
#         form = TraditionForm(request.POST)
#         if form.is_valid():
#             tradition = form.save(commit=False)
#             tradition.user = request.user
#             tradition.save()
#             return redirect('profile')
#     else:
#         form = TraditionForm()
#     return render(request, 'firstApp/add_tradition.html', {'form': form})

@login_required
def profile(request):
    # Fetch user-specific data from the database
    user_address = UserAddress.objects.filter(user=request.user)
    user_products = UserProduct.objects.filter(user=request.user)
    user_traditions = UserTradition.objects.filter(user=request.user)

    # Fetch basic user information
    user = request.user  # Get the logged-in user
    username = user.username
    email = user.email
    phone = user.profile.phone_number  # Assuming there's a Profile model with a phone_number field

    # Render the profile page with the fetched data
    return render(request, 'firstApp/profile.html', {
        'username': username,
        'email': email,
        'phone': phone,
        'user_address': user_address,
        'user_products': user_products,
        'user_traditions': user_traditions,
    })

@login_required
def manage_info(request):
    user = request.user
    # Get the user's profile information
    profile = user.profile

    # Get products and traditions added by the user
    products = UserProduct.objects.filter(user=user)
    traditions = UserTradition.objects.filter(user=user)

    return render(
        request,
        'manage_info.html',
        {
            'user': user,
            'profile': profile,
            'products': products,
            'traditions': traditions,
        }
    )

def save_product(request):
    if request.method == 'POST':
        form = AddProduct(request.POST)
        if form.is_valid():
            product = form.save(commit=False)
            product.user = request.user  
            product.save()
            return redirect('localVendor')  
    else:
        form = AddProduct()

    return render(request, 'firstApp/localVendor.html', {'form': form})


def user_profile(request):
    user = request.user
    products = Product.objects.filter(user=user)  
    return render(request, 'profile.html', {'user': user, 'products': products})

def talbarahipage(request):
    return render(request,'firstApp/talbarahi.html')


def search(request):
    query = request.GET.get('query', '')  
    return render(request, 'search.html', {'query': query})