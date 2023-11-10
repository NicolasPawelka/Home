% Aufgabe 2.2 d,e,f,g) (Matlab)
% Im folgenden sollen Sinussignale unterschiedlicher Frequenz abgetastet und deren DFT-Spektrum 
% berechnet werden. Überlegen Sie jeweils zunächst, welches Ergebnis Sie erwarten und erklären 
% Sie sich die berechneten Graphiken.

% d) Verändern Sie nun die Frequenz f0 von x(t) derart, dass in den gleichen Zeitausschnitt 
%    genau eine Periode des Cosinus-Signals passt. Überprüfen Sie die Position des spektralen 
%    Peak im DFT-Spektrum.

% e) Setzen Sie nun f0 = 2.25 Hz. Warum wird der spektrale Peak von „Nebenpeaks“ begleitet?  

% f) Wohin bewegt sich der spektrale Peak, wenn die Frequenz des Cosinus-Signals bis zur Nyquistfrequenz 
%    und darüber hinaus gesteigert wird? Probieren Sie es aus. Erhöhen Sie dazu schrittweise f0 
%    (also z.B. f0 = 4 Hz,… 5 Hz, … 6 Hz, … 9 Hz, … 9.8 Hz) 

% g) Wie viele Signalwerte werden für den Fall f0 =  fa / 2 pro Periode abgetastet? 
%    Was fällt beim Vergleich der abgetasteten Zeitsignale für f0 = 9 Hz und f0 = 1 Hz auf?

% Funktionen: cos, fft, real, imag, abs, plot, stem, subplot, ...
%% d) e) f)
f0 = 1;
tmax = 5; % Dauer des Zeitausschnitts in sec.
t = 0:0.01:tmax;
x = cos (2*pi*f0*t); 
subplot (4,1,1); 
plot (t, x);
ylabel ('x(t) = cos(2\pi f0 t)');
title ('Kontinuierliches Zeitsignal');
%%
fa = 10;
dt = 1/fa; % Abtastabstand
kmax = tmax/dt;
k=0:1:(kmax-1);
x1 = cos (2*pi*f0*k*dt); 
subplot (4,1,2); 
stem (k, x1, '.');   
ylabel ('x1[k] = cos(2\pi f0 k dt)');
title ('Abgetastetes Zeitsignal');

%% c) Darstellung des Spektrums (0 <= f (in Hz) < fa)
X1_dft = fft(x1);
df = 0.2; % Frequenzauflösung
f = k * df; % Frequenzachse in Hz
subplot (4,1,3); 
stem (f, real(X1_dft), '.');
ylabel ('Real( DFT(x1) )');
title ('Eine Periode des periodischen Spektrums (0 \leq f (in Hz) < fa)');
subplot (4,1,4); 
stem (f, imag(X1_dft), '.');
ylabel ('Imag( DFT(x1) )');

%% Alternative Darstellung des Spektrums (-fa/2 <= f (in Hz) < fa/2)
% X1_dft = fft(x1);
% X1_dft= fftshift(X1_dft);
% k=-25:1:24;
% df = ???; % Frequenzauflösung
% f = k * df; % Frequenzachse in Hz
% subplot (4,1,3); 
% stem (f, real(X1_dft), '.');
% ylabel ('Real( DFT(x1) )');
% title ('Eine Periode des periodischen Spektrums (-fa/2 \leq f (in Hz) < fa/2)');
% subplot (4,1,4); 
% stem (f, imag(X1_dft), '.');
% ylabel ('Imag( DFT(x1) )');

