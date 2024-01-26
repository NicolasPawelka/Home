% Aufgabe 3.7 (Sinusgenerator)

% Mit einem einfachen rekursiven Filter 2. Ordnung kann einen Sinussignal generiert werden. 
% Realisieren Sie dazu ein grenzstabiles System, das nach Anregung mit einem Delta-Impuls 
% eine ungedämpfte Sinus-Schwingung erzeugt.

% a) Es kann hilfreich sein, zunächst mit dem Pol-Nullstellen-Editor von sptool zu experimentieren.

% b) Schreiben Sie dann ihre Lösung als m-file. Stellen Sie dabei die erzeugte Sinus-Schwingung auch graphisch dar. 

% c)Wie kann bei diesem Sinusgenerator, die Schwingfrequenz eingestellt werden?

% Hinweis: Matlab-Funktionen poly, roots, impz, filter, plot

k = -10:1:100;

d = zeros(size(k));
d(11) = 1;  % Deltaimpuls

z = [0 0] % Nullstellen
% p = [????]  % Pole

a = poly (p)
b = poly (z)

yd = filter (b,a,d); % Impulsantwort
subplot (2,1,1); plot (k,yd);
title ('Impulsantwort');

subplot (2,1,2); zplane(b,a);
title ('Pol-Nullstellen-Diagramm');
