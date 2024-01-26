% Aufgabe 4.3  Echtzeit-Filter mit Sound-Input und Sound-Output

% Es soll eine blockbasierte Filterung des Mikrofonsignals vom Audio-Input 
% in Echtzeit realisiert werden. Das gefilterte Signal soll ebenso in Echtzeit 
% über den Audio-Output des Rechners an einen Kopfhörer ausgegeben werden. 
% Dazu werden wieder verschiedene Realisierungsmethoden verglichen.
 
% Achtung: 
% Diese Implementierung nutzt die Data Aquisition Toolbox und benötigt zusätzlich    
% das Hardware Support Package für Microsoft® (Windows® Sound cards)
% To install the Support Package for the required driver:
% - On the MATLAB® Home tab, in the Environment section, click Add-Ons > Get Hardware Support Packages.
% - In the Add-On Explorer, scroll to Refine by Type and check Hardware Support Packages.
% - Under Filter by Vendor, check Microsoft. 
% - Click the support package for Windows Sound Cards.

fs = 8000; % Abtastrate
blockLength = 1024; % f) Länge der Signalblöcke in Abtastwerten 

%% ---------------------------------------------------
% Tiefpass Filterdesign 
N = 49; % Filterordnung 
fgn = 0.3; % Grenzfrequenz des TP (auf fs/2 normiert) 0 < fgn < 1
b = fir1(N, fgn, 'low'); % FIR Tiefpassfilter der Ordnung N entwerfen
a = 1;

%% ---------------------------------------------------
% Plotfenster für Zeitsignale vorbereiten
close all
figure;
subplot(2,1,1) % Plot für Inputsignal
hold on
global h_time_domain_plot1;
h_time_domain_plot1 = stem(nan, nan, '.'); % Leeres Plotfenster erstellen
xlabel('Sample')
ylabel('Amplitude')
title('Eingangssignal')
xlim([0 blockLength-1]);
ylim([-0.5 0.5]);

subplot(2,1,2) % Plot für gefiltertes Signal
hold on
global h_time_domain_plot2;
h_time_domain_plot2 = plot(nan, nan); % Leeres Plotfenster erstellen
xlabel('Sample')
ylabel('Amplitude')
title('Gefiltertes Signal')
xlim([0 blockLength-1]);
ylim([-0.5 0.5]);

%% ---------------------------------------------------
% Setup Device for Audioinput & -output -> Device-Objekt dAIO
dAIO = daq('directsound'); % Create Data Acquisition Device interface object for Windows Sound
dAIO.Rate = fs; % Scan rate (= sample rate)

% Add Mono Input Channel
% daqlist % zeigt die verfügbaren Audio-Devices an
addinput(dAIO, 'Audio0', 1, 'Audio'); % (bei Fehlern alternativ z.B.: 'Audio1')

% Set Callback Function for Input   
dAIO.ScansAvailableFcnCount = blockLength; % Anzahl der Samples, die gesammelt werden bis Callback-Funktion ausgeführt wird
dAIO.ScansAvailableFcn = @(src, event) audioInputCallback(src,event, b,a);

% Add Mono Output Channel
% daqlist % zeigt die verfügbaren Audio-Devices an
addoutput(dAIO, 'Audio2', 1, 'Audio'); % ((bei Fehlern alternativ z.B.: 'Audio3')

% Output-Queue mit Dummynullen füllen, damit Out und In synchron starten können 
% Anzahl der "Null-Blöcke" muss theoretisch mindestens 1 sein, ...
% Hängt praktisch von Rechendauer der Filterung, sowie Auslastung des PCs ab. 
nBlk = 4; % ??? d) f)

dummy = zeros(floor(nBlk*blockLength),1); 
preload(dAIO,dummy);

%% ---------------------------------------------------
% Audioinput & -output starten 
disp('Pfeifen oder sprechen Sie ins Mikrofon...');
disp('... zum Beenden schließen Sie das Plotfenster.');

start(dAIO,'continuous'); % Nicht-blockierender Funktionsaufruf

% Während der erste Block von Samples vom A/D-Wandler in einer Input-Queue "gesammelt" wird, 
% wird der erste "Null-Block" von der Output-Queue an den D/A-Wandler ausgegeben.


