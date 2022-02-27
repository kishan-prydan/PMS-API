from django.contrib import admin
from django.urls import path
from api import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', views.index, name='Home'), 
    path('Home/', views.index, name='Home'),
    path('about/', views.about, name='about'),
    path('services/', views.services, name='services'),
    path('contact/', views.contact, name='contact'),
]
