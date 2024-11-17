clear; clc;
disp("Welcome to the Gauss-Crout equation solving program!")
disp('OPTIONS:')
disp('1) Ready-made examples')
disp('2) Input your problem')
disp('0) Shut down')
G = input('Select option: ');

switch(G)
    case 1
        clc;
        disp('Available OPTIONS:')
        disp('2) Matrix A 2x2, 2 unknowns')
        disp('3) Matrix A 3x3, 3 unknowns')
        disp('4) Matrix A 4x4, 4 unknowns')
        disp('9) Matrix A 9x9, 9 unknowns')
        disp('0) Invalid system (det(A) = 0)')
        M = input('Select option: ');
        clc;
        [A, B] = predefined_examples(M);
        if isempty(A)
            disp('Invalid selection or singular matrix.');
            return;
        end
    case 2
        clc;
        [A, B] = user_input();
        if isempty(A)
            disp('Error in input. Exiting...');
            return;
        end
    case 0
        disp('Program terminated.');
        return
    otherwise
        disp('Invalid option. Please restart the program.');
        return
end

clc;
disp('Matrix A:')
disp(A)
disp('Matrix B:')
disp(B)

% Perform Gauss-Crout decomposition
[L, U, P] = gauss_crouts_decomp(A);

% Display results
disp('Permutation matrix P:')
disp(P)
disp('Lower triangular matrix L:')
disp(L)
disp('Upper triangular matrix U:')
disp(U)

% Calculate the determinant, accounting for the permutation matrix
determinant = prod(diag(L)) * det(P);
disp(['Determinant of matrix A: ', num2str(determinant)]);

if determinant == 0
    disp('The determinant of matrix A is zero. The system has no unique solution.');
else
    % Adjust vector B according to the permutation matrix P
    B_permuted = P * B;
    % Solve the system
    x = solve(L, U, B_permuted);
    disp('Solution vector X:')
    disp(x)
end
