function [q_2_n] = threeDto2D(q_3_n)
q_divide = repmat(q_3_n(3, :), size(q_3_n, 1), 1);
q = q_3_n ./ q_divide;
q_2_n = q(1:2, :);
end

