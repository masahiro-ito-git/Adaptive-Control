% Am,bm,hからなるシステムが強正実であることの確認

Am=[0,1;-1,-5]; bm=[0;1];
%Q=[1e-5,0;0,1]; %[1,0;0,1e-5]; eye(2);
randQ=rand(2); Q=randQ*randQ';

P=lyap(Am,Q);
sqP=sqrtm(P); %P^(1/2)
Bhat=sqP\bm;
Hhat=Bhat';
H=Hhat/sqP

figure()
sys=ss(Am,bm,H,0);
nyquist(sys);

%{
figure()
sys_bad=ss(Am,bm,[1,1],0);
nyquist(sys_bad);
getPassiveIndex(sys_bad,'io')
%}
%{
figure()
sys_bad=ss(Am,bm,[9.9999,0.0005],0);
nyquist(sys_bad);
%}


figure()
sys_bad=ss(Am,bm,[9,1],0);
nyquist(sys_bad);