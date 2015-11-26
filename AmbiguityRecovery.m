function [L,S] = AmbiguityRecovery(M,S, normals)

L = M*S'*inv(S*S');

p = size(S,2);
% We choose images which fit L well

thresh = 15;
idx_selected = [];
for i = 1:size(L,1)
    
    error = norm(M(i,:) - L(i,:)*S);
    
    if error < thresh
        
        idx_selected = [idx_selected; i];
        
    end
end

% Estimate Ambiguity

%% I am assuing Albeldo if the template to be 0.6 (Don't know why!)
%normals = [0.6*ones(size(normals,1),1) normals];

sx = size(S,2);
A = normals(:,1:sx)*S'*inv(S*S');


%A = eye(4);

% Recalculate L and S 
M = M(idx_selected,:);
L = M*S'*inv(S*S')*inv(A);
S = A*S;

end