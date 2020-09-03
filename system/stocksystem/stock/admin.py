from django.contrib import admin
from .models import *

# Register your models here.
@admin.register(Saeuren, Basen, Metalle)
class ViewAdmin(admin.ModelAdmin):
    pass
