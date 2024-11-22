from django.contrib import admin
from django.urls import path
from firstApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),  
    path('forms/', views.form, name='form'),  
    path('login/', views.login, name='loginPage'),    
    path('local-vendor/', views.local_vendor, name='localVendor'), 
    path('add-products/', views.add_product, name='add_product'),
    path('profile/', views.profile, name='profile'), 
    path('save-product/', views.save_product, name='save_product'),
    path('talbarahipage/', views.talbarahipage, name='talbarahipage'),  
    path('search/', views.search, name='searchPage'),
]
