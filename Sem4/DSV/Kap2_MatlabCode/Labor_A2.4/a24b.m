% Aufgabe 2.4 (Matlab)

% Das Spektrum des kontinuierlichen Rechteckimpuls ist bekanntermaflen durch die si-
% Funktion gegeben. Versuchen Sie dies durch Berechnung der DFT eines
% zeitdiskreten Rechteckimpulses zu approximieren. Vergleichen Sie verschiedene
% Vorgehensweisen.

% b) Zeropadding:
% Erweitern Sie nun schrittweise den Signalabschnitt, indem Sie Nullen anhängen und
% berechnen Sie für die erweiterte Länge jeweils die DFT. Stellen Sie für alle Signale
% das Betragsspektrum dar und vergleichen Sie!

% Funktionen: ones, zeros, c = [a b], fft, abs, subplot, plot ... 

% Hinweis: Keine Abtastfrequenz gegeben, daher Darstellung nur über Index k

% Rechteckimpuls aus a)
x1 = [ones(1,20) zeros(1,30)];
k1 = (0:1:49);
X1 = abs(fft(x1));
subplot (3,1,1); plot (k1,X1); xlabel ('Pulsbreite: 20 Samples / Nullen: 30 Samples')

% Ergänzen Sie entsprechend Aufg. 2.3 b) 

% Rechteckimpuls mit Zeropadding 
x2 = [ones(1,20) ??? ];
k2 = (0:1:149);
???

% Rechteckimpuls mit sehr langem Zeropadding 
x3 = [ones(1,20) ??? ];
k3 = (0:1:999);
???
