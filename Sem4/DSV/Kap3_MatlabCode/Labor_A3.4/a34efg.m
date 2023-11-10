% Aufgabe 3.4 (Inverse Filterung)

% Hier neue Matlab-Funktionen: (ones)
% Bereits eingeführte Matlab-Funktionen: filter, impz

%% e) Empfangenes bipolares (+1 -1) Datensignal nach echobehaftetem Kanal 

load Empfangssignal.mat % Empfangssignal steht in y zur Verfügung 
k = 0:1:length(y)-1;

figure(3)
subplot (3,1,1)
stem (k, y, '.');
plot (k, y);
axis([0 200 -2 2]); grid;
title ('Empfangenes bipolares Datensignal');

%% f) Filterung mit idealem Inversfilter
% Impulsantwort des echobehafteten Kanals
hk = [1 zeros(1,7) 0.6 zeros(1,4) 0.4]; 
% Ideales Inversfilter
binv = [1];
ainv = [hk];

z = filter(binv, ainv, y);

subplot (3,1,2)
plot (k, z); % stem (k, z, '.'); %alternativ
axis([0 200 -2 2]); grid;
title ('Ideal entzerrtes Empfangssignal');

%% g) Filterung mit approximiertem Inversfilter (FIR-Filter)
nOrd = 15; % Ordnung des FIR-Filters
happ = impz(1, hk, nOrd+1)'; % abgebrochene Impulsantwort des idealen Inversfilters

bapp= [happ];
aapp= [1];
z2 = filter (bapp, aapp, y);

subplot (3,1,3)
plot (k, z2); % stem (k, z2, '.'); %alternativ
axis([0 200 -2 2]); grid;
title ('Approximiert entzerrtes Empfangssignal');

