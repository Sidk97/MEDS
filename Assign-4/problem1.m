clc
close all
%1)a- solution
num = 1;
den = [1 3 2];
H = tf(num,den);
u = idinput([2000],'prbs');
t = 0:0.1:199.9;
y = lsim(H,u,t)
figure;
subplot(2,1,1);
plot(u);
title('Input');
xlabel('time');
ylabel('Value');
subplot(2,1,2);
plot(y)
title('output')
xlabel('time');
ylabel('Value');

%1)b-solution

z = xcorr(y,200);
figure;
plot(z)


%1)c -solution
figure;
data = iddata(y,u,0.1);
[ir,~,~] = cra(data,100);
t =0:0.1:10;
stem(t,ir*10)
hold on;
impulse(H,10);
title('Impulse response of the transfer Function')


%1)d- solution
figure;
g_1 = etfe(data)
subplot(2,1,1)
bode(g_1)
g_2 = spa(data);
subplot(2,1,2)
bode(g_2)








