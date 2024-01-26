function magtfiir(b,a,txt)

% dsp laboratory - assignment 9
% shows magnitude of the transfer function of an IIR system 
% in the complex z plane
%   function magtfiir(b,a,txt)
%     b   : numerator coefficients
%     a   : denominator coefficients
%     txt : text for figure title
% magtfiir.m * February 2001 * mw

% polar coordinates (supporting grid in z plane)
rho = 0:.025:1.5;
phi = 0:.025:2; phi=pi*phi;
Nrho = length(rho); Nphi = length(phi); z = zeros(Nrho,Nphi);
for k=1:Nrho
   for l=1:Nphi
      z(k,l) = rho(k)*cos(phi(l)) + j*rho(k)*sin(phi(l));
  end 
end
ONES = ones(size(z));
% compute transfer function
M=length(b)-1; % order of numerator polynomial
N=length(a)-1; % order of denominator polynomial
ZP = zeros(size(z));
for k=1:M+1 % numerator polynomial
  ZP = ZP + b(k)*z.^(M+1-k);  
end
NP = zeros(size(z)); 
for k=1:N+1 % denominator polynomial
  NP = NP + a(k)*z.^(N+1-k);  
end
H = (ZP./NP).*z.^(N-M); % transfer function
% graphics
if nargin==3
  NAME = ['magtfiir : contour plot - ',txt]; % add text to the figure title
else
  NAME = 'magtfiir : contour plot';
end
FIG1 = figure('Name',NAME,'NumberTitle','off','Units','normal')
%  'Position',[.5 .4 .45  .55]);
V = [0 .001 .01 .1 .2 .5 1 2 3 4 5];
[CS,CH] = contour(real(z),imag(z),min(abs(H),5*ones(size(H))),V);
axis square
hold on
Cphi = 0:.005:2; Cphi=pi*Cphi;
Cz = cos(Cphi) + j*sin(Cphi);
for Cr=.5:.5:1.5
  plot(Cr*real(Cz),Cr*imag(Cz),'k:')
end
hold off
clabel(CS,CH,V);
grid
xlabel('re (z) \rightarrow'), ylabel('im (z) \rightarrow')
title('contour lines of |H(z)|')
if nargin==3
  NAME = ['magtfiir : z plane - ',txt]; % add text to the figure title
else
  NAME = 'magtfiir : z plane';
end
MAX3D = 12; % maximum heights (20)
FIG2 = figure('Name',NAME,'NumberTitle','off','Units','normal')
%  'Position',[.5 .4 .45  .55]);
grid
surfl(real(z),imag(z),min(abs(H),MAX3D))
colormap(hot), axis([-1.5 1.5 -1.5 1.5 0 MAX3D]), view(-30,30)
xlabel('re (z) \rightarrow'), ylabel('im (z) \leftarrow')
zlabel('|H(z)| \rightarrow')
% stress frequency response on the unit circle
rho = [.999 1 1.001];
phi = 0:.005:2; phi=pi*phi;
Nrho = length(rho); Nphi = length(phi); z = zeros(Nrho,Nphi);
for k=1:Nrho
   for l=1:Nphi
      z(k,l) = rho(k)*cos(phi(l)) + j*rho(k)*sin(phi(l));
  end 
end
ONES = ones(size(z));
% transfer function
ZP = zeros(size(z));
for k=1:M+1 % numerator polynomial
  ZP = ZP + b(k)*z.^(M+1-k);  
end
NP = zeros(size(z)); 
for k=1:N+1 % denominator polynomial
  NP = NP + a(k)*z.^(N+1-k);  
end
H = (ZP./NP).*z.^(N-M); % transfer function
hold
plot3(real(z),imag(z),min(abs(H),5*ones(size(H))),'b')
hold
% polar coordinates (supporting grid on the unit circle)
rho = [.999 1 1.001];
phi = 0:.02:2; phi=pi*phi;
Nrho = length(rho); Nphi = length(phi); z = zeros(Nrho,Nphi);
for k=1:Nrho
   for l=1:Nphi
      z(k,l) = rho(k)*cos(phi(l)) + j*rho(k)*sin(phi(l));
  end 
end
ONES = ones(size(z));
% transfer function
ZP = zeros(size(z));
for k=1:M+1 % numerator polynomial
  ZP = ZP + b(k)*z.^(M+1-k);  
end
NP = zeros(size(z)); 
for k=1:N+1 % denominator polynomial
  NP = NP + a(k)*z.^(N+1-k);  
end
H = (ZP./NP).*z.^(N-M); % transfer function
%H = H/max(max(H));
H(1,:)=zeros(1,Nphi);
H(3,:)=zeros(1,Nphi);
% graphics
if nargin==3
  NAME = ['magtfiir : unit circle - ',txt]; % add text to the figure title
else
  NAME = 'magtfiir : unit circle';
end
FIG3 = figure('Name',NAME,'NumberTitle','off','Units','normal')
%  'Position',[.5 .4 .45  .55]);
grid
surfl(real(z),imag(z),abs(H))
view(-30,30), colormap(hot), axis([-1.5 1.5 -1.5 1.5 0 MAX3D]) 
xlabel('re (z) \rightarrow'), ylabel('im (z) \leftarrow')
zlabel('|H(e^{j\Omega})| \rightarrow')
% end