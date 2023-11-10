% Aufgabe 2.3.b (Matlab)

% Aus einem unbekannten Signal wurde durch Abtastung mit 10 kHz ein
% endlicher Signalausschnitt (Datei: aufg23.mat) entnommen. 
% Von dem Signal ist bekannt, dass es sich um eine �berlagerung von reinen 
% Sinusschwingungen handelt. Die Frequenzen dieser Sinusschwingungen sollen
% ermittelt werden. 
% Dabei sollen zur Spektralanalyse 4 Vorgehensweisen verglichen werden. 

% b) Zeropadding:
% Berechnen Sie zun�chst wie unter a) die DFT der ersten 50 Abtastwerte. Erweitern
% Sie nun diesen Signalausschnitt auf 150 bzw. 450 Werte, indem Sie Nullen
% anh�ngen und berechnen Sie auch f�r die erweiterte L�nge jeweils die DFT. Stellen
% Sie f�r alle 3 Signale das Betragsspektrum dar und vergleichen Sie!
% Erkl�ren Sie die Unterschiede!

% Funktionen: zeros, fft, abs, c=[c b], subplot, stem, plot, ... 
% -------------------------------------------------------------------------

%% Laden des unbekannten Signals von Datei
load aufg23.mat    % Das Signal wird automatisch im Vektor x angelegt !

Fs=10000; % Abtastfrequenz

%% Analyse mit 50 Werten (wie a))
k_50=0:49;
df = Fs/50; % Frequenzaufl�sung
f_50 = k_50*df; % Frequenzachse in Hz
x_50=x(1:50);
X_50 = abs(fft(x_50));
subplot (3,1,1); stem (f_50, X_50);
ylabel ('Abs( FFT(x(1:50)) )');
title ('Zeropadding');

%% Zeropadding auf 150 Werte
k_150=0:149;
df = Fs/150; % Frequenzaufl�sung
f_150= k_150 * df % Frequenzachse
x_150=[x_50 zeros(1,100)]; % H�ngt an x_50 100 Nullen an
X_150 =abs(fft(x_150));
subplot (3,1,2); stem (f_150, X_150);
ylabel ('Abs( FFT(x(1:150)) )');

%% Zeropadding auf 450 Werte
k_450=0:449;
df = Fs/450; % Frequenzaufl�sung
f_450=k_450 * df;
x_450=[x_50 zeros(1,400)];
X_450=abs(fft(x_450));
subplot (3,1,3); stem (f_450, X_450);
ylabel ('Abs( FFT(x(1:450)) )');

%% -------------------------------------------------------------------------
% Zus�tzlich: Darstellung der Zeitsignale
plotOverTime(x, x_50, x_150, x_450);
