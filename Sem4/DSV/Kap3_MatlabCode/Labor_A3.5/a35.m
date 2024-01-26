% Aufgabe 3.5 (3D-Plot der Systemfunktion)

% a) Bestimmen Sie die Systemfunktion H(z) (d.h. Zähler- und Nennerpolynom) für ein Filter mit folgenden Polen und Nullstellen:
%    - Nullstellen:  z1 = 0.9; z2 = -0.5
%    - Pole: z1 = 0.8 + j 0.4; z2 = 0.8 - j 0.4

% b) Nutzen Sie die Matlab-Fkt. magtfiir im gleichen Ordner, um den Betrag der 
%    Systemfunktion als 3-dimensionalen Plot über der z-Ebene darzustellen.

% c) Bestimmen Sie den Frequenzgang des Filters und stellen Sie ihn dar. 

% d) Wie ist der Zusammenhang zwischen Systemfunktion und Frequenzgang, 
%    sowie generell zwischen z-Transformation und DTFT?

% Matlab Funktionen: poly, magtfiir, freqz

clc
close all

% b)
null = [-0.5 0.9];
pole = [0.8+0.4j 0.8-0.4j];
b = poly (null);
a = poly (pole);
magtfiir(b,a,'H(z) über z-Ebene');

% c)
figure
[h,w]=freqz(b,a,512,'whole');
plot(w,abs(h))

% Pol-Nullstellen-Diagramm zum Vergleich
figure
zplane (b,a);