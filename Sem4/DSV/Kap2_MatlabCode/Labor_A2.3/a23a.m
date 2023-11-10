% Aufgabe 2.3.a (Matlab)

% Aus einem unbekannten Signal wurde durch Abtastung mit 10 kHz ein
% endlicher Signalausschnitt (Datei: aufg23.mat) entnommen. 
% Von dem Signal ist bekannt, dass es sich um eine Überlagerung von reinen 
% Sinusschwingungen handelt. Die Frequenzen dieser Sinusschwingungen sollen
% ermittelt werden. 
% Dabei sollen zur Spektralanalyse 4 Vorgehensweisen verglichen werden. 

% a) Verlängern der Dauer des Signalausschnitts:
% Betrachten Sie zunächst den Signalausschnitt mit den ersten 50 Abtastwerten.
% Erweitern Sie dann den Analyseausschnitt auf 150 Werte und betrachten Sie schließlich
% den kompletten Signalausschnitt von 450 Werten. Berechnen Sie jeweils die DFT, 
% stellen Sie das Betragsspektrum dar und vergleichen Sie! Erklären Sie die Unterschiede!
% (Erstellen Sie zu Beginn in Matlab die Frequenzachsen in Hz. Ebenso bei b) - d) )

% Funktionen: fft, abs, load , subplot, stem ... 
% -------------------------------------------------------------------------

%% Laden des unbekannten Signals von Datei 
load aufg23.mat  % Das Signal wird automatisch im Vektor x angelegt !

% Analyse mit 50 Werten ...
k_50=0:49;
x_50 = x(1:50);
X_50 = abs(fft(x_50));
subplot (3,1,1); stem (k_50, X_50);
ylabel ('Abs( FFT(x(1:50)) )');

%% Die oben realisierte Graphik zeigt das Spektrum über dem Index k.
% Ändern Sie die x-Achse, so dass das Spektrum über der Frequenz in Hz
% dargestellt wird.
Fs=10000; % Abtastfrequenz
df = Fs/50; % Frequenzauflösung
f_50 = k_50 * df; % Frequenzachse in Hz
subplot (3,1,1); stem (f_50, X_50);
ylabel ('Abs( FFT(x(1:50)) )');
title ('Variation der Analysedauer');

%% Weitere Analyse mit 150 Werten ...
k_150=0:149;
df =Fs/150 ; % Frequenzauflösung
f_150= k_150 * df;
x_150= x(1:150);
X_150= abs(fft(x_150));
subplot (3,1,2); stem (f_150, X_150);
ylabel ('Abs( FFT(x(1:150)) )');

%% Weitere Analyse mit 450 Werten ...
k_450= 0:449;
df = Fs/450; % Frequenzauflösung
f_450= k_450 * df;
x_450 = x(1:450);
X_450 = abs(fft(x_450));
subplot (3,1,3); stem (f_450, X_450);
ylabel ('Abs( FFT(x(1:450)) )');

%% -------------------------------------------------------------------------
% Zusätzlich: Darstellung der Zeitsignale
plotOverTime(x, x_50, x_150, x);
