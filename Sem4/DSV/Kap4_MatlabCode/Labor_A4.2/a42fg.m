% Aufgabe 4.2  Echtzeit-Spektralanalyse von Sound-Input

% Es soll eine fortlaufende Spektralanalyse des Mikrofonsignals am Audio-Input 
% des Rechners realisiert werden. Dazu werden verschiedene Realisierungsmethoden 
% verglichen.

% Achtung: 
% Diese Implementierung nutzt die Data Aquisition Toolbox und benötigt zusätzlich    
% das Hardware Support Package für Microsoft® (Windows® Sound cards)
% To install the Support Package for the required driver:
% - On the MATLAB® Home tab, in the Environment section, click Add-Ons > Get Hardware Support Packages.
% - In the Add-On Explorer, scroll to Refine by Type and check Hardware Support Packages.
% - Under Filter by Vendor, check Microsoft. 
% - Click the support package for Windows Sound Cards.

fs = 8000; % Abtastrate
blockLength = 1024; % Länge der Aufnahmeintervalle in Abtastwerten 

%% ---------------------------------------------------
% Plotfenster für Zeitsignal und Spektrum vorbereiten
close all
figure;
subplot(2,1,1) % Zeitsignal
hold on
global h_time_domain_plot;
h_time_domain_plot = stem(nan, nan, '.'); % Leeres Plotfenster erstellen
xlabel('Sample')
ylabel('Amplitude')
xlim([0 blockLength-1]);
ylim([-0.5 0.5]);

subplot(2,1,2) % Spektrum
hold on
global h_freq_domain_plot;
h_freq_domain_plot = plot(nan, nan); % Leeres Plotfenster erstellen
xlabel('Frequency (Hz)')
ylabel('dB')
xlim([0 fs/2]) % Darstellung bis fs/2
ylim([-30 20])

%% ---------------------------------------------------
% Setup Device for Audioinput -> Device-Object dAI
dAI = daq('directsound'); % Create Data Acquisition Device interface object for Windows Sound
dAI.Rate = fs; % Scan rate (= sample rate)

%dAI.UserData.h_fd_plot = h_freq_domain_plot; % Alternativ zur Vermeidung globaler Variable

% Add Mono Input Channel
% daqlist % zeigt die verfügbaren Audio-Devices an
addinput(dAI, 'Audio0', 1, 'Audio'); % (bei Fehlern alternativ z.B.: 'Audio1')

% Set Callback Function for Input   
dAI.ScansAvailableFcnCount = blockLength; % Anzahl der Samples, die gesammelt werden bis Callback-Funktion ausgeführt wird
dAI.ScansAvailableFcn = @audioInputCallback;

%% ---------------------------------------------------
% Audioinput starten (und später stoppen) 
disp('Pfeifen oder sprechen Sie ins Mikrofon...');
tic % g)
start(dAI,'continuous'); % Nicht-blockierender Funktionsaufruf

pause (10); % 10 sec. warten, während parallel die Audioaufnahme läuft

stop(dAI); % Audioinput stoppen
toc % g)
disp('... Audio Input regulär beendet.');

%% ---------------------------------------------------
% Audio Input Device Object löschen
clear dAI
