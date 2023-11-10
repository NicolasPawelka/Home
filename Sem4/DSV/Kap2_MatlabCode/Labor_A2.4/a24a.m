% Aufgabe 2.4 (Matlab)

% Das Spektrum des kontinuierlichen Rechteckimpuls ist bekanntermaflen durch die si-
% Funktion gegeben. Versuchen Sie dies durch Berechnung der DFT eines
% zeitdiskreten Rechteckimpulses zu approximieren. Vergleichen Sie verschiedene
% Vorgehensweisen.

% a) Ausgangspunkt sei der folgende zeitdiskrete Rechteckimpuls:
% x(k) = 1 für 0 =< k =< 19 und x(k) = 0 für 20 =< k =< 49
% Berechnen Sie die DFT und stellen Sie dar.

% Funktionen: ones, zeros, c = [a b], fft, abs, subplot, plot ... 

% Rechteckimpuls
x1 = [ones(1,20) zeros(1,30)];
k1 = (0:1:49);
X1 = ????
subplot (3,1,1); plot (k1,X1); xlabel ('Pulsbreite: 20 Samples / Nullen: 30 Samples')

% Hinweis: Keine Abtastfrequenz gegeben, daher Darstellung nur über Index k