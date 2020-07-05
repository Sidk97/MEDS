%2)a- solution
clc 
close all
load data2
oil = data(:,2);
eco = data(:,3);
z = xcorr(oil,eco);
figure;
plot(z)

% 2)b- solution
[m,n] = size(oil);
P = 0.70;
idx =  randperm(m);
Training_oil = oil(idx(1:round(P*m)),:);
Validation_oil = oil(idx(round(P*m)+1:end),:);
[m,n] = size(eco);
P = 0.70;
idx =  randperm(m);
Training_eco = eco(idx(1:round(P*m)),:);
Validation_eco = eco(idx(round(P*m)+1:end),:);

result = zeros(1,5);
for i=1:5
    fit = polyfit(Training_oil,Training_eco,i)
    est_val = polyval(fit,Validation_oil);
    SE = (Validation_eco-est_val).^2;
    SSE = sum(SE);
    result(i) = SSE;
end

[M,I] = min(result);
S= sprintf("The polynomial with degree %d,has the minimum SSE",I);
disp(S)

% I have tried with iteration limit 10 but each time I iterated the above code it gave me a
% different order for best fit.However degree '1' was most frequent when iteration limit was set to 5 so I
% assume that polynomial with degree '1' to have the best fit and proceeded
% with 2)c solution.

%2-c solution
figure;
scatter (oil,eco)
hold on;
fit = polyfit(Training_oil,Training_eco,1);
x = -4:0.1:4;
y = (x* fit(1)) + fit(2) ;
plot(x,y);
 y = polyval([fit(1) fit(2)], -0.995);
 Economic_growth = y
 
