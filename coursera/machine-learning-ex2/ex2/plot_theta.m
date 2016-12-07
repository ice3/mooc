function plot_theta(X, y, lambdas)
% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)

for i=1:length(lambdas)

  lambda = lambdas(i)
  f = figure
  set(f, "visible", "off")

  % Set Options
  options = optimset('GradObj', 'on', 'MaxIter', 4000);

  % Optimize
  [theta, J, exit_flag] = ...
  fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

  % Plot Boundary
  plotDecisionBoundary(theta, X, y);
  hold on;
  title(sprintf('lambda = %g', lambda))

  % Labels and Legend
  xlabel('Microchip Test 1')
  ylabel('Microchip Test 2')

  legend('y = 1', 'y = 0', 'Decision boundary')
  hold off;

  % Compute accuracy on our training set
  p = predict(theta, X);

  fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

  print("MyPNG.png", "-dpng")
end

