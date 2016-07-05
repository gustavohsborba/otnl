addpath('funcs/');
addpath('restrictions/');
%% TESTE:
precision = 0.000001; % Method Precision
precisionGR = 0.0001; % Gradient precision
f = 1; %objective function


%for i=1:12
    
    fprintf('\n\n\n---------- FUNCTION %d ----------\n\n', f);
    objectiveFunction = ['f' int2str(f)];
	
    % random initial point from -5 to 5
    %initPoint = rand(2,1)*10 - 5;
    initPoint = [3.2; 2.34];
    
    %plotMesh(objectiveFunction, -10:0.1:10, -10:0.1:10, [initPoint])
    %plotContour(objectiveFunction, -10:0.1:10, -10:0.1:10, [initPoint])
    
    fprintf('Initial point: \t\t[%.4f ; %.4f]\n\n', initPoint(1,1), initPoint(2,1));
    
    [xk1, k]=gradient_method(objectiveFunction, precisionGR, precision, initPoint);
    fprintf('Gradient method: \n [%.4f; %.4f] \t %d\n', xk1(1), xk1(2), k);
    
    [xk2, k]=newton(objectiveFunction, precisionGR, precision, initPoint);
    fprintf('Simple Newton method: \n [%.4f; %.4f] \t %d\n', xk2(1), xk2(2), k);
    
    [xk3, k]=enhanced_newton(objectiveFunction, precisionGR, precision, initPoint);
    fprintf('Enhanced Newton: \n [%.4f; %.4f] \t %d\n', xk3(1), xk3(2), k);
    
    [xk4, k]=ranked_newton(objectiveFunction, precisionGR, precision, initPoint);
    fprintf('Newton With rank Correction: \n [%.4f; %.4f] \t %d\n', xk4(1), xk4(2), k);
    
    [xk5, k]=quasi_newton(objectiveFunction, precisionGR, precision, initPoint);
    fprintf('Quasi-Newton: \n [%.4f; %.4f] \t %d\n', xk5(1), xk5(2), k);
    
    [xk6, k]=ellipsoidmethod(objectiveFunction, precisionGR, precision, initPoint)
    fprintf('Ellipsoid: \n [%.4f; %.4f] \t %d\n', xk6(1), xk6(2), k);
    
    
%end

fprintf('\n\n\n');
