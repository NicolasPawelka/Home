function plotOverTime(x,x1,x2,x3)

k=0:1:(length(x)-1);
k1=0:1:(length(x1)-1);
k2=0:1:(length(x2)-1);
k3=0:1:(length(x3)-1);
figure
subplot (3,1,1); plot (k, x,'c'); hold on;
stem (k1, x1, '.r'); hold off;
%title ('Verlängern der Dauer des Signalausschnitts');
xlabel ('hellblau: komplettes Zeitsignal / rot: Erster Ausschnitt');
subplot (3,1,2); plot (k, x,'c'); hold on;
stem (k2, x2, '.r'); hold off;
xlabel ('hellblau: komplettes Zeitsignal / rot: Zweiter Ausschnitt');
subplot (3,1,3); plot (k, x,'c'); hold on;
stem (k3, x3, '.r'); hold off;
xlabel ('hellblau: komplettes Zeitsignal / rot: Dritter Ausschnitt');




