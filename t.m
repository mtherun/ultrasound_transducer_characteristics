
[f,Z,G]=load_admitance('C:\Users\','230329101740.csv');

Zpeak=max(Z);
iz=find(Z==Zpeak);
Gpeak=max(G);
ig=find(G==Gpeak);
fp=f(iz);
fs=f(ig);

r2=Gpeak/2; % for activity 2
G1=G<(r2+0.01);

[mi i1]=min(abs(G-r2));
fl=f(i1)
ifc=f>(f(ig)+f(ig)-fl)
g=G1.*ifc

[ma i2]=max(abs(g-r2));
i1
i2


