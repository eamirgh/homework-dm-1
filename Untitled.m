%%
%defining constants:
%
m_p = 20.00;%defined in pounds
% m_p_p + m_p_c = 34.00;
% m_p_c*4 = m_p_p*(14-4)
bb= inv([1.0 1.0;4.0 -10.0])*[34.00;0];
m_p_c = bb(1);
m_p_p = bb(2);
m_dp_c = (1.5/4.0)*10.0;

omega = 1000.00;%RPM
r=4.00/12.00;%in
l=14.00/12.00;
f_p=[];
f_c_x = [];
f_c_y = [];
theta = 0.0:0.001:2.0*pi;
f_c = (m_p_c + m_dp_c)*(r*omega^2);
for i=0.0:0.001:2.0*pi
    x = (m_p + m_p_p)*(r*omega^2)*(cos(i)+(r/l)*cos(2.0*i));
    f_p = cat(2, f_p, x);
    c_x = f_c*cos(i);
    c_y = f_c*sin(i);
    f_c_x = cat(2, f_c_x, c_x);
    f_c_y = cat(2, f_c_y, c_y);
end
%
f_total=sqrt((f_c_x+f_p).^2 + f_c_y.^2);

theta = atan2(f_c_y, f_c_x+f_p);
%figure
polarplot(theta, f_total);
title('f');
hold on;
polarplot(theta, sqrt(f_c_x.^2+f_c_y.^2), '--');
grid on;
saveas(gcf, 'f', 'bmp');
saveas(gcf, 'f', 'fig');