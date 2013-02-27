function pct_correct = softmax_gradient_descent2(training_images, ...
      training_labels, images, labels, k, num_iterations)
   theta = zeros(rows(training_images), k);
   alpha = 0.05;

   pct_correct = zeros(num_iterations, 1);
   num_labels = length(labels);

   for i = 1 : num_iterations
      printf('%d/%d\n', i, num_iterations);

      theta -= alpha * softmax_cost_derivative(training_images, ...
                                               training_labels, theta);

      hypothesis = softmax_hypothesis(images, theta);
      [~, my_labels] = max(hypothesis);
      pct_correct(i) = sum(my_labels' == labels) / num_labels;
   end
end
