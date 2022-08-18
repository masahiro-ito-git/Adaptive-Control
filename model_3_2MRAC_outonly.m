% 例3.2
function dx_all=model_3_2MRAC_outonly(t,x_all,r)
% x_all=[y;ym;theta;v1;v2;zeta]
% y(2変数), ym(2変数), theta(5変数), v1(2変数), v2(2変数)
% param=[]

F=[-1,0;0,-2]; g=[1;1];
G2=1*eye(5); lambda0=1;
g1=1;

x_all_cell=num2cell(x_all);
y_cell=cell(2,1); ym_cell=cell(2,1); theta_cell=cell(5,1);
v1_cell=cell(2,1); v2_cell=cell(2,1); zeta_cell=cell(10,1); x_z_cell=cell(2,1);
[y_cell{:},ym_cell{:},theta_cell{:},v1_cell{:},v2_cell{:},...
    zeta_cell{:},b0hat,x_z_cell{:}]=x_all_cell{:};
y=cell2mat(y_cell); y=y(:);
ym=cell2mat(ym_cell); ym=ym(:);
theta=cell2mat(theta_cell); theta=theta(:);
v1=cell2mat(v1_cell); v1=v1(:);
v2=cell2mat(v2_cell); v2=v2(:);
zeta=cell2mat(zeta_cell); zeta=zeta(:);
x_z=cell2mat(x_z_cell); x_z=x_z(:);

omega=[r;v1;v2];
u=theta' * omega;
m_sq=lambda0+zeta(1:5)'*zeta(1:5);
z=x_z(1)+theta'*zeta(1:5);
e=y(1)-ym(1);
ehat=b0hat*z;
ea=e-ehat;

dy=[0,1;-1,-1.4]*y+[0;1]*u;
dym=[0,1;-1,-2]*ym+[0;1]*r;
dv1=F*v1+g*u;
dv2=F*v2+g*y(1);
dzeta=[zeros(5),eye(5);-eye(5),-2*eye(5)]*zeta+[zeros(5,1);omega];
db0hat=g1*z/m_sq*ea;
dx_z=[0,1;-1,-2]*x_z+[0;-1]*theta'*omega;

if t>=inf
  dtheta=0*theta;
else
  dtheta=G2*zeta(1:5)/m_sq*ea;
end

dx_all=[dy;dym;dtheta;dv1;dv2;dzeta;db0hat;dx_z];

end