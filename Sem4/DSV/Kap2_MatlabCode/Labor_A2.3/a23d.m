% Aufgabe 2.3.d (Matlab)

% Aus einem unbekannten Signal wurde durch Abtastung mit 10 kHz ein
% endlicher Signalausschnitt (Datei: aufg23.mat) entnommen. 
% Von dem Signal ist bekannt, dass es sich um eine Überlagerung von reinen 
% Sinusschwingungen handelt. Die Frequenzen dieser Sinusschwingungen sollen
% ermittelt werden. 
% Dabei sollen zur Spektralanalyse 4 Vorgehensweisen verglichen werden. 

% Erhöhen der Abtastfrequenz: Der gleiche Signalausschnitt wurde nun mit 
% doppelter Abtastfrequenz abgetastet. (Datei aufg23_2.mat laden!)  
% Berechnen Sie die DFT entsprechend a) für Signalausschnitte von 
% 100, 300 und 900 Abtastwerte.  Stellen Sie das Betragsspektrum dar und 
% vergleichen Sie mit a)! Erklären Sie die Unterschiede! 

% Funktionen: fft, abs, load , subplot, stem ... 
% -------------------------------------------------------------------------

%% Laden des unbekannten Signals von Datei 
load aufg23_2.mat   % Das Signal wird automatisch im Vektor x angelegt !

Fs=20000; % Abtastfrequenz

%% Analyse mit 100 Werten ...
k_100= 0:99;
df = Fs/100 % Frequenzauflösung
f_100 = k_100 * df; % Frequenzachse
x_100 = x(1:100);
X_100 = abs(fft(x_100));
subplot (3,1,1); stem (f_100, X_100);
ylabel ('Abs( FFT(x(1:100)) )');
title ('Doppelte Abtastfrequenz');

%% Weitere Analyse mit 300 Werten ...
k_300=0:299;
f_300 = k_300 * df; % Frequenzachse
x_300= x(1:300);
X_300 = abs(fft(x_300));
subplot(3,1,2);stem(f_300,X_300);
ylabel('x 300');

%% Weitere Analyse mit 900 Werten ...
k_900=0:899;
f_900 = k_900 * df; % Frequenzachse
x_900= x(1:900);
X_900 = abs(fft(x_900));
subplot(3,1,3);stem(f_900,X_900);
ylabel('x 900');

%% -------------------------------------------------------------------------
% Zusätzlich: Darstellung der Zeitsignale
plotOverTime(x, x_100, x_300, x_900);
