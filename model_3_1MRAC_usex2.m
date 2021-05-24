% 例3.1を相対次数2にしたモデルに対して出力の微分が利用できる場合
function dx_all=model_3_1MRAC_usex2(t,x_all,r)
% x_all=[x;ym;theta], x(2変数), theta(3変数)
% param=[]

x_all_cell=num2cell(x_all);
x_cell=cell(2,1); ym_cell=cell(2,1); theta_cell=cell(3,1);
[x_cell{:},ym_cell{:},theta_cell{:}]=x_all_cell{:};
x=cell2mat(x_cell); x=x(:);
ym=cell2mat(ym_cell); ym=ym(:);
theta=cell2mat(theta_cell); theta=theta(:);
%param_cell=num2cell(x);
%[]=param_cell{:};

u=theta' * [r;x];

dx=[0,1;0,-1]*x+[0;1]*u;%+[1;1]*(rand(1)-0.5)*1e-1; % 試験的に外乱を導入
dym=[0,1;-1,-5]*ym+[0;1]*r;

Lambda=eye(3);
% hはhlyapを利用して、強正実条件を確認
h=[1.7241;9.3103];
% hのその他の例（強正実でないものを含む）
%[49.9865*1e-5;259.9299*1e-5]; [100;100]; [9.9999;0.0005]; [0.6353;5.2084]; %[0.0005;9.9999]; [49.9865;259.9299]; [1.7241;9.3103]; [1;1]; [1;0];

eps_h=h'*(ym-x);
if t>=inf % thetaの更新停止時間を指定
  dtheta=0*theta;
else
  dtheta=Lambda*[r;x]*eps_h;
end

dx_all=[dx;dym;dtheta];

end