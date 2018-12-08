
% ������ ������� � ������� ��������� �������� 
% ���� ������� - 

clear all
clc
for p=3:0.3:5.1
%p = 5; % ������ ������� ����������
%W = 20; %W - �������� �����, �/�
for W = 4:4:20
g = 9.81; %��������� ���������� �������
N = 1024; %  image size
delta = 1.; % ������ �������, �
h = 10000; % ������ ��������� ��� ������������, �


WLM = 1.*W*W ; %  ����� ����� ������������� �������� , �

[X,Y,k_x,k_y,kX,kY,K]=coord(N,delta);

Sw = SimpleSpa2(K,p,WLM);
% imtool(Sw);

[anglecoeff] = angSimple(N,k_x,k_y);

% imtool(anglecoeff);

Sangle = Sw.*anglecoeff;
% imtool(Sangle);

[FxD,FyD] = SyntSlopes(Sangle,kX,kY);
% imtool(FxD); imtool(FyD);

 [Fx,Fy] = SlopesCoxMunk(FxD,FyD,W);
% imtool(Fx); imtool(Fy);

rg = range(range(Fx));
Fx = Fx + rg*0.501;
Ix=im2uint16(Fx);
%imtool(Ix,[25.5,25.5]);
h = imadjust(Ix,[0.5; 0.55],[]);
p_ = vpa(p, 2)*10;
imwrite(h, sprintf('p_%i_W_%d.png', p_, W));
end
end
% [Yc] = skyUniform(Fx,Fy,X,Y,delta,h);
%imtool(Yc);
