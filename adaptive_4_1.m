% 例3.2
clear;

% システムの情報
r=@(t) sin(t); %r=@(t) t;
d=@(t) (1+t)^(-1/5)*(5-(1+t)^(
% システムの構築
f=@(t,x) model_4_1(t,x,r(t));
% 微分方程式の求解
[t,y]=ode45(f,[0 50],zeros(26,1));

% 結果のプロット
figure(1)
sol_ym=y(:,3);
sol_y=y(:,1)+y(:,2);
plot(t,[sol_ym,sol_y,sol_y-sol_ym]);
legend('ym','y','e');

figure(2)
plot(t,y(:,4:8));
