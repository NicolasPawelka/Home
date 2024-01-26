% Aufgabe 2.2.h (Matlab)

% Im folgenden sollen Sinussignale unterschiedlicher Frequenz abgetastet und deren DFT-Spektrum 
% berechnet werden. Überlegen Sie jeweils zunächst, welches Ergebnis Sie erwarten und erklären 
% Sie sich die berechneten Graphiken.

% h) "Synthetisieren" Sie ein Zeitsignal x[k] (der Länge 50) durch Setzen der Spektralanteile 
%    im Frequenzvektor und anschließende Inverse DFT. Das Signal soll sich aus zwei 
%    Cosinus-Signalen zusammensetzen, und zwar bei f1 = 1 Hz und f2 = 1.4 Hz. 
%    Die Amplitude der Spektralanteile sei jeweils 15.

% Funktionen: cos, fft, real, imag, abs, plot, stem, subplot, ...

%% Als Beispiel wird zunächst die Synthese des Cosinussignal x1 
% aus Teilaufgabe a) mit f1 = 1 Hz ausgeführt. 
k=0:1:49;
fa=10;
df=fa/50; % df = 0.2 Hz
% Es wird ein Nullvektor der Länge 50 generiert. Er ist unser DFT-Spektrum.
X1_dft=zeros(1,50);
% Aus a) ist folgendes bekannt:
% Spektrallinie im Realteil bei 1 Hz = 5 * df
X1_dft(6)=15; % Achtung: Matlab indiziert mit 1 beginnend
% Spektrale Wiederholung bei fa - 1 Hz = 9 Hz = 45 *df 
X1_dft(46)=15; % Achtung: Matlab indiziert mit 1 beginnend
% Synthese des Cosinussignals x1 mit der Frequenz f1 durch inverse FFT
x1=ifft(X1_dft);
figure(1)
subplot (3,1,1); 
stem(k, X1_dft, '.')
title ('Eine Periode des periodischen Spektrums (0 \leq \Omega < 2 \pi)');
subplot (3,1,2); 
stem(k, real(x1), '.')   
title ('Realteil des synthetisierten Zeitsignals');
subplot (3,1,3); 
stem(k, imag(x1), '.')   % Wann könnte hier ein Imaginärteil ungleich Null auftreten?
title ('Imaginärteil des synthetisierten Zeitsignals');

%% Nun muss die zweite Frequenzkomponente f2 = 1.4 Hz hinzugefügt werden.
% Weiteren Code ergänzen ...
X1_dft = zeros(1,50);
X1_dft(8) = 15;
X1_dft(44) = 15;
x1 = ifft(X1_dft);


subplot (3,1,1); 
stem(k, X1_dft, '.')
title ('Eine Periode des periodischen Spektrums (0 \leq \Omega < 2 \pi)');
subplot (3,1,2); 
stem(k, real(x1), '.')   
title ('Realteil des synthetisierten Zeitsignals');
subplot (3,1,3); 
stem(k, imag(x1), '.') % Imaginärteil sollte Null sein. Was ist der Grund, wenn ungleich Null auftritt?
title ('Imaginärteil des synthetisierten Zeitsignals');
