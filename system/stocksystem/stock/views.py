from django.shortcuts import render, redirect
from .models import *
from .forms import *
# Create your views here.

def index(request):
    return render(request, 'index.html')

def display_basen(request):
    items = Basen.objects.all()
    context = {
        'items' : items,
        'header' : 'Basen'
    }
    return render(request, 'index.html', context)

def display_saeuren(request):
    items = Saeuren.objects.all()
    context = {
        'items' : items,
        'header' : 'Säuren'
    }
    return render(request, 'index.html', context)

def display_metalle(request):
    items = Metalle.objects.all()
    context = {
        'items' : items,
        'header' : 'Metalle'
    }
    return render(request, 'index.html', context)

def add_basen(request):
    if request.method == 'POST':
        form = BasenForm(request.POST)

        if form.is_valid():
            form.save()
            return redirect('/display_basen')
    else:
        form = BasenForm()
        return render(request, 'add_new.html', {'form':form})
    
def add_saeuren(request):
    if request.method == 'POST':
        form = SaeurenForm(request.POST)

        if form.is_valid():
            form.save()
            return redirect('/display_saeuren')
    else:
        form = SaeurenForm()
        return render(request, 'add_new.html', {'form':form})

def add_metalle(request):
    if request.method == 'POST':
        form = MetalleForm(request.POST)

        if form.is_valid():
            form.save()
            return redirect('/display_metalle')
    else:
        form = MetalleForm()
        return render(request, 'add_new.html', {'form':form})