% Aufgabe 4.2  Echtzeit-Spektralanalyse von Sound-Input

% Es soll das Mikrofonsignal am Sound-Input des Rechners fortlaufend auf
% seine spektrale Zusammensetzung analysiert werden. 
% Dazu werden verschiedene Realisierungsmethoden verglichen.
% 
% Unter Nutzung von sequentiellen, synchronen Funktionen in Standard-Matlab.
%
% a) Machen Sie das Programm lauff�hig und konfigurieren Sie die Anzahl der
%    Einzelmessungen so, dass f�r 10 sec die spektralen Analysen durchgef�hrt
%    werden. Testen Sie die Lauff�higkeit, in dem Sie bspw. in das Mikrofon 
%    pfeifen und den Plot des Zeitsignals betrachten. 
% b) Erg�nzen Sie das Programm, so dass das log. Betragsspektrum in dB berechnet
%    und angezeigt wird. Sie realisieren so eine Kurzzeit-Fourieranalyse STFT, 
%    vergl. Kap. 2.3. Testen Sie wieder.
%    Optional: Ver�ndern Sie die Schleife �ber die Einzelmessungen in eine 
%    Endlos-Schleife. (Abbrechen k�nnen Sie bspw. durch schlie�en des Plotfensters.)
% c) Verfeinern Sie die spektrale Aufl�sung, in dem Sie die FFT-L�nge vergr��ern.
%    Was m�ssen Sie �ndern, wenn die FFT-L�nge 1024 oder mehr werden soll?  
%    Wie ver�ndert sich dann die Anzahl m�glicher Messungen pro sec.?
%    Was gilt also f�r den Wunsch nach zugleich feiner Frequenz- und Zeitaufl�sung?
% d) Welcher grunds�tzliche Nachteil bleibt auf Grund der hier realisierten 
%    sequentiellen Verarbeitung, d.h. erst Aufnahme, dann FFT-Berechnung und 
%    dann Darstellung bestehen? Vergleichen Sie dazu auch die gem�� der Anzahl der
%    Einzelmessungen zu erwartende Laufzeit von 10 sec. mit der tats�chlichen 
%    Laufzeit. Warum wird sie l�nger?
% e) Beschreiben Sie ein auf Nebenl�ufigkeit basierendes Vorgehen mit paralleler
%    Aufnahme und FFT-Berechnung/Darstellung, das eine l�ckenlose spektrale 
%    Analyse erm�glicht. Welche Bedingung muss die Durchf�hrung aller Berechnungen 
%    f�r Echtzeitf�higkeit dabei einhalten? 

fs = 8000; % Abtastrate 
blockLength = 1000; % L�nge der Signalbl�cke in Abtastwerten 
blockDuration = 0.125; % a) Analysedauer in sec. aus (1) 
measuresPerSecond = 8; % a) Anzahl der Messungen pro sec. aus (1) 
fftLength = 256; % c) FFT-L�nge 

%% ---------------------------------------------------
% Plotfenster f�r Zeitsignal und Spektrum vorbereiten
close all
figure;
subplot(2,1,1) % Zeitsignal
hold on
time_domain_plot = stem(nan, nan, '.'); % Leeres Plotfenster erstellen
xlabel('Sample')
ylabel('Amplitude')
xlim([0 blockLength-1]);
ylim([-0.1 0.1]); % Todo: geeignet justieren!

subplot(2,1,2) % Spektrum
hold on
freq_domain_plot = plot(nan, nan); % Leeres Plotfenster erstellen
xlabel('Frequency (Hz)')
ylabel('dB')
xlim([0 fs/2]) % Darstellung bis fs/2
ylim([-30 30])

% ---------------------------------------------------
% Audiorecorder vorbereiten
recorder = audiorecorder(fs,16,1); 

%% ---------------------------------------------------
% Schleife �ber die Einzelmessungen
 nMeasures = 80; % a) Anzahl der Einzelmessungen f�r 10 sec.
tic % d) Laufzeitmessung starten
for m = 1:nMeasures
 %while 1
    % Recorder nimmt Sound-Input f�r blockDuration sec. auf
     recordblocking(recorder, blockDuration); % a) Passende Funktion suchen bei help audiorecorder 
    % Aufgenommenen Signalblock vom Recorder holen
    x = getaudiodata(recorder);
    % Signal in existierendem Plotfenster darstellen
    set(time_domain_plot, 'XData', 0:length(x)-1, 'YData', x)
    % Teilvektor der L�nge fftLength vom Ende her aus dem Signalblock kopieren 
    x_part = x(1+end-fftLength : end);
    % b) logarithmiertes Betragsspektrum in dB berechnen
    X_fft = fft(x_part);
    X_fft_dB  = 20 * log10(abs(X_fft)); % b)
    % Frequenzachse f�r 0 bis fs/2 berechnen
    df = fs / fftLength; % Frequenzaufl�sung
    k = 0:(fftLength-1);
    f = k * df;  % Frequenzachse in Hz
    % Spektrum in existierendem Plotfenster darstellen
    set(freq_domain_plot, 'XData', f, 'YData', X_fft_dB) % b) 
    drawnow % Aktualisieren des Plots erzwingen
end 
toc % d) Laufzeitmessung beenden -> Ausgabe siehe Command Window