% 例3.3を相対次数2にしたもの
function dx_all=model_3_1MRAC(t,x_all,r)
% x_all=[x;ym;theta;v1;v2], x(2変数), theta(5変数), v1(2変数), v2(2変数)
% param=[]

F=[-1,0;0,-2]; g=[1;1];
G=100*eye(5);

x_all_cell=num2cell(x_all);
x_cell=cell(2,1); ym_cell=cell(1,1); theta_cell=cell(5,1); v1_cell=cell(2,1); v2_cell=cell(2,1);
[x_cell{:},ym_cell{:},theta_cell{:},v1_cell{:},v2_cell{:}]=x_all_cell{:};
x=cell2mat(x_cell); x=x(:);
ym=cell2mat(ym_cell); ym=ym(:);
theta=cell2mat(theta_cell); theta=theta(:);
v1=cell2mat(v1_cell); v1=v1(:);
v2=cell2mat(v2_cell); v2=v2(:);
%param_cell=num2cell(x);
%[]=param_cell{:};

omega=[r;v1;v2];
u=theta' * omega;
y=[1,1]*x;

dx=[0,1;0,0]*x+[0;1]*u;
dym=-ym+r;
dv1=F*v1+g*u;
dv2=F*v2+g*y;

e=ym-y;
if t>=inf
  dtheta=0*theta;
else
  dtheta=G*omega*e;
end

dx_all=[dx;dym;dtheta;dv1;dv2];

end