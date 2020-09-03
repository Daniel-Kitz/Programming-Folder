# Hallo Frau Mauch, das hier wird höchstwahrscheinlich die erste Datei sein,
# die Sie von mir bekommen. Damit wir beide auf dem selben Stand sind wieder-
# hole ich hier nochmal die Aufgabenstellung:
#
# "Eine Rakete soll von egal welchem Punkt auf der Erde fliegen und mithilfe
# des Gravitationsfeldes des Mondes seine Flugrichtung zu einem anderen Planeten
# ändern"
# 
# Hier eine kleine Erläuterung zu meines Grundgedanken und der Berechnung:
# Die Rakete muss dann starten, wenn ungefähr Vollmond ist, da das der Perfekte Winkel ist
# um den Mond als Lenkelement zu benutzen (Quelle: NASA "Main Lunar Math"). Da sich der Mond-
# zyklus immer im selben Takt wiederholt (29.5 Tage) müsste man die einzelnen Mondphasen zu bestimmten 
# Monatstagen binden und dann durch eine Datumsabfrage im Programm bestimmen wie viel unterschied
# zwischen dem heutigen Tag und dem Perfekten Tag besteht. Somit ist der Startpunkt herrausgefunden.
# Einfachheitshalber benutze ich in diesem Programm ein Modul "PyLunar", welches die Zeit bis zum nächsten
# Vollmond ausgibt.
#
# Als nächstes benötige ich Fg des Mondes. Diese berechne ich mit: Fg = y*((m1-m2)/r**2) 
# Damit die Rakete nicht auf den Mond kracht muss Fg = Fz gelten, dabei ist Fz = m2*((v**2)/r).
# Um also eine Geschwindigkeit auszurechnen mit der die Rakete fliegen darf muss ich Fz=Fg nach
# v freistellen: 
#
# v = math.sqrt(y*(m1/r))
# 
# Die Masse der Rakete(m2) spielt absolut keine Rolle, da sich diese in jedem Falle bei Fz = Fg wegkürzt.
# 
# Um nun bestimmen zu können wann die Rakete sich an der richtigen Stelle befindet, um weiterzufliegen muss man
# den auf dem Umfang des Kreises liegenden Punkt finden, der aus einem 90° Winkel der Verbindungslinie der Mittel-
# punkte der Planeten herrausgefunden werden kann (siehe skizze).
#  
