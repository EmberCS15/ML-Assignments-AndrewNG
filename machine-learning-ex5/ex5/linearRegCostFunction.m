function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples
n = size(theta);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

h = X*theta;
a = (h.-y);
%fprintf("The value of n = %d",n)
J = (1/(2*m))*((h.-y)'*(h.-y))+(lambda/(2*m))*(theta(2:n)'*theta(2:n));
grad(1,1) = (1/m)*sum((a.*X(1:m,1)),1);
for i=(2:n),
  grad(i,1) = (1/m)*sum((a.*X(1:m,i)),1)+(lambda/m)*(theta(i,1));
end
% =========================================================================

grad = grad(:);

end
