from django.db import models
from datetime import date
# Create your models here.

class Chemikalien(models.Model):

    name = models.CharField(max_length=100, blank=False)
    lagerort = models.CharField(max_length=100, blank=False)
    menge = models.IntegerField(blank=False)
    
    arten = (
        ('ML', 'Milliliter'),
        ('L', 'Liter'),
        ('G', 'Gramm'),
        ('KG', 'Kilogramm')
    )    

    art = models.CharField(max_length=10, choices=arten, default='ml')
    kaufdatum = models.DateField(default=date.today)
    
    choices = (
        ('VORHANDEN', 'Dieser Stoff befindet sich in der Sammlung'),
        ('LEER', 'Dieser Stoff befindet sich nicht mehr in der Sammlung'),
        ('BESTELLT', 'Diser Stoff wurde bestellt und befindet sich in der Lieferung')
    )

    status = models.CharField(max_length=10, choices=choices, default="LEER")

    class Meta:
        abstract = True

    def __str__(self):
        return 'Name : {0} - Menge : {1}{2}'.format(self.name,self.menge, self.art)

class Saeuren(Chemikalien):
    pass

class Basen(Chemikalien):
    pass

class Metalle(Chemikalien):
    pass