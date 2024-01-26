% Aufgabe 2.3.c (Matlab)

% Aus einem unbekannten Signal wurde durch Abtastung mit 10 kHz ein
% endlicher Signalausschnitt (Datei: aufg23.mat) entnommen. 
% Von dem Signal ist bekannt, dass es sich um eine Überlagerung von reinen 
% Sinusschwingungen handelt. Die Frequenzen dieser Sinusschwingungen sollen
% ermittelt werden. 
% Dabei sollen zur Spektralanalyse 4 Vorgehensweisen verglichen werden. 

% c) Fensterung:
% Gewichten Sie den Abschnitt mit den ersten 150 Abtastwerten jeweils mit
% Rechteckfenster, Hann-Fenster und Bartlett-Fenster. Berechnen Sie die DFT, stellen
% Sie das Betragsspektrum dar und vergleichen Sie! Erklären Sie die
% Unterschiede!

% Funktionen: zeros, fft, abs, subplot, stem, plot, ... 
%             BOXCAR, BARTLETT, BLACKMAN, CHEBWIN, HAMMING, HANN, KAISER and TRIANG.
% Operationen: ' sowie .*
% -------------------------------------------------------------------------

%% Laden des unbekannten Signals von Datei
load aufg23.mat   % Das Signal wird automatisch im Vektor x angelegt !

Fs=10000; % Abtastfrequenz
k_150=0:149;
df = Fs/150; % Frequenzauflösung
f_150= k_150 * df; % Frequenzachse
x_150=x(1:150);

%% Analyse mit Rechteckfenster
X_150 = abs(fft(x_150));
subplot (3,1,1); stem (f_150, X_150);
ylabel ('Abs( FFT(x_rect(1:150)) )');
title ('Fensterung');

%% Analyse mit Hanning-Fenster
x_150_hann = x_150.*hanning(150)';  % Achtung: Syntax bitte genau verstehen
X_150_hann = abs(fft(x_150_hann));
subplot(3,1,2);stem(f_150,X_150_hann);
ylabel('Abs(FFT(x_hann(1:150))');

%% Analyse mit Bartlett-Fenster
x_150_bart = x_150.*bartlett(150)';
X_150_bart = abs(fft(x_150_bart));
subplot(3,1,3);stem(f_150,X_150_bart);
ylabel('Abs(FFT(x_bart(1:150))');
%% -------------------------------------------------------------------------
% Zusätzlich: Darstellung der Zeitsignale
plotOverTime(x, x_150, x_150_hann, x_150_bart);
