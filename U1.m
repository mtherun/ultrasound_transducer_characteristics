clc
close all;
clear all;
%%Activity 1
rho=7800;
c=3520;
b=2*10^-3;
od=20 * 10^-3;
Nt=2000; %from data sheet
Np=2000;

% Calculating theoretical resonance
fst=Nt/b;
fpt=Np/od;


[f,Z,G]=load_admitance('C:\Users\','230329101740.csv'); %enter folder path here

Zpeak=max(Z);
iz=find(Z==Zpeak);
Gpeak=max(G);
ig=find(G==Gpeak);
fp=f(iz);
fs=f(ig);


figure(1)
yyaxis left
semilogx(f,abs(Z),[f(iz) f(iz)],[0 Zpeak])
xticks([0.85 0.9 0.95 1 1.05 1.1 1.15 1.2 1.25]*10^6);
xlim([0.85 1.25]*10^6);
ylabel('Impedance');
text(f(iz)+5000,Zpeak+50,'f_p')
text(f(ig)+5000,Zpeak,'f_s')
text(fs-35000,Zpeak-100,'f_s,theory')
fprintf("The fundamental Parallel resonance is %d Hz\n",f(iz))
yyaxis right
semilogx(f,abs(G),[f(ig) f(ig)],[0 Gpeak],[fst fst],[0 0.08])
xlabel('Frequency');
ylabel('Admittance');
legend('Z','f_p','G','f_s','f_s,theory')
fprintf("The fundamental Series resonance is %d Hz\n",f(ig))
fprintf(" The theoretical series resonant frequency is %d Hz\n",fst)

%%Activity 2
% % 
r2=Gpeak/2; % for activity 2
G1=G<(r2+0.01);
[mi i1]=min(abs(G-r2));
fl=f(i1);
ifc=f>(f(ig)+f(ig)-fl);
g=G1.*ifc;
[ma i2]=max(abs(g-r2));
fh=f(i2);
Q= fs/(fh-fl);


[f,Z,theta]=load_admitance('C:\Users\','230329101943.csv'); %enter folder path here

wZ=2*pi.*f.*Z;
ct=sum(1./wZ(1:801))/802;
% ct=ct(1,1);
fprintf(" The total capacitance is %d F\n",ct);
R=1/Gpeak;
fprintf(" The mechanical resistance R is %d Ohm\n",R);

fprintf(" The Quality factor Q is %f\n",Q);

c=1/(2*pi*fs*R*Q);
fprintf(" The Mechanical Capacitance C is %d F\n",c);

c0=ct-c;
fprintf(" The Electrical Capacitance Co is %d F\n",c0);

L=1/(4*pi*pi*c*fs*fs);
fprintf(" The Inductance is %d H\n",c0);

cf=sqrt(c/ct);
fprintf(" The coupling factor is %d\n",cf);
