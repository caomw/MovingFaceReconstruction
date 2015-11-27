function [Z_true] = Integration(S,sx,sy)

p = size(S,2);

z_grad = zeros(3,p);
for i = 1:p
    
    zx = -S(2,i)/S(4,i);
    zy = -S(3,i)/S(4,i);
    
    if S(4,i) == 0
       zx = 0;
       zy = 0;
    end
    z_grad(:,i) = [zx;zy;-1]./sqrt(1 + zx.^2 + zy.^2);
    
end
fx = reshape(z_grad(1,:),[sx sy]);
fy = reshape(z_grad(2,:),[sx sy]);

% Check If the integration is correct
z_hat = intgrad2(fx,fy);

Z = reshape(z_hat,[1 p]);

% I am little skeptical about it
X = repmat(1:sx,[1 p/sx]);

Y = [];
for i = 1:p/sy
   Y = [Y i*ones(1,sy)];
end

% Estimate the constants a,b,c
a = 0;
b = 0;
c = 1;

Z_true = a*X + b*Y + c*Z;


end