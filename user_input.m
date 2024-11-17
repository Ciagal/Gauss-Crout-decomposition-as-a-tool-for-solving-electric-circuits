function [A, B] = user_input()
    % This function allows the user to input a custom matrix A and vector B.
    % The matrix and vector are initialized with "X" to visually represent them.
    try
        N = input('Input the size of matrix A: ');
        if N <= 0
            error('Matrix size must be a positive integer.');
        end
        
        % Initialize matrix A and vector B with "X"
        A = strings(N);
        B = strings(N, 1);
        
        % Display the initial state of A
        disp('Matrix A (initial):')
        for i = 1:N
            for j = 1:N
                A(i, j) = "X";
            end
        end
        disp(A)
        
        % Input elements of matrix A
        disp('Input elements of matrix A row by row:')
        for i = 1:N
            for j = 1:N
                prompt = sprintf('Enter A(%d, %d): ', i, j);
                A(i, j) = input(prompt);
                clc;
                disp('Updated Matrix A:')
                disp(A)
            end
        end
        
        % Convert A to numeric
        A = double(A);
        
        % Display the initial state of B
        disp('Vector B (initial):')
        for i = 1:N
            B(i, 1) = "X";
        end
        disp(B)
        
        % Input elements of vector B
        disp('Input elements of vector B:')
        for i = 1:N
            prompt = sprintf('Enter B(%d): ', i);
            B(i, 1) = input(prompt);
            clc;
            disp('Updated Vector B:')
            disp(B)
        end
        
        % Convert B to numeric
        B = double(B);
    catch
        A = [];
        B = [];
        disp('Error in input. Please ensure all entries are valid numbers.');
    end
end
