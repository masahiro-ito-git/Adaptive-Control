% 例3.1で状態変数と出力の微分が利用できる場合
clear;

% システムの情報
r=@(t) sin(t); %r=@(t) t;
% システムの構が築
f=@(t,x) model_3_1MRAC_usex(t,x,r(t));
% 微分方程式の求解
[t,y]=ode45(f,[0 20],zeros(6,1));
%sol=ode45(f,[0 20],zeros(6,1)); %シミュレーションのサンプル時間が指定できない

% 結果のプロット
figure(1)
sol_ym=y(:,3);
sol_y=y(:,1)+y(:,2);
plot(t,[sol_ym,sol_y,sol_y-sol_ym]);
legend('ym','y','e');
title('output flow');

figure(2)
plot(t,y(:,4:6));
title('parameter flow');