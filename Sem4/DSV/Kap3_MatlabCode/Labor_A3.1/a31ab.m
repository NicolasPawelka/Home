% A 3.1 FIR Filter, Faltung, Matched-Filter

% a) Überprüfen Sie Ihr Ergebnis aus Punkt (2), (6) in Matlab. 
%
% b) Überlagern Sie dem Rechtecksignal ein Rauschen und führen Sie die beiden 
%    Filterungen erneut aus. Beschreiben Sie die jeweils unterschiedliche Wirkung
%    der Filter bzgl. Rauschminderung und Kantenveränderung.

% Hier neue Matlab-Funktionen: conv, rand

%% a) Punkt (2)
figure (1)
x = [1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0]; % Rechteckpulsfolge 
h = [1 1 1]/3; % Impulsantwort des gleitenden Mittelwerts
y = conv (x, h); % Faltung von x mit h
subplot(5,1,1); stem (0:1:length(x)-1, x, '.'); title('Eingangssignal');
xlim([0 length(y)-1]);
subplot(5,1,2); stem (0:1:length(h)-1, h, '.'); title('Impulsantwort');
xlim([0 length(y)-1]);
subplot(5,1,3); stem (0:1:length(y)-1, y, '.'); title('Ausgangssignal');

%% a) Punkt (6)
h2 = [1 -1]; % Impulsantwort des zweiten Filters
y2 = conv (x,h2); % Faltung von x mit h2
subplot(5,1,4); stem (0:1:length(h2)-1, h2, '.'); title('Impulsantwort 2');
xlim([0 length(y)-1]);
subplot(5,1,5); stem (0:1:length(y2)-1, y2, '.'); title('Ausgangssignal 2');
xlim([0 length(y)-1]);

%% b) Punkt (2)
figure (2)
xr = x + rand(1,length(x)); % Rechtecksignal mit Rauschen überlagern 
yr = conv(xr,h); % Faltung von xr mit h
subplot(5,1,1); stem (0:1:length(xr)-1, xr, '.'); title('verrauschtes Eingangssignal');
xlim([0 length(yr)-1]);
subplot(5,1,2); stem (0:1:length(h)-1, h, '.'); title('Impulsantwort');
xlim([0 length(yr)-1]);
subplot(5,1,3); stem (0:1:length(yr)-1, yr, '.'); title('Ausgangssignal');

%% b) Punkt (6)
y2r = conv(xr,h2); % Faltung von xr mit h2
subplot(5,1,4); stem (0:1:length(h2)-1, h2, '.'); title('Impulsantwort 2');
xlim([0 length(yr)-1]);
subplot(5,1,5); stem (0:1:length(y2r)-1, y2r, '.'); title('Ausgangssignal 2');
xlim([0 length(yr)-1]);
