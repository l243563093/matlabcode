function [ yy]= Euler_correct(f,y0,x0,xn,hh)
%f��inline function�ľ��
%y0�ǳ�ֵ
%[x0 xn]�Ƿ�Χ
% hh�ǲ���
%%===�����ж�===
if(4==nargin)
h=0.1;
elseif(5== nargin)
h =hh;
end
%% ===��ʼ������===
x=x0:h:xn;%==����ڵ�==
y=y0;
N=length(x);% ==�ڵ���==

for k=1:N-1
%==ŷ����ǰ��ʽ==
y(k+1)=y(k)+h*f(x(k),y(k));
y(k+1)=y(k)+h*f(x(k+1),y(k+1));
%==ŷ�����ʽ==

y(k+1)=y(k)+h*(f(x(k),y(k))+f(x(k+1),y(k+1)))/2;
%==���ι�ʽУ��==
end
%%===�������===
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
%% ��������������뵽�����д��ڣ�ȥ���Ǻ�
% dyfun=inline('-2*x*y');
% [y] =Euler_correct(dyfun,1,0,1,0.1);
