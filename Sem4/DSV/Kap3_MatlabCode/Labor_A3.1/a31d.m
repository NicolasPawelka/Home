% A 3.1 d) FIR Filter, Faltung, Matched-Filter  

% Hier neue Matlab-Funktionen: fliplr, max

%% d)
% Ultraschallempfangssignal laden
load Empfangssignal.mat; % Signal steht in x !!! zur Verf�gung

% Matched Filter (= Korrelation) zur Detektion des Echosignals
m = (0:1:20); % S�gezahn der L�nge 21
minv = fliplr(m); % S�gezahn umklappen
y = conv(x,minv); % Matched Filter (= Faltung mit gespiegeltem S�gezahn) 
y = y / max(abs(y)); % Normierung auf +- 1

% Darstellung
k = 0:1:length(y)-1;
subplot (3,1,1);
stem(k(1:length(m)), m, '.'); 
xlim([0 length(y)]);
title ('Gesendeter S�gezahn');
subplot (3,1,2);
stem(k(1:length(x)), x, '.');
xlim([0 length(y)]);
title ('Empfangenes Signal mit Echo und Rauschen');
subplot (3,1,3);
stem(k(1:length(y)),y,'.');
title ('Ergebnissignal des Matched Filters');
xlim([0 length(y)]);

