clc; clear all; close all;


%Monte Carlo methods: are a broad class of computational algorithms
%that rely on repated RANDOM SAMPLING to obtain numerical results.
% The underlying concept is to use randomness to solve problem that
% might be deterministic in principle.


% EX1: generate samples from a arbitrary pdf (from Zhihu)
% Aside the Monte Carlo method, another interesting thing about EX1 is 
% that the realtionship between histogram of samples and the original pdf.
% vertical values should be set to number of observations in bin/(total
% number of observations * width of bin)
% given the complex pdf
% p = @(x) (0.3*exp(-(x-0.3).^2) + 0.7*exp(-(x-2).^2/0.3))/1.2113; 
% c = 2.5;     
% 
% max_iter = 1e5; % number of times of sampling
% samples = zeros(1,max_iter);
% 
% index = 1;
% for i=1:max_iter
%     u = rand(1,1);           
%     y = normrnd(1.4,1.2,1,1); % generate a sample with recommended pdf
%                               
%     if p(y) >= u*c*normpdf(y,1.4,1.2)
%         samples(index) = y;
%         index = index + 1;
%     end
% end
% 
% samples = nonzeros(samples); % the target samples
% 
% % plots
% x = linspace(-5,5,1000);
% plot(x,p(x))
% hold on
% histogram(samples,'Normalization','pdf')
% hold off


% EX2: the stock market (from Zhihu)
T = 1.0;   % one year
n = 244;   % number of trading days
dt = T/n;

u = 0.3;  % expected increase rate
sigma = 0.1; % stock volatility rate
N= 1000; % number of repeated times
stock = zeros(N,n); % price of stocks
stock(:,1) = 10*ones(N,1);

for i=2:n
    for j=1:N
        epsilon = normrnd(0,1);
        stock(j,i) = stock(j,i-1) + u*stock(j,i-1)*dt + sigma...
            *stock(j,i-1)*sqrt(dt)*epsilon;
    end
end

% plot with different colors
colormap jet;
cmap = colormap;  % array of RGB values
hold on
for i=1:N
    Plot_color = cmap(mod(i,256)+1,:);
    plot(1:n,stock(i,:),'Color',Plot_color,'LineWidth',1);
end


