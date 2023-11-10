% A 3.2  Hall-Effekt, IIR Filter, Differenzengleichung, PN-Diagramm

% Ein spezielles IIR-Filter mit folgender Systemfunktion realisiert 
% einen einfachen akustischen Halleffekt:  H(z) = 1 / (1-cz^-N)
%
% g) Laden Sie das  Sprachsignal „bbauer8s.wav“. Setzen Sie N = 8 und c = 0.8 
%    und filtern Sie das geladene Sprachsignal entsprechend. 
%    Wo finden sich im Spektrogramm die unter f) festgestellten typischen 
%    Effekte des Hall-Frequenzgangs wieder? (Dazu kann es helfen, den  
%    Frequenzgang über der Frequenz in Hz darzustellen)  
%    Hören Sie sich das gefilterte Signal im Vergleich zum Originalsignal an. 
%    Achten Sie auf die spektralen Verformungen.
% h) Nun soll das Hallfilter so dimensioniert werden, dass der Höreindruck 
%    eines großen halligen Raums entsteht. Berechnen Sie dazu N so, dass bei
%    der Abtastfrequenz von 8 kHz eine Hallperiode von 125 ms erzeugt wird.
%    (Dazu hilft es die Zeitachse der Impulsantwort in sec. darzustellen)
%    Die Halldämpfung soll c=0.6 betragen. Filtern Sie das Sprachsignal 
%    dementsprechend erneut und hören Sie wieder das Ergebnis an. Anders 
%    als in g) ist die Wirkung des Halls nun für das Ohr hauptsächlich im 
%    zeitlichen Verlauf wahrnehmbar!

% Hier neue Matlab-Funktionen:  audioread, (soundsc)
% Bereits eingeführte Matlab-Funktionen: filter, impz, zplane, freqz

clc
clear
close all hidden

%% Originalsignal laden und darstellen
[x,fs]=audioread('bbauer8s.wav');  % Sprachsignal aus Datei in Vektor x laden
SpectrogramExample(x,fs); % Spektrogramm des Originalsignals darstellen 
% Durch Drücken des Play-Button ist anhören über Kopfhörer möglich...
% soundsc(x,fs)  % Alternative um Signal anzuhören -> Kopfhörer !

%% g) h)
c = 0.6;
N = 1000;
a = [1 zeros(1,N-1) -c]; % Vektor mit rekursiven Koeffizienten ai !!Achtung: Vorzeichen!! 
b = [1]; % Vektor mit Transversal-Koeffizienten (hier nur b0=1)

y = filter(b,a,x); % Sprachsignal verhallen
SpectrogramExample(y,fs); % Spektrogramm darstellen 
% Durch Drücken des Play-Button ist anhören über Kopfhörer möglich...

%% zusätzlich Impulsantwort, PN-Diagramm, Frequenzgang darstellen
subplot(3,1,1);
d = [1 zeros(1,69)]; % Deltaimpuls
h = impz (b, a, 1200) ; % Filter -> Impulsantwort
k = 0:1:length(h)-1;
t = k / fs; % Zeitachse in sec.
stem (t, h, '.');
xlabel ('Zeit in sec.');
title ('Impulsantwort h[k]');
% Alternative Berechnung/Darstellung der Impulsantwort mit spezifischer Matlab-Fkt.
% impz (b, a, 70); % Impulsantwort bis zur Länge 70

subplot(3,1,2);
zplane (b,a); % Pol-Nullstellendiagramm
title ('Pol-Nullstellendiagramm');

subplot(3,1,3);
[H,w] = freqz (b, a, 4096); % Frequenzgang H(w)
k = 0:1:length(w)-1;
f = k * fs/2 / length(w); % Frequenzachse in Hertz für 0 ... fs/2
plot(f, abs(H))
xlabel ('Frequenz in Hz: 0 \leq f < fs / 2');
title ('Frequenzgang |H(f)|');
