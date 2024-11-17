function [x] = solve(L, U, B)
    
    % Solve a linear system given L (lower triangular), U (upper triangular), and B.
    % Uses forward substitution for L and backward substitution for U.
    % Inputs:
    %   L - Lower triangular matrix
    %   U - Upper triangular matrix
    %   B - Adjusted right-hand side vector
    % Outputs:
    %   x - Solution vector
    
    [R, ~] = size(L);
    y = zeros(R, 1); % Forward substitution
    x = zeros(R, 1); % Backward substitution
    
    % Forward substitution for Ly = B
    for i = 1:R
        y(i) = (B(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
    end
    
    % Backward substitution for Ux = y
    for i = R:-1:1
        x(i) = (y(i) - U(i, i+1:R) * x(i+1:R));
    end
end

