% audio signal prelude by Marc-Antoine Charpentier (1634-1704)
% Quelle: Martin Werner, Digitale Signalverarbeitung in Matlab 
% dsplab2_2b.m * mw * 10/07/2005
% Verkettung von reinen Sinustönen * feldes * 13/09/2006
A = 220; 	% pitch in Hz
Dh = A*2^(5/12); 	% high
C = A*2^(3/12);
B = A*2^(2/12);
G = A*2^(-2/12);
Fis = A*2^(-3/12);
E = A*2^(-5/12);
D = A*2^(-7/12);
pitch    = [D G G A B G Dh B B C Dh C B C Dh A G A B A];
duration = [2 2 1 1 2 2 4  3 1 2 1  1 1 1 2  1 1 1 1 2];
N = 1/4;    % time scaling
fs = 8000; 	% sampling frequency
music = [];	% define variable for audio signal
for k=1:length(pitch)	% for loop
  L = N*fs*duration(k); % number of samples per tone
  n = 0:L-1;          	% normalized time
  w = (2*pi/fs)*pitch(k); % normalized radian frequency
  s = sin(w*n);   % sinusoidal tone
  music = [music s];    % concatenate audio signal
end
% sound card output
soundsc(music,fs,16);
% graphics
t=0:length(music)-1; t=t/fs; 	% time scale
FIG1 = figure('Name','Musiksynthese: Verkettung von reinen Sinustönen',  'NumberTitle', 'off');
plot(t,music)
grid, xlabel('time [s] \rightarrow'), ylabel('audio signal \rightarrow')