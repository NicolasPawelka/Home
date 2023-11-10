function y = filterOneSample (b, x)
% Erzeugt einen gefilterten Abtastwert
% 
% b  - coefficients (row vector b[0] b[1] ... b[N]) 
% x	 - input signal (row vector x[k-N] ... x[k-1] x[k]) 
% y	 - filtered sample (one sample y[k])  

x = fliplr(x); % Spiegle x => Reihenfolge x[k] x[k-1] ... x[k-N]
y =  x * b' ; % Filtern: Skalarprodukt liefert einen gefilterten Wert y[k]
if y>1e100; error('Das Filter ist instabil, mu ist zu gross!'), end

end
