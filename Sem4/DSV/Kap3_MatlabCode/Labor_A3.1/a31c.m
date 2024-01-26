% A 3.1 FIR Filter, Faltung, Matched-Filter

% Hier neue Matlab-Funktionen: medfilt1

%% Medianfilter für Originalrechteckpulsfolge
x = [1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0]; % Rechteckpulsfolge 
subplot(4,2,1); stem (0:1:length(x)-1, x, '.'); title('Eingangssignal');
maxlen = length(x) + 3;
xlim([0 maxlen-1]);

y = medfilt1 (x); % Medianfilter der Ordnung 3
subplot(4,2,7); stem (0:1:length(y) - 1,y, '.'); title('Ausgangssignal (Medianfilter)');
xlim([0 maxlen-1]);

%% Medianfilter für verrauschte Rechteckpulsfolge mit Ausreisser
xr = x + 0.4*rand(1,length(x)); % Rechteckpulsfolge mit Rauschen überlagern 
xr(14)=3.9; xr(23)=3.9; % zwei Ausreisser einfügen
subplot(4,2,2); stem (0:1:length(xr)-1, xr, '.'); title('verrauschtes Eingangssignal mit zwei Ausreissern');
xlim([0 maxlen-1]); ylim([0 4]);

yr = medfilt1 (xr); % Medianfilter der Ordnung 3
subplot(4,2,8); stem (0:1:length(yr)-1, yr, '.'); title('Ausgangssignal (Medianfilter)');
xlim([0 maxlen-1]); ylim([0 4]);

%% Aktivieren Sie zum Vergleich mit den Filtern von a) die folgenden Zeilen ...
% h1 = [1/3 1/3 1/3]; % Impulsantwort des gleitenden Mittelwerts
% y1 = conv (x, h1); % Faltung von x mit h1
% h2 = [1 -1]; % zweite Impulsantwort
% y2 = conv (x, h2); % Faltung von x mit h2
% subplot(4,2,3); stem (0:1:length(y1)-1, y1, '.'); title('Ausgangssignal (gleitender Mittelwert)');
% subplot(4,2,5); stem (0:1:length(y2)-1, y2, '.'); title('Ausgangssignal (h=[1 -1])');
% xlim([0 maxlen-1]);

%% Zum Vergleich mit den Filtern von b) aktivieren Sie die folgenden Zeilen ...
% y1r = conv (xr, h1); % Faltung von xr mit h1
% y2r = conv (xr, h2); % Faltung von xr mit h2
% subplot(4,2,4); stem (0:1:length(y1r)-1, y1r, '.'); title('Ausgangssignal (gleitender Mittelwert)');
% ylim([0 4]);
% subplot(4,2,6); stem (0:1:length(y2r)-1, y2r, '.'); title('Ausgangssignal (h=[1 -1])');
% xlim([0 maxlen-1]); ylim([min(y2r) 4]);

