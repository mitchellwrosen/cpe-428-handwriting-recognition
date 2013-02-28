function pct_correct = gradient_descent2(training_images, training_labels, ...
      images, labels, k, num_iterations)
   theta = zeros(rows(training_images), k);
   alpha = 0.05;

   pct_correct = zeros(num_iterations, 1);
   num_labels = length(labels);

   for i = 1 : num_iterations
      printf('%d/%d\n', i, num_iterations);

      theta -= alpha * cost_derivative(training_images, training_labels, theta);

      h = hypothesis(images, theta);
      [~, my_labels] = max(h);
      pct_correct(i) = sum(my_labels' == labels) / num_labels;
   end
end
