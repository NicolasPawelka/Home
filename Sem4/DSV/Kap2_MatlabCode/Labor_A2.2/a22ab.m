% Aufgabe 2.2 a,b) (Matlab)

% Im folgenden sollen Sinussignale unterschiedlicher Frequenz abgetastet und deren DFT-Spektrum 
% berechnet werden. ‹berlegen Sie jeweils zun‰chst, welches Ergebnis Sie erwarten und erkl‰ren 
% Sie sich die berechneten Graphiken.

% a) Zun‰chst sei x(t) = cos (2pi f0 t) mit f0 = 1 Hz. Stellen Sie 5 Perioden dieses 
%    kontinuierlichen Signals dar. Welche Dauer tmax in sec. hat der dargestellte Ausschnitt? 

% b) x(t) wird mit fa = 10 Hz abgetastet. Wie groﬂ ist der Abtastabstand dt? 
%    Berechnen und stellen Sie die entsprechende Folge x[k] = x(kdt) =cos (2pi f0 k dt) dar. 
%    Berechnen Sie aus x[k] die DFT X[n] und stellen Sie Real- und Imagin‰rteil dar.
%    Wie erkl‰rt sich der dargestellte Imagin‰rteil?

% Funktionen: cos, fft, real, imag, abs, plot, stem, subplot, ...
%% a)
f0 = 1;
tmax = 5; % Dauer des Zeitausschnitts in sec.
t = 0:0.01:tmax; % Zeitvektor von 0 bis tmax in 0.01 sec Schritten
x = cos (2*pi*f0*t); 
subplot (4,1,1); 
plot (t, x);
ylabel ('x(t) = cos(2\pi f0 t)');
title ('Kontinuierliches Zeitsignal');
%% b)
fa = 10;
dt = 0.2; % Abtastabstand
kmax = tmax/dt;
k=0:1:(kmax-1); % Indexvektor von 0 bis kmax-1 in 1-er Schritten
x1 = cos (2*pi*f0*k*dt); 
subplot (4,1,2); 
stem (k, x1, '.');   
ylabel ('x1[k] = cos(2\pi f0 k dt)');
title ('Abgetastetes Zeitsignal');

%% b) Standard-Darstellung des Spektrums in Matlab (0 <= Omega < 2pi)
X1_dft = fft(x1); % Errechnet aus Vektor mit Abtastwerten x1 einen Vektor mit spektralen St¸tzstellen X1_dft 
subplot (4,1,3); 
stem (k, real(X1_dft), '.');
ylabel ('Real( DFT(x1) )');
title ('Eine Periode des periodischen Spektrums (0 \leq \Omega < 2 \pi) ');
subplot (4,1,4); 
stem (k, imag(X1_dft), '.');
ylabel ('Imag( DFT(x1) )');
axis([0 25 -15 15])

%% b) Alternative Darstellung des Spektrums (-pi <= Omega < pi)
 %X1_dft = fft(x1);
 %X1_dft= fftshift(X1_dft);
 %k=-25:1:24;
 %subplot (4,1,3); 
 %stem (k, real(X1_dft), '.');
 %ylabel ('Real( DFT(x1) )');
 %title ('Eine Periode des periodischen Spektrums (- \pi \leq \Omega < \pi) ');
 %subplot (4,1,4); 
 %stem (k, imag(X1_dft), '.');
 %ylabel ('Imag( DFT(x1) )');

