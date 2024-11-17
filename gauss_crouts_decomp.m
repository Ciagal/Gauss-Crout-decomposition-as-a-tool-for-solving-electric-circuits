function [L, U, P] = gauss_crouts_decomp(A)
    % Gauss-Crout decomposition with row pivoting to avoid division by zero.
    % Inputs:
    %   A - Input matrix to decompose
    % Outputs:
    %   L - Lower triangular matrix
    %   U - Upper triangular matrix (diagonal of 1's)
    %   P - Permutation matrix representing row swaps
    
    [R, ~] = size(A);
    P = eye(R);  % Permutation matrix
    L = zeros(R); % Lower triangular matrix
    U = eye(R);   % Upper triangular matrix (diagonal of 1's)
    
    for k = 1:R
        % Pivoting: find the largest element in the column for stability
        [~, pivot_row] = max(abs(A(k:R, k)));
        pivot_row = pivot_row + k - 1; % Adjust for offset
        
        if pivot_row ~= k
            % Swap rows in A
            A([k pivot_row], :) = A([pivot_row k], :);
            % Swap rows in P
            P([k pivot_row], :) = P([pivot_row k], :);
            % Swap rows in L (only for columns processed so far)
            if k > 1
                L([k pivot_row], 1:k-1) = L([pivot_row k], 1:k-1);
            end
        end
        
        % Perform Gauss-Crout decomposition
        for i = k:R
            L(i, k) = A(i, k) - L(i, 1:k-1) * U(1:k-1, k);
        end
        for j = k+1:R
            U(k, j) = (A(k, j) - L(k, 1:k-1) * U(1:k-1, j)) / L(k, k);
        end
    end
end