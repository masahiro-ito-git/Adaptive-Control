% 例3.1で状態変数と出力の微分が利用できる場合のモデル
function dx_all=model_3_1MRAC_usex(t,x_all,r)
% x_all=[x;ym;theta], x(2変数), theta(3変数)
% param=[]

x_all_cell=num2cell(x_all);
x_cell=cell(2,1); theta_cell=cell(3,1);
[x_cell{:},ym,theta_cell{:}]=x_all_cell{:};
x=cell2mat(x_cell); x=x(:);
theta=cell2mat(theta_cell); theta=theta(:);
%param_cell=num2cell(x);
%[]=param_cell{:};

u=theta' * [r;x];
Lambda=100*eye(3); h=1;
eps_h=h*(ym-[1,1]*x);

dx=[0,1;0,0]*x+[0;1]*u;
dym=-ym+r;
if t>=inf %theta更新の停止時刻の決定
  dtheta=0*theta;
else
  dtheta=Lambda*[r;x]*eps_h;
end

dx_all=[dx;dym;dtheta];

end