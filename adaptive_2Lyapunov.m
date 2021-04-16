% システムの設計パラメータなど
a=-0.5; b=0.5; am=1; bm=1; alpha1=5; alpha2=5;
param=[a;b;am;bm;alpha1;alpha2];
r=@(t) sin(t);
% システムモデルの構築
f=@(t,x) model_2_1dim(x,param,r(t));
% 微分方程式解の求解
sol=ode45(f,[0,50],zeros(4,1));
% システムの出力と誤差の応答のプロット
figure()
plot(sol.x,[sol.y(2,:);sol.y(1,:);sol.y(2,:)-sol.y(1,:)]);
ylim([-1.5,2]);
legend('ym','y','e');
title('出力とその誤差の応答');
% 設計パラメータの収束に関してプロット
figure()
plot(sol.x,[sol.y(3,:);sol.y(4,:);ones(size(sol.x))*bm/b;ones(size(sol.x))*(a-am)/b]);
legend('theta1','theta2','bm/b','a-am/b');
title('可調整パラメータの応答');