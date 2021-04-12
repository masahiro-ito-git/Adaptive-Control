% 一次系に対するモデル規範型適応制御系（MIT方式）
function dx=model_1MIT_1dim(x,param,r)
  % x=[y,ym,theta1,theta2,eta1,eta2]
  % param=[a;b;am;bm;alpha1;alpha2]
  % eta1=r/(s+am) eta2=y/(s+am)
  % r=@(x) sin(x)

  x_cell=num2cell(x);
  [y,ym,theta1,theta2,eta1,eta2]=x_cell{:}; 
  param_cell=num2cell(param);
  [a,b,am,bm,alpha1,alpha2]=param_cell{:};
  
  u=theta1*r+theta2*y;
  e=ym-y;
  
  
  dx=[-a*y+b*u;-am*ym+bm*r;alpha1*eta1*e;alpha2*eta2*e;-am*eta1+r;-am*eta2+y];

end