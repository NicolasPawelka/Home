% Aufgabe 4.1 Blockbasierte Filterung

% Mit Hilfe der DSP-System-Toolbox ist auch das Handling von wav-Dateien 
% einfach möglich.


%% Preparations
N = 49; % order of lowpass 
fgn = 0.5; % cutoff frequency of lowpass (relative to fa/2) 0 < fgn < 1
b = fir1(N, fgn, 'low'); % designs an N'th order lowpass filter.
% Create Filter object
htp = dsp.FIRFilter('Numerator', b);

% Create Audio objects to read and write wav-files
hafr = dsp.AudioFileReader('serengeti.wav', 'SamplesPerFrame', 512);
hafw = dsp.AudioFileWriter('serengeti_tp.wav', ...
    'FileFormat','wav', 'SampleRate',hafr.SampleRate);

%% Block based processing loop
while ~isDone(hafr)
   x = step(hafr); % read one block of samples from file
   y = step(htp, x); % filter one block of samples
   step(hafw, y); % write one block of samples to file
end
release(hafr); % close input file, release resources
release(hafw); % close output file, release resources

%% Playback filtered signal to soundcard
% Create Audio objects to read wav-file and output to soundcard
hafr = dsp.AudioFileReader('serengeti_tp.wav', 'SamplesPerFrame', 512);
hadw = audioDeviceWriter('SampleRate',hafr.SampleRate);

while ~isDone(hafr)
   y = step(hafr); % read one block of filtered samples from file
   step(hadw,y); % output one block of filtered samples to soundcard
end

pause(hadw.BufferSize/hadw.SampleRate);  % Wait until audio plays to the end
release(hafr); % close input file, release resources
release(hadw);  % close audio output device, release resources
