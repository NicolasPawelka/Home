subplot(2,1,1)
b_unknown=1;
a_unknown=[1 0 0 0 0 0 0 0 -0.9];
[H, f] = freqz(b_unknown,a_unknown,1024,fs);
plot(f, 20*log10(abs(H))); grid;
title('Frequenzgang des unbekannten Systems');
subplot(2,1,2)
[H, f] = freqz(out.b_opt,1,1024,fs);
plot(f, 20*log10(abs(H))); grid;
title('Frequenzgang des adaptierten Filters');