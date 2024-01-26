% Aufgabe 4.1 Blockbasierte Filterung

% Zunächst soll die blockbasierte Filterung implementiert und die Korrektheit
% durch Test mit einem selbstgenerierten Testsignal sichergestellt werden. 

% Nützliche Matlab-Funktionen: filter, floor 
% - for-Schleife 
% - Teilvektor extrahieren: x(idx1:idx2) 
% - Vektoren verketten: c = [a b]

%% a) Testsignal erzeugen
f1 = 2; % Signalfrequenz 1 in Hz
f2 = 15; % Signalfrequenz 2 in Hz
tmax = 3.5; % Dauer des Testsignals in sec.
fa = 100; % Abtastrate in Hz
N = tmax * fa;
% Testsignal x_all berechnen
%...
dt = 0.01;
kmax = N;
k = 0:1:(kmax-1);
x_all = 2 + 4 * sin(2*pi*f1*k*dt) + cos(2*pi*f2*k*dt);
%x_all = fft(test);

% Testsignal x_all darstellen
subplot(2,1,1);
plot(k,x_all,'.-');
ylabel('x[k]');
xlabel('k');
% ...

title ('Testsignal');

%% b) Blockbasierte Realisierung des Filters 
blocksize = 56; %Samples pro Filterung
a = [1];
b = [1 1 1 1 1]/5;
zi = zeros(1, max(length(a), length(b)) - 1);
zf = [];
nBlocks = 6;
% ...

y_all = []; % leerer Vektor für gefilterets Signal
for iblock = 1:nBlocks
    x = x_all((iblock-1)*blocksize+1 : iblock*blocksize); % Sample extrahieren
    [y, zf] = filter(b, a, x, zi); % Filter anwenden
   % [y] = filter(b, a, x ); % Filter anwenden
    y_all = [y_all, y]; % Gefilterten Block an y_all anhängen
    zi = zf;
end
%% c) Gefiltertes Signal y_all darstellen
subplot(2,1,2);
plot(1:numel(y_all),y_all,'.-');
ylabel('y[k]');
xlabel('k');
title ('Blockgefiltertes Signal');
