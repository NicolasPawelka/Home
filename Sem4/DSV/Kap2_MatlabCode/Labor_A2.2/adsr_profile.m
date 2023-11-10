function y = adsr_profile(tA,tD,tS,ED,ES,x)
% dsp laboratory - assignment 2
% Quelle:  Martin Werner, Digitale Signalverarbeitung in Matlab 
% shaping pure tones by ADSR profile
% y = adsr_profile(tA,tD,tS,ED,ES,x)
%   tA : relative duration of attack phase
%   tD : relative duration of delay phase = tD - tA
%   tS : relative duration of sustain phase = tS - tD
%   ED : relative amplitude of profile at time tD
%   ES : relative amplitude of profile at time tS
%   x  : tone to be shaped
%   y  : shaped tone
% adsr_profile.m * mw * 10/07/2005
tR = length(x);   	% number of samples (tone duration)
y = zeros(1,tR);  	% allocate memory for output signal
% attack phase
NA = floor(tA*tR)+1;  	% number of samples in attack phase 
A =1/(NA-1);          	% envelope increment
E = 0;                	% envelope
for k=2:NA
  E = E+A;
  y(k) = E*x(k);
end
% delay phase
ND = floor((tD-tA)*tR); 	% number of samples in delay phase
D = (1-ED)/ND;          	% envelope decrement
for k=NA+1:NA+ND
  E = E-D;
  y(k) = E*x(k);
end
% sustain phase
NS = floor((tS-tD)*tR); 	% number of samples in sustain phase
S = (ED-ES)/NS;         	% envelope decrement
for k=NA+ND+1:NA+ND+NS
  E = E-S;  
  y(k) = E*x(k);
end
% release phase
NR = tR-k;       	% number of samples in release phase
R = E/NR;       	% envelope decrement
for k=NA+ND+NS+1:tR
  E = E-R;
  y(k) = E*x(k);
end
return
% end