% Aufgabe 3.3 (....)

% Gegeben sei die Differenzengleichung: y[k]= ....
%
% a) Zeichnen Sie die zugehörige Filterstruktur in Direktform II.
%
% b) Bestimmen Sie die Impulsantwort für -10 £ k £ 100 und stellen Sie sie graphisch dar.
%    (Hinweis: Matlab-Funktion filter)
%
% c) Bestimmen Sie die Sprungantwort für -10 £ k £ 100 und stellen Sie sie graphisch dar.
%    (Hinweis: Matlab-Funktion filter)
%
% d) Geben Sie die Systemfunktion H(z) an.
%
% e) Berechnen Sie die Pole und Nullstellen von H(z). 
%    (Hinweis: Matlab-Fkt. roots)
%
% f) Stellen Sie das Pol-Nullstellen-Diagramm dar. 
%    (Hinweis: Matlab-Fkt. zplane)
%
% g) Bestimmen Sie den Frequenzgang und stellen Sie ihn graphisch dar.
%    (Hinweis: Matlab-Fkt. freqz)
%
% h) Bestimmen Sie den Frequenzgang auf dem kompletten Einheitskreis (0 bis 2p)
%
% i) Um welchen Typ von Filter handelt es sich?


% Funktionen:

% ---------------------------------
% b) + c)
k = -10:1:100;

d = zeros(size(k));
d(11) = 1;  % Deltaimpuls

s = [zeros(1,10) ones(1,101)]; % Sprung

a = ?
b = ?

yd = filter (b,a,d); % Impulsantwort
ys = filter (b,a,s); % Sprungantwort

close all;
subplot (2,1,1); plot (k,d,k,yd);
title ('Impulsantwort (grün) und Deltaimpuls (blau)');
subplot (2,1,2); plot (k,s,k,ys);
title ('Sprungantwort (grün) und Einheitssprung (blau)');

% ---------------------------------
% e) + f)
z = roots (b);
p = roots (a);
figure;
zplane(z,p);
title ('Pol-Nullstellen-Diagramm');

% ---------------------------------
% g) + h)
figure;
freqz(b,a,512);
title ('Frequenzgang über normierter Frequenz 0 bis \pi');
figure;
freqz(b,a,512,'whole');
title ('Frequenzgang über normierter Frequenz 0 bis 2\pi');
