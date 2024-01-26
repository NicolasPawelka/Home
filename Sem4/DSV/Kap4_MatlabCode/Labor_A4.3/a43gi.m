% Aufgabe 4.3  Echtzeit-Filter mit Sound-Input und Sound-Output

% Es soll eine blockbasierte Filterung des Mikrofonsignals vom Audio-Input 
% in Echtzeit realisiert werden. Das gefilterte Signal soll ebenso in Echtzeit 
% über den Audio-Output des Rechners an einen Kopfhörer ausgegeben werden. 
% Dazu werden wieder verschiedene Realisierungsmethoden verglichen.
 
% Unter Nutzung blockbasiert „getakteter“ Objekte der DSP-System-Toolbox:

%% Vorbereitungen
fs = 8000; % Abtastrate
blockLength = 1024; % Länge der Signalblöcke in Samples 
blockDuration = blockLength/fs ;

N = 49; % order of lowpass 
fgn = 0.5; % cutoff frequency of lowpass (relative to fs/2) 0 < fgn < 1
b = fir1(N, fgn, 'low'); % designs an N'th order lowpass filter.
% Create Filter object
htp = dsp.FIRFilter('Numerator', b);

% Initialisierung TimeScope
scope = timescope( ...
    'NumInputPorts',2, ...
    'SampleRate',fs, ... 
    'TimeSpanSource','property','TimeSpan',3*blockDuration, ...
    'TimeSpanOverrunAction','Scroll',...
    'BufferLength',4*blockLength, ...
    'YLimits',[-1 1], ...
    'ShowGrid',true, ...
    'ShowLegend',true, ...
    'ChannelNames',{'Inputsignal', 'Outputsignal'},...
    'Position', [50 600 1000 500]);
show (scope);

% Audio Device Reader und Writer Objekte erzeugen
hadr = audioDeviceReader('SampleRate',fs, 'NumChannels',1, 'SamplesPerFrame',blockLength);
hadw = audioDeviceWriter('SampleRate',hadr.SampleRate);

disp('Speak into microphone now and listen to earphones...');
disp('... close time scope to stop.');

%% Blockbasiert getaktete Verarbeitungsschleife
while isVisible(scope) % Endlos-Schleife, so lange Scope nicht geschlossen
   % Warten bis ein Block von Samples beim Audioreader vorliegt, dann holen
    x = hadr();
   % Block von Samples filtern
   % [y,z] = filter(htp,1,x,z);
    y = step(htp, x);
   % Block von Eingangs- und gefilterten Samples darstellen
   scope(x,y);  
   % Block von Samples an Audiowriter ausgeben (nicht warten)
   step(hadw,y);
end

pause(hadw.BufferSize/hadw.SampleRate);  % Wait for last block to be output completely

release(hadr); % stop audio reader, release resources
release(hadw); % stop audio writer, release resources
release(scope); % stop time scope, release resources
disp('Processing finished.'); 
