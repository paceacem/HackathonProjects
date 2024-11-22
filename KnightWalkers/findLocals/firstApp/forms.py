from django import forms
# from .models import UserAddress, UserProduct, UserTradition
from firstApp.models import Product

class localGuide(forms.Form):
    guideName = forms.CharField(max_length=100, label="Name")
    guideNumber = forms.CharField(max_length=10, label="Phone Number")
    guideAddress = forms.CharField(max_length=100, label="Address")
    guideEmail = forms.EmailField(label="Email Address")
    guideUserName = forms.CharField(max_length=15, label="Your username")
    guidePassword = forms.CharField(
        max_length=32,
        widget=forms.PasswordInput,
        label="Enter password",
    )
    guideReEnterPassword = forms.CharField(
        max_length=32,
        widget=forms.PasswordInput,
        label="Re-enter your password",
    )
    guidePhoto = forms.ImageField(label="Your Photo")
    guideCertifiedDocument = forms.FileField(
        label="Your Certified Document (e.g., Citizenship, Passport, etc.)"
    )

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("guidePassword")
        reenter_password = cleaned_data.get("guideReEnterPassword")

        if password != reenter_password:
            raise forms.ValidationError("Passwords do not match. Please try again.")

        return cleaned_data

# class AddressForm(forms.ModelForm):
#     class Meta:
#         model = UserAddress
#         fields = ['address']

# class ProductForm(forms.ModelForm):
#     class Meta:
#         model = UserProduct
#         fields = ['product_name', 'product_description']

# class TraditionForm(forms.ModelForm):
#     class Meta:
#         model = UserTradition
#         fields = ['tradition_name', 'tradition_description']

class AddProduct(forms.ModelForm):
    productName = forms.CharField(max_length=100, label="Product Name")
    productDescription = forms.CharField(
        widget=forms.Textarea, label="Product Description"
    )

    class Meta:
        model = Product  # Replace 'Product' with your model class
        fields = ['productName', 'productDescription']
