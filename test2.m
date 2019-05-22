ymax = 10;
y = [0 ymax ymax 0];
x = [0 0 0.002 0.002];
patch(x,y,'red')
y = [0 ymax ymax 0];
x = [76255/73272 76255/73272 2 2];
hold on 
patch(x,y,'blue')
xlim([-1.5 1.5])
ylim([-1.5 ymax])

% t>0 and
% k>76255/73272 and
% 0>k>0.0020