% Aufgabe 3.9 (Adaptive Filter)

% I. Das Sensorsignal des Herzschlags eines ungeborenen Kindes im Mutterleib soll von der 
%    störenden Überlagerung des mütterlichen Herzschlags befreit werden. Dazu kann ein 
%    zweites am Brustkorb der Mutter abgenommenes Sensorsignal genutzt werden.

% Hier neu bzgl. Matlab: Nutzen von selbstgeschriebenen Funktionen (lmsAdapt.m, SimulateMeasurements.m) 
%                        for-Schleife

%% a) Messung der Sensorsignale simulieren
[x, d, t] = SimulateMeasurements(); %  Thoraxsignal x, Abdomensignal d

figure (2)
subplot(3,1,1)
plot(t,d);
axis([0 2.5 -4 4]); grid;
xlabel('Time [sec]'); ylabel('Voltage [mV]');
title('Measured Signal Abdomen d'); % a)
subplot(3,1,2)
plot(t,x);
axis([0 2.5 -4 4]); grid;
xlabel('Time [sec]'); ylabel('Voltage [mV]');
title('Measured Signal Thorax (Reference Signal) x'); % a)

%% b) Differenz zwischen Thoraxsignal und Abdomensignal darstellen
subplot(3,1,3)
diff = d - x;
plot(t,diff); 
axis([0 2.5 -4 4]); grid;
xlabel('Time [sec]'); ylabel('Voltage [mV]');
title('Difference Signal of Abdomen and Thorax d-x');

%% c),d) Adaptives Filter
figure (3)
N = 10; % Anzahl der Filterkoeffizienten des AF
mu = 0.00002; % d) Adaptionsschrittweite
b = zeros(1,N);
y = zeros(size(x));
e = zeros(size(x));
xk = x(1:N); % aktueller "Subvektor" des Eingangssignals = Filtergedächtnis
for k=N:length(x) % c)
    b = lmsAdapt(b, e(k-1), xk, mu);
    xk = x(k-(N-1):k); % aktueller "Subvektor" des Eingangssignals = Filtergedächtnis
    y(k) = filterOneSample(b, xk);
    e(k) = d(k) - y(k);
end 

subplot(2,1,1)
plot(t,y,'b',t,e,'r'); 
axis([0 7 -2 2]); grid;
xlabel('Time [sec]'); ylabel('Voltage [mV]');
title('Convergence of Adaptive Filter'); % d)
legend('Output Signal of AF y','Error Signal e'); 
subplot(2,1,2)
plot(t,e,'r'); 
axis([6 7.5 -0.5 0.5]); grid;
xlabel('Time [sec]'); ylabel('Voltage [mV]');
title('Steady-State Error Signal e = Estimated Fetal Heartbeat Signal'); % c) und d)
