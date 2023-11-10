function [x, d, t] = SimulateMeasurements()
% Simulation der Messung der Herzschlagsignale an Thorax und Abdomen
% x - Sensorsignal am Thorax
% d - Sensorsignal am Abdomen
% t - Vektor mit Messzeitpunkten 

tmax = 15; % Signaldauer 15 sec 
fa = 4000; % Abtastrate 4000 Hz
dt = 1/fa;
t = 0:dt:tmax-dt; % Zeitachse

%% Ursprüngliche Herzschlag-Signale von Mutter und Kind erzeugen

% Ursprüngliches Herzschlag-Signal der Mutter erzeugen
figure (1)
x1 = 3.5*ecg(2700); % Eine Periode (der Länge 2700) eines stückweise linearen EKG-Signals
nRep = ceil(length(t) / 2700); 
x1 = repmat(x1, 1, nRep); % 12 mal wiederholen
mhb = sgolayfilt(x1,0,49); % Interpolieren
mhb = mhb(1:length(t));
subplot(2,1,1)
plot(t, mhb); % c)
axis([0 2.5 -4 4]);  grid; 
xlabel('Time [sec]');  ylabel('Voltage [mV]');
title('Orignal Maternal Heartbeat Signal'); % c)

% Ursprüngliches Herzschlag-Signal des Kindes erzeugen
x2 = 0.25*ecg(1725); % Eine Periode (der Länge 1725) eines stückweise linearen EKG-Signals
nRep = ceil(length(t) / 1725) + 1; 
x2 = repmat(x2, 1, nRep); % 19 mal wiederholen
fhb = sgolayfilt(x2,0,25); % Interpolieren
rndPhase = 658; %round(1725*rand(1)); % zufällige Phasenverschiebung zum Mutter-Signal
fhb = fhb(rndPhase:rndPhase+length(t)-1);
subplot(2,1,2)
plot(t, fhb); % c)
axis([0 2.5 -1 1]);  grid; 
xlabel('Time [sec]');  ylabel('Voltage [mV]');
title('Orignal Fetal Heartbeat Signal'); % c)
 

%% Messung der Sensorsignale simulieren

% FIR-Filter mit 10 zufälligen Koeffizienten als Modell für den
% Ausbreitungspfad von Thorax zu Abdomen
bProp = 0.55 * [0 1.0 -0.5 -0.8 1.0  -0.1 0.2 -0.3 0.6 0.1]; 
% Überlagerung der Herzschläge von Mutter und Kind plus Rauschen
% ergibt das abdominal gemessenes Signal (Bauch)
d = filter(bProp,1,mhb) + fhb + 0.02*randn(size(mhb)); % r)

% Pectoral gemessenes Signal (Brust) = Referenzsignal
% Herzschläge der Mutter plus Rauschen
x = mhb + 0.02*randn(size(mhb)); % r)

end