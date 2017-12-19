%%
%defining constants:
%
m_p = 20.00;%defined in pounds
m_prime_p = 34.00;
omega = 1000.00;%RPM
r=1.5;%in
l=14.00;
f_p=[];
theta=0:360;
for i=0:360
    x = (m_p + m_prime_p)*(r*omega^2)*(cosd(i)+(r/l)*cosd(2.0*i));
    f_p = cat(2, f_p, x);
end
f_c = (r*omega^2);
theta = deg2rad(theta);
polarplot(theta, f_p + f_c);
title('f');
grid on;
saveas(gcf, 'f', 'bmp');
saveas(gcf, 'f', 'fig');
close(gcf);