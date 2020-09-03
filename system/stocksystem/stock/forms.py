from django import forms
from .models import *


class BasenForm(forms.ModelForm):
    class Meta:
        model = Basen
        fields = ('name', 'lagerort', 'menge', 'art', 'kaufdatum', 'status')
        
    def __init__(self, *args, **kwargs):
        super(BasenForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'


class SaeurenForm(forms.ModelForm):
    class Meta:
        model = Saeuren
        fields = ('name', 'lagerort', 'menge', 'art', 'kaufdatum', 'status')

    def __init__(self, *args, **kwargs):
        super(SaeurenForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'

class MetalleForm(forms.ModelForm):
    class Meta:
        model = Metalle
        fields = ('name', 'lagerort', 'menge', 'art', 'kaufdatum', 'status')

    def __init__(self, *args, **kwargs):
        super(MetalleForm, self).__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'