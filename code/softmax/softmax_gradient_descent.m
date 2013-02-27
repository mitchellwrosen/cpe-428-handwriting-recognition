function theta = softmax_gradient_descent(x, y, k, num_iterations)
   theta = ones(rows(x), k);
   alpha = 0.05;

   for i = 1 : num_iterations
      theta -= alpha * softmax_cost_derivative(x, y, theta);
   end
end
