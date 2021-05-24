% 例3.1において出力信号のみを用いた場合
clear;

% システムの情報
r=@(t) sin(t); % r=@(t) t;
% システムの構築
f=@(t,x) model_3_1MRAC(t,x,r(t));
% 微分方程式の求解
opts=odeset('OutputFcn',@odeplot); % 相平面をプロット
[t,y]=ode45(f,[0 20],zeros(12,1),opts);

% 結果のプロット
figure(1)
sol_ym=y(:,3);
sol_y=y(:,1)+y(:,2);
plot(t,[sol_ym,sol_y,sol_y-sol_ym]);
legend('ym','y','e');
title('output flow');

figure(2)
plot(t,y(:,4:8));
legend('1','2','3','4','5'); % theta
title('parameter flow');


%{
% 例3.1において出力信号のみを用いた場合
% 参照信号を変化させた場合の例
clear;

% システムの情報
r1=@(t) sin(t); r2=1; %r1=-1;
% システムの構築
f1=@(t,x) model_3_1MRAC(t,x,r1(t));
f2=@(t,x) model_3_1MRAC(t,x,r2);
% 微分方程式の求解
opts=odeset('OutputFcn',@odeplot);
[t1,y1]=ode45(f1,[0 20],zeros(12,1),opts); % odextend
[t2,y2]=ode45(f2,[20 40],y1(end,:),opts);
[t3,y3]=ode45(f1,[40 60],y2(end,:),opts);
[t4,y4]=ode45(f2,[60 80],y3(end,:),opts);
[t5,y5]=ode45(f1,[80 100],y4(end,:),opts);
[t6,y6]=ode45(f2,[100 120],y5(end,:),opts);

% 結果のプロット
figure(1)
sol_t=[t1;t2;t3;t4;t5;t6];
sol_y=[y1(:,1)+y1(:,2);y2(:,1)+y2(:,2);y3(:,1)+y3(:,2);y4(:,1)+y4(:,2);y5(:,1)+y5(:,2);y6(:,1)+y6(:,2)];
sol_ym=[y1(:,3);y2(:,3);y3(:,3);y4(:,3);y5(:,3);y6(:,3)];
plot(sol_t,[sol_ym,sol_y,sol_y-sol_ym]);
legend('ym','y','e');

figure(2)
sol_param=[y1(:,4:8);y2(:,4:8);y3(:,4:8);y4(:,4:8);y5(:,4:8);y6(:,4:8)];
plot(sol_t,sol_param);
legend('1','2','3','4','5');
%}
