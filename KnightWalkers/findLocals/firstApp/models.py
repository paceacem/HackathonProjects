from django.db import models
import os
from django.contrib.auth.models import User
from django.utils.text import slugify

class formModel(models.Model):
    guideName = models.CharField(max_length=100)
    guideNumber = models.CharField(max_length=10)
    guideAddress = models.CharField(max_length=100)
    guideEmail = models.EmailField(max_length=100)
    guideUserName = models.CharField(max_length=15)
    guidePassword = models.CharField(max_length=32)
    guideReEnterPassword = models.CharField(max_length=32)
    guidePhoto = models.ImageField(upload_to="guide_photos/", blank=True, null=True)
    guideCertifiedDocument = models.FileField(upload_to="guide_certified_docs/", blank=True, null=True)

    def save(self, *args, **kwargs):
        current_count = formModel.objects.count() + 1
        if self.guidePhoto:
            ext = os.path.splitext(self.guidePhoto.name)[-1]
            self.guidePhoto.name = f"guide_photos/{current_count}_photo{ext}"
        if self.guideCertifiedDocument:
            ext = os.path.splitext(self.guideCertifiedDocument.name)[-1]
            self.guideCertifiedDocument.name = f"guide_certified_docs/{current_count}_document{ext}"
        super().save(*args, **kwargs)

    def __str__(self):
        return self.guideName

class UserAddress(models.Model):
    user = models.ForeignKey( formModel, on_delete=models.CASCADE)
    address = models.TextField()

    def __str__(self):
        return f"{self.user.username}'s Address"

class UserProduct(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=255)
    product_description = models.TextField()


    def __str__(self):
        return f"{self.user.username}'s Product: {self.product_name}"

class UserTradition(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    tradition_name = models.CharField(max_length=255)
    tradition_description = models.TextField()

    def __str__(self):
        return f"{self.user.username}'s Tradition: {self.tradition_name}"
    
class Product(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='products')
    productName = models.CharField(max_length=100)
    productDescription = models.TextField()
    

    def __str__(self):
        return self.productName

class Service(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    duration = models.DurationField(blank=True, null=True)
    
    def __str__(self):
        return self.name

class TouristBlog(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=250)
    content = models.TextField()
    location = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    slug = models.SlugField(unique=True, max_length=255)
    cover_image = models.ImageField(upload_to='blog_covers/', blank=True, null=True)
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)
    
    def __str__(self):
        return self.title

class BlogComment(models.Model):
    blog = models.ForeignKey(TouristBlog, related_name='comments', on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"Comment by {self.author.username} on {self.blog.title}"
