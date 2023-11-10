% Aufgabe 2.2 c) (Matlab)
% Im folgenden sollen Sinussignale unterschiedlicher Frequenz abgetastet und deren DFT-Spektrum 
% berechnet werden. Überlegen Sie jeweils zunächst, welches Ergebnis Sie erwarten und erklären 
% Sie sich die berechneten Graphiken.

% c) Das DFT-Spektrum X[n] (Real- und Imaginärteil) soll über der Frequenz in Hz dargestellt werden. 
%    Berechnen Sie dazu einen geeigneten Vektor als Frequenzachse. Welche Frequenzauflösung df
%    (= Abstand zwischen zwei spektralen Stützstellen) ergibt sich für die gegebene Abtastfrequenz fa 
%    und Anzahl spektraler Stützstellen?

% Funktionen: cos, fft, real, imag, abs, plot, stem, subplot, ...
%% a)
f0 = 1;
tmax = 5; % Dauer des Zeitausschnitts in sec.
t = 0:0.01:tmax;
x = cos (2*pi*f0*t); 
subplot (4,1,1); 
plot (t, x);
ylabel ('x(t) = cos(2\pi f0 t)');
title ('Kontinuierliches Zeitsignal');
%% b)
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
% X1_dft = fft(x1);
% df = 0.2; % Frequenzauflösung
% f = k * df; % Frequenzachse in Hz
% subplot (4,1,3); 
% stem (f, real(X1_dft), '.');
% ylabel ('Real( DFT(x1) )');
% title ('Eine Periode des periodischen Spektrums (0 \leq f (in Hz) < fa)');
% subplot (4,1,4); 
% stem (f, imag(X1_dft), '.');
% ylabel ('Imag( DFT(x1) )');
% axis([0 5 -15 15])

%% Alternative Darstellung des Spektrums (-fa/2 <= f (in Hz) < fa/2)
X1_dft = fft(x1);
X1_dft= fftshift(X1_dft);
k=-25:1:24;
df = 0.2; % Frequenzauflösung
f = k * df; % Frequenzachse in Hz
subplot (4,1,3); 
stem (f, real(X1_dft), '.');
ylabel ('Real( DFT(x1) )');
title ('Eine Periode des periodischen Spektrums (-fa/2 \leq f (in Hz) < fa/2)');
subplot (4,1,4); 
stem (f, imag(X1_dft), '.');
ylabel ('Imag( DFT(x1) )');

