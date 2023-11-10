% Aufgabe 4.2  Echtzeit-Spektralanalyse von Sound-Input

% Es soll eine fortlaufende Spektralanalyse des Mikrofonsignals am Audio-Input 
% des Rechners realisiert werden. Dazu werden verschiedene Realisierungsmethoden 
% verglichen.
% Unter Nutzung blockbasiert „getakteter“ Objekte der DSP-System-Toolbox.

%% Vorbereitungen
fs = 8000; % Abtastrate
blockLength = 1024; % Länge der Aufnahmeintervalle in Abtastwerten 
fftLength = blockLength;
blockDuration = blockLength/fs ;

%% Initialisierung SpectrumAnalyzer
spectrum_scope = dsp.SpectrumAnalyzer('SampleRate', fs,...
                                       'PlotAsTwoSidedSpectrum', false, ...
                                       'FrequencyResolutionMethod', 'WindowLength', ...     %Frequenzauflösung gemäß Fensterlänge
                                       'WindowLength',blockLength,...                                               
                                       'FFTLengthSource', 'Property',...
                                       'FFTLength', blockLength,... ,                       %>= WindowLength
                                       'ViewType', 'Spectrum and spectrogram',...           %falls beides angezeigt werden soll
                                       'Position', [50 50 1000 500]);

%% Initialisierung TimeScope
time_scope = timescope( ...
    'SampleRate',fs, ... 
    'TimeSpanSource','property','TimeSpan',3*blockDuration, ...
    'TimeSpanOverrunAction','Scroll',...
    'BufferLength',4*blockLength, ...
    'YLimits',[-1 1], ...
    'ShowGrid',true, ...
    'ShowLegend',true, ...
    'ChannelNames',{'Zeitsignal'},...
    'Position', [50 600 1000 500]);

%% Audio Device Reader Objekt erzeugen
hadr = audioDeviceReader('SampleRate',fs, 'NumChannels',1, 'SamplesPerFrame',blockLength);

%% Blockbasiert getaktete Verarbeitungsschleife
tic % Starte Timer
while toc < 60 % Solange der Timer nicht 60 sec. erreicht hat ... 
   % Warten bis ein Block von Abtastwerten beim Audio Reader vorliegt, dann holen
    x = hadr();
    % Zeitsignal und Spektrum darstellen
    time_scope(x);
    spectrum_scope(x);
end
 
release(hadr); % stop audio Reader, release resources
release(time_scope);
release(spectrum_scope);
