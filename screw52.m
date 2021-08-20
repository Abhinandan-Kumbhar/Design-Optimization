clear all
close all
syms x;
maxit = 150;
format long
function obj=screw31(x)
obj=(pi/4)*(0.405*x(1)^2+x(2)^2*x(4)+x(3)^2*x(5));
end
LB=[0,0,0.1,7.023,1.1525,8,0,0];
UB=[inf,0.625,inf,7.523,1.6525,inf,52,24];
function r = gi(x)
 r = [-(38.88+96*x(4)+96*x(5)-pi*20000*x(2)^3),
    -(6*(x(7)/x(6))-pi*22000*x(1)^3),
    -(8.345-x(4)-x(5)),
    -(-9.595+x(4)+x(5)),
    -(x(2)-0.625),
    -(5*(x(6)/x(7))-0.0583*x(8)),
    -((1.5*x(2)*((pi*0.35*x(2)+0.5/x(8))/(0.5*pi*x(2)-0.35/x(8))))-0.125*(x(7)/x(6))),
    -(x(3)-x(2)),
    -(x(1)-x(2)),
      ];
endfunction
function s=h(x)
 s=(-x(3)+x(2)-1.299/x(8));
endfunction
x0 = [0.2,0.2,0.2,7.3,1.4,8,50,14];
[x,fmin,info,iter,nf,inlambda] = sqp(x0,@screw31,@h,@gi,LB,UB)