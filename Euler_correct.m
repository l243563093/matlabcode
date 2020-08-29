function [ yy]= Euler_correct(f,y0,x0,xn,hh)
%f是inline function的句柄
%y0是初值
%[x0 xn]是范围
% hh是步长
%%===输入判断===
if(4==nargin)
h=0.1;
elseif(5== nargin)
h =hh;
end
%% ===初始化数据===
x=x0:h:xn;%==计算节点==
y=y0;
N=length(x);% ==节点数==

for k=1:N-1
%==欧拉向前公式==
y(k+1)=y(k)+h*f(x(k),y(k));
y(k+1)=y(k)+h*f(x(k+1),y(k+1));
%==欧拉向后公式==

y(k+1)=y(k)+h*(f(x(k),y(k))+f(x(k+1),y(k+1)))/2;
%==梯形公式校正==
end
%%===输出处理===
if(0== nargout)
for k=1:N
fprintf( 'x:%f \t y:%f \n',x(k),y(k));
end
elseif(1== nargout)
yy=y;
plot(x,y,'-+');hold on
plot(x,yy,'-*');
disp(num2str([x' yy']))
else
disp('error:please check your input');
return;
end
end
%% 把下面的命令输入到命令行窗口，去掉星号
% dyfun=inline('-2*x*y');
% [y] =Euler_correct(dyfun,1,0,1,0.1);
