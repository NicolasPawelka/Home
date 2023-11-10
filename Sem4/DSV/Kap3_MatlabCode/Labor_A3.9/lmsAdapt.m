function b = lmsAdapt (b, e, x, mu)
% Führt LMS-Adaption der Filterkoeffizienten durch  
% 
% b  - coefficients to adapt (row vector b[0] b[1] ... b[N]) 
% e	 - error sample (one sample e[k])	
% x	 - input signal (row vector x[k-N] ... x[k-1] x[k]) 
% mu - stepsize for adaptation 

x = fliplr(x); % Spiegle x => Reihenfolge x[k] x[k-1] ... x[k-N]
b = b + 2*mu * e * x; % LMS Adaption der Filterkoeffizienten

end