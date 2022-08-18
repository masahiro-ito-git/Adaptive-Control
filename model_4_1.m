% 一次系に対するモデル規範型適応制御系（リアプノフ関数方式）
function dx=model_4_1(x,param,r,d)
  % x=[y,ym,theta1,theta2]
  % param=[a;b;am;bm;alpha1;alpha2]
  % eta1=r/(s+am) eta2=y/(s+am)
  % r=@(x) sin(x)

  x_cell=num2cell(x);
  [y,ym,theta1,theta2]=x_cell{:}; 
  param_cell=num2cell(param);
  [a,b,am,bm,alpha1,alpha2]=param_cell{:};
  
  u=theta1*r+theta2*y;
  e=ym-y;
  
  dy=-a*y+u+d;
  dym=-am*ym+r;
  dtheta=;
  
  dx=[-a*y+b*u;-am*ym+bm*r;alpha1*r*e;alpha2*y*e];

end