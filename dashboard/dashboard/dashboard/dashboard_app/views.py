from django.shortcuts import render
from django.http import HttpResponse

def home(request):
    return render(request, 'dashboard_app/dashboard.html')

def about(request):
    return HttpResponse('<h1>About Us</h1>')