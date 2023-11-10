% audio signal prelude by Marc-Antoine Charpentier (1634-1704)
% Quelle: Martin Werner, Digitale Signalverarbeitung in Matlab 
% dsplab2_2b.m * mw * 10/07/2005
% Mit Oberschwingungen, sowie Attack Delay Sustain Release * feldes * 13/09/2006
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
harmonics = [0 0.2 0.5 5 6 2 0.6 0.4 0.3 0.4];
N = 1/4;    % time scaling
fs = 8000; 	% sampling frequency
music = [];	% define variable for audio signal
for k=1:length(pitch)	% for loop
  L = N*fs*duration(k); % number of samples per tone
  n = 0:L-1;          	% normalized time
  w = (2*pi/fs)*pitch(k); % normalized radian frequency
  s = zeros(1,L);       % initialize tone variable
  for kk=1:length(harmonics)	% inner for loop
    s = s + 0.2*harmonics(kk)*sin(kk*w*n);   % sinusoidal tone
  end
  s = adsr_profile(0.15,0.25,0.9,0.9,0.7,s); % Attack Delay Sustain Release 
  music = [music s];    % concatenate audio signal
end
% sound card output
soundsc(music,fs,16);
% graphics
t=0:length(music)-1; t=t/fs; 	% time scale
FIG1 = figure('Name','Musiksynthese: Obertöne und ADSR',  'NumberTitle', 'off');
plot(t,music)
grid, xlabel('time [s] \rightarrow'), ylabel('audio signal \rightarrow')