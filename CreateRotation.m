function [R] = CreateRotation(alpha, beta, gamma)
c_alpha = cos(alpha);
s_alpha = sin(alpha);
R_z_alpha = [c_alpha -s_alpha 0;
             s_alpha c_alpha 0;
             0 0 1];
         
c_beta = cos(beta);
s_beta = sin(beta);
R_y_beta = [c_beta 0 s_beta;
            0 1 0;
            -s_beta 0 c_beta];

c_gamma = cos(gamma);
s_gamma = sin(gamma);
R_x_gamma = [1 0 0;
             0 c_gamma -s_gamma;
             0 s_gamma c_gamma];
R = R_z_alpha*R_y_beta*R_x_gamma;
end