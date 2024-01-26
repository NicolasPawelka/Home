% Aufgabe 3.4 (Inverse Filterung)

% Hier neue Matlab-Funktionen: (impz)
% Bereits eingeführte Matlab-Funktionen: filter, zplane, freqz

%% a) (2) Systemfunktion Hk(z) und Impulsantwort des Kanals 
figure(1)
len = 40;
k = 0:(len-1);
b = [1 0 0 0.8]; % Vektor mit Zähler von Hk(z) -> Transversal-Koeffizienten 
a = [1]; % Vektor mit Nenner von Hk(z) -> rekursive Koeffizienten
h = impz(b, a, len); % Impulsantwort bis zur Länge len berechnen
subplot (5,1,1)
stem (k, h, '.');
title ('Impulsantwort des Kanals');

%% a) (3) Empfangssignal für Sendesignal [1 1 1 1] berechnen
x = [1 1 1 1 zeros(1,len-4)];
y = filter(b,a,x); % Sendesignal mit "Kanal filtern"
y = y + 0.1 * rand(size(y)); % d) Rauschen addieren
subplot (5,1,2)
stem (k, y, '.');
title ('Empfangenes Signal');

%% a) (5) Empfangssignal durch Inverses Filter schicken 
binv=[1]; % Vektor mit Zähler von HI(z) -> Transversal-Koeffizienten 
ainv=[1 0 0 0.8]; % Vektor mit Nenner von HI(z) -> rekursive Koeffizienten
z = filter(binv, ainv, y);  % Empfangenes Signal mit Inversem Filter filtern
subplot (5,1,3)
stem (k, z, '.');
title ('Signal nach Inversem Filter');

%% a) (6) Impulsantwort des Inversen Filters 
hinv = impz(binv, ainv,len);
subplot (5,1,4)
stem (k, hinv, '.');
title ('Impulsantwort des Inversen Filters');
% Approximierte Impulsantwort: nach 10 Werten abbrechen
happ = hinv(1:10);
happ = happ'; % für zplane (s.u.) wird Zeilenvektor benötigt!

%% b) Empfangssignal durch approx. inverses Filter
bapp= [1 0 0 -0.8 0 0 0.64 0 0 -0.512];   
aapp= [1];
z2 = filter(bapp, aapp, y);
subplot (5,1,5)
stem (k, z2, '.');
title ('Signal nach approximiertem InversFilter');

%% c) Plot PN-Diagramme, Impulsantworten, Frequenzgänge
figure (2)

% Pole und Nullstellen: Kanal (System) Hk(z)
subplot(3,3,1)
zplane(b,a)
title('Kanal = System Hk(z)')
text(1,0.5,'FIR')

% Pole und Nullstellen: Inverses Filter Hinv(z)
subplot(3,3,4)
zplane(binv,ainv)
title('Entzerrer = Inverses Filter Hinv(z)')
text(1,0.5,'IIR')

% Pole und Nullstellen: Angenähertes inverses Filter Happ(z)
subplot(3,3,7)
zplane(bapp,aapp)
title('Angenähertes inverses Filter Happ(z)')
text(1,0.5,'FIR')

%-----------------------------------
% Impulsanwort: Kanal (System) Hk(z)
subplot(3,3,2)
impz(b,a,20)
title('Impulsantwort hk[n]')

% Impulsanwort: Inverses Filter Hinv(z)
subplot(3,3,5)
impz(binv, ainv ,20)
title('Impulsantwort hinv[n]')

% Impulsanwort: Angenähertes inverses Filter Happ(z)
subplot(3,3,8)
impz(bapp, aapp ,20)
title('Impulsantwort happ[n]')

%-----------------------------------
% Frequenzgang: Kanal (System) Hk(z)
subplot(3,3,3)
[H,w]=freqz(b,a,'whole');
plot(w/pi,abs(H))
axis([0 2 0 3])
title('Betrag Hk(\Omega)')
xlabel('\Omega/\pi')
ylabel('|Hk(\Omega)|')

% Frequenzgang: Inverses Filter Hinv(z)
subplot(3,3,6)
[H,w]=freqz(binv, ainv ,'whole');
plot(w/pi,abs(H))
axis([0 2 0 3])
title('Betrag Hinv(\Omega)')
xlabel('\Omega/\pi')
ylabel('|Hinv(\Omega)|')

% Frequenzgang: Angenähertes inverses Filter Happ(z)
subplot(3,3,9)
[H,w]=freqz(bapp, aapp,'whole');
plot(w/pi,abs(H))
axis([0 2 0 3])
title('Betrag Happ(\Omega)')
xlabel('\Omega/\pi')
ylabel('|Happ(\Omega)|')
