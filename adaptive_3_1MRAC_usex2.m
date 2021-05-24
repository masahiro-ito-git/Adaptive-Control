% 例3.1を相対次数2にしたモデルに対して出力の微分が利用できる場合
clear;

% システムの情報
r=@(t) sin(t);   %r=@(t) 1; %r=@(t) t;
% システムの構築
f=@(t,x) model_3_1MRAC_usex2(t,x,r(t));
% 微分方程式の求解
[t,y]=ode45(f,[0 20],zeros(7,1));
% [t,y]=ode45(f,[0 20],[0.5;0.2;zeros(5,1)]); % 初期値をずらした時の例

% 結果のプロット
figure(1)
sol_ym=y(:,3);
sol_y=y(:,1);
plot(t,[sol_ym,sol_y,sol_y-sol_ym]);
legend('ym','y','e');
title('output flow');

figure(2)
plot(t,y(:,5:7));
title('parameter flow');