function [Z_true] = Integration(S,sx,sy)

p = size(S,2);

z_grad = zeros(3,p);
for i = 1:p
    
    zx = -S(3,i)/S(4,i);
    zy = -S(2,i)/S(4,i);
    
    if S(4,i) == 0
       zx = 0;
       zy = 0;
    end
    z_grad(:,i) = [zx;zy;-1];%./sqrt(1 + zx.^2 + zy.^2);
    
end
fx = reshape(z_grad(1,:),[sx sy]);
fy = reshape(z_grad(2,:),[sx sy]);
%fy = zeros(sx,sy);
imagesc(fx);
figure, imagesc(fy);
figure, imshow(fx);
figure, imshow(fy);
% Check If the integration is correct
z_hat = intgrad2(fx,fy);

Z = reshape(z_hat,[1 p]);

% I am little skeptical about it
X = repmat(1:sx,[1 p/sx]);

Y = [];
for i = 1:p/sy
   Y = [Y i*ones(1,sy)];
end

%Y = repmat(1:sy,[1 p/sy]);

%X = [];
%for i = 1:p/sx
%   X = [X i*ones(1,sx)];
%end


% Estimate the constants a,b,c
%corresp1 = [130,55,8.632; 60,94,-8.5; 63,72,-6.862];
%corresp2 = [36,58,-12.93; 61,21,-6.2; 60,46,-6.897];
%Z = Z + abs(min(Z)) + 50;

corresp1 = [59,19,z_hat(59,19);29,62,z_hat(29,62);82,87,z_hat(82,87)];
corresp2 = [65,99,z_hat(65,99);129,56,z_hat(29,62);79,27,z_hat(79,27)];  
%corresp1 = [59,19,-19.7;29,62,-20.49;82,87,-2.303];
%corresp2 = [65,99,9.884;129,56,-12.29;79,27,-22.59];  
U = corresp1 - corresp2;
[v,~] = eig(U);
a = v(1,3)
b = v(2,3)
c = v(3,3)
%a = 0;
%b = 0; 
%c = 1;
%a = -0.01;
%b = -0.1;
%c = 1;
Z_true = (a*X + b*Y + c*Z);
min(Z_true)

end