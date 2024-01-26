% Aufgabe 4.3  Echtzeit-Filter mit Sound-Input und Sound-Output

% Es soll eine blockbasierte Filterung des Mikrofonsignals vom Audio-Input 
% in Echtzeit realisiert werden. Das gefilterte Signal soll ebenso in Echtzeit 
% �ber den Audio-Output des Rechners an einen Kopfh�rer ausgegeben werden. 
% Dazu werden wieder verschiedene Realisierungsmethoden verglichen.
 
% Unter Nutzung von sequentiellen, synchronen Funktionen in Standard-Matlab:
% a) Machen Sie das gegebene Programm durch eine minimale Erg�nzung so lauff�hig,
%    dass es zun�chst nur das Signal vom A/D-Wandler unver�ndert an den 
%    D/A-Wandler ausgibt. 
% b) Pr�fen Sie das Programm, indem Sie l�ngere Zeit in das Mikro pfeifen 
%    oder sprechen und sich das Signal �ber Kopfh�rer zeitgleich anh�ren. 
%    Was stellen Sie fest? 
%    Dieser Realisierungsansatz ist so nicht brauchbar. Woran liegt das?

fs = 8000; % Abtastrate
blockLength = 4096; % L�nge der Signalbl�cke in Abtastwerten 
blockDuration = blockLength / fs; % Signalblockdauer in sec.

% ---------------------------------------------------
% Tiefpass Filterdesign 
N = 49; % Filterordnung 
fgn = 0.3; % Grenzfrequenz des TP (auf fs/2 normiert) 0 < fgn < 1
b = fir1(N, fgn, 'low'); % designs an N'th order lowpass filter.

% ---------------------------------------------------
% Plotfenster f�r Zeitsignale vorbereiten
close all
figure;
subplot(2,1,1) % Zeitsignal Input
hold on
time_domain_plot1 = plot(nan, nan, '.'); % Leeres Plotfenster erstellen
xlabel('Sample')
ylabel('Amplitude')
xlim([0 blockLength-1]);
%ylim([-0.25 0.25]); % evt. fest einstellen

subplot(2,1,2) % Zeitsignal Output
hold on
time_domain_plot2 = plot(nan, nan, '.'); % Leeres Plotfenster erstellen
xlabel('Sample')
ylabel('Amplitude')
xlim([0 blockLength-1]);
%ylim([-0.25 0.25]); % evt. fest einstellen

% ---------------------------------------------------
% Audiorecorder vorbereiten
recorder = audiorecorder(fs,16,1); 

disp('Speak into microphone now and listen to earphones...');
disp('... Press Ctrl-C to stop.');

% ---------------------------------------------------
% Endlos-Schleife (im Command-Window abbrechbar durch CTRL-C)
while 1
    % Recorder nimmt vom Audio-Input f�r blockDuration sec. auf
    recordblocking(recorder, blockDuration); % blockierender Funktionsaufruf 
    % Aufgenommenen Signalblock vom Recorder holen
    x = getaudiodata(recorder);
    % Signalblock in existierendem Plotfenster darstellen
    set(time_domain_plot1, 'XData', 0:length(x)-1, 'YData', x)
    % Signalblock filtern
    y = x;
    set(time_domain_plot2, 'XData', 0:length(y)-1, 'YData', y)
    drawnow % Aktualisieren des Plots erzwingen
    % Gefilterten Block von Abtastwerten am Audio-Output ausgeben
    sound(y, fs); % blockierender Funktionsaufruf
end 
