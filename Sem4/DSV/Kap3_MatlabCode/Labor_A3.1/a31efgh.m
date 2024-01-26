% A 3.1 e) - h) FIR Filter, Faltung, Matched-Filter 

% Hier neue Matlab-Funktionen: keine 
% Bereits eingeführte Matlab-Funktionen: conv, zeros, max, abs, rand, fliplr

%% e) Simulation der Ultraschallübertragung
laufzeit = 165; % h)
r = min(0.9, 40/laufzeit); % Reflexionsfaktor
n_rel = 2; % f) Rauschamplitude relativ zum Signalmaximum  

h = [1 zeros(1,(laufzeit)) r]; %  Impulsantwort der Ultraschallübertragung
m = (0:1:20); % Sendesignal = Sägezahn 

% Senden und Empfangen
messdauer = 180; % Feste Messdauer von 180 Werten
x = conv(m,h); % Empfangssignal = Faltung von Sendesignal mit Impulsantwort der Ultraschallübertragung
x = [x zeros(1, messdauer-length(x))];
x = x(1:messdauer); % Messdauer begrenzen auf eingestellten Wert
n_amp = n_rel * max(abs(m)); % Amplitude des Rauschens
xr = x + (n_amp * rand(1,length(x))); % Additives Rauschen (gleichverteilte Zufallszahlen)

%% e) Matched Filter (Einzelmessung)
% Matched Filter (= Korrelation) zur Detektion des Echosignals
minv = fliplr(m); % Sägezahn umklappen
y = conv(xr,minv) ; % Matched Filter (= Faltung mit gespiegeltem Sägezahn) 
y = y /max(abs(y)); % Normierung auf +- 1

% Darstellung
k = 0:1:length(y)-1;
subplot (4,1,1);
stem(k(1:length(m)), m, '.'); 
xlim([0 length(y)]);
title ('Gesendeter Sägezahn');
subplot (4,1,2);
stem(k(1:length(xr)), xr, '.');
xlim([0 length(y)]);
title ('Empfangenes Signal mit Echo und Rauschen');
subplot (4,1,3);
stem(k(1:length(y)), y, '.');
title ('Ergebnissignal des Matched Filters');

%% g) Matched Filter mit Mittelung von Einzelmessungen
N = 20; % Anzahl Messungen zur Mittelung
ym = zeros(size(y));
for n=1:N
    xr = x + n_amp*rand(1,length(x)); % Empfangssignal + Rauschen
    subplot (4,1,2);
    stem(k(1:length(xr)), xr, '.');
    xlim([0 length(y)]);
    y = conv( xr, minv ); % Matched Filter (= Faltung mit gespiegeltem Sägezahn) 
    y = y / max(abs(y)); % Normierung auf +- 1
    subplot (4,1,3);
    stem(k(1:length(y)), y, '.');
    title ('Ergebnissignal des Matched Filters (Einzelmessung)');
    pause(0.2)
    ym = ym + y;    
end
ym = ym/N;
subplot (4,1,4);
stem(k(1:length(y)), ym, '.');
title ('Ergebnissignal der Mittelung');

