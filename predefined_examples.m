function [A, B] = predefined_examples(option)
    % This function provides predefined matrices for testing.
    % Depending on the user's choice, it returns a specific matrix A and vector B.
    switch option
        case 2
            A = [4, 1; 2, 2];
            B = [30; 30];
        case 3
            A = [70, 0, -30; 0, 20, 0; -30, 0, 30];
            B = [6; 4; 2];
        case 4
            A = [2, 2, 1, 0; 0, 2, 2, 3; 1, 3, 0, 1; 1, 1, 0, 2];
            B = [4; 1; 2; 3];
        case 9
            A = [9, -1, 0, -5, 0, 0, 0, 0, 0;
                -1, 34, -15, 0, -12, 0, 0, 0, 0;
                0, -15, 19, 0, 0, -1, 0, 0, 0;
                -5, 0, 0, 30, -5, 0, -18, 0, 0;
                0, -12, 0, -5, 29, -8, 0, -4, 0;
                0, 0, -1, 0, -8, 33, 0, 0, -9;
                0, 0, 0, -18, 0, 0, 44, -16, 0;
                0, 0, 0, 0, -4, 0, -16, 23, -1;
                0, 0, 0, 0, 0, -9, 0, -1, 20];
            B = [-5; 20; -15; 20; -30; 30; -20; 25; 0];
        case 0
            A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
            B = [1; 2; 3];
        otherwise
            A = [];
            B = [];
    end
end

