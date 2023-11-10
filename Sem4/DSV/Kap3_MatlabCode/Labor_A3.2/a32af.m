% A 3.2  Hall-Effekt, IIR Filter, Differenzengleichung, PN-Diagramm

% Ein digitales IIR-Filter mit folgender Systemfunktion realisiert 
% einen einfachen akustischen Halleffekt:  H(z) = 1 / (1-cz^-N)
%
% a) Überprüfen Sie Punkt (5), indem Sie in Matlab das Signal x filtern
%    und plotten lassen.
% b) Überprüfen Sie Punkt (3) und lassen Sie Matlab  die Impulsantwort 
%    für c = 0.95  bzw. c = 1 plotten. 
% c) Lassen Sie Matlab das Pol-Nullstellen-Diagramm plotten. Begründen Sie
%    an Hand dessen erneut, ob das Filter stabil ist (c = 0.95  bzw. c = 1).
% d) Stellen Sie den Frequenzgang dar (c = 0.95  bzw. c = 1). 
% e) Wie verändern sich Impulsantwort und Frequenzgang, wenn N = 8 oder 16
%    gesetzt wird?
% f) Welche typischen Eigenschaften in Impulsantwort und Frequenzgang können 
%    Sie für den Halleffekt aus dieser Aufgabe festhalten?

% Hier neue Matlab-Funktionen: filter, (impz,) zplane, freqz, roots

clc
clear
close all

%% a)
c = 0.5; 
x = [2 3 2 4 zeros(1,16)]; % Eingangsignal
b = [1]; % Vektor mit Transversal-Koeffizienten (hier nur b0=1)
a = [1 0 0 0 -c]; % Vektor mit rekursiven Koeffizienten ai !!Achtung: Vorzeichen!!
y = filter(b, a, x); % Filter (in Direktform II transponiert)
stem (0:1:length(y)-1, y, '.');
title ('Ausgangssignal y[k]');

%% b)
figure
subplot(3,1,1);
c = 0.95; % alternativ: c = 1; 
d = [1 zeros(1,69)]; % Deltaimpuls
b = [1]; % Vektor mit Transversal-Koeffizienten (hier nur b0=1)
N = 8; % e) alternativ N = 8 oder 16 
a = [1 zeros(1,N-1) -c]; % Vektor mit rekursiven Koeffizienten ai !!Achtung: Vorzeichen!!
h = filter(b,a,d); % Filtern von Deltaimpuls -> Impulsantwort
stem (0:1:length(h)-1, h, '.');
title ('Impulsantwort h[k]');
% Alternative Berechnung/Darstellung der Impulsantwort mit spezifischer Matlab-Fkt.
% impz (b, a, 70); % Impulsantwort bis zur Länge 70

%% c)
roots (a)  % Polstellen berechnen -> s. Konsole 
subplot(3,1,2);
zplane (b,a); % Pol-Nullstellendiagramm
title ('Pol-Nullstellendiagramm');

%% d)
subplot(3,1,3);
[H,w] = freqz (b, a, 512); % Frequenzgang H(w)
plot(w, abs(H))
xlim([0 pi]);
xlabel ('0 \leq \Omega  < \pi');
title ('Frequenzgang |H(\Omega)|');
