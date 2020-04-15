import random

geld = 0
while geld <= 0:
    geld = int(input("Geben Sie ihr Geld an: "))
    if geld <= 0:
        print("Ihr Kontostand muss mehr als 0 betragen um zu spielen!")

while True:
    kredit = -234567890
    print(geld)
    print(kredit)
    while kredit not in range(1, geld):
        kredit = int(input("Bitte geben Sie Ihren Einsatz an: "))
        if kredit not in range(1, geld):
            print("Ihr Einsatz darf nicht 0 sein und kann nicht mehr betragen als Ihr Kontostand!")

    geld = geld-kredit

    print(geld)
    print(kredit)

    wette = 0

    while wette not in range(1,6):
        wette = int(input("Bitte Ihre Wette abgeben: "))
        if wette not in range(1,6):
            print("Ihre Wette muss im Bereich zwischen 1 und 6 stehen!")

    w1 = random.randint(1,6)
    w2 = random.randint(1,6)
    w3 = random.randint(1,6)
    print("DEBUG:", w1, w2, w3)
    zahelnliste = [w1, w2, w3]

    def gewinnberechnung(zahelnliste, wette, kredit, geld):

        n = 0

        for i in zahelnliste:
            if i == wette:
                n += 1

        if n == 1:
            geld = geld+kredit
            print("Sie haben einfach gewonnen. Ihr Kredit beträgt: ", geld)
        elif n == 2:
            kredit *= 2
            geld = geld+kredit
            print("Sie haben zweifach gewonnen! Ihr Kredit beträgt: ", geld)
        elif n == 3:
            kredit *= 3
            geld =  geld+kredit
            print("Sie haben dreifach gewonnen!!! Ihr Kontostand beträgt: ", geld)
        else:
            print("Sie haben verloren. Ihr Kontostand beträgt: ", geld)
        return geld


    geld = gewinnberechnung(zahelnliste, wette, kredit, geld)





