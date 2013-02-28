k = 2;

x = rand(1,100);
y = (x > .5)' + 1;

x2 = rand(1, 50);
y2 = (x2 > .5)' + 1;
num_labels = length(y2);

phi = get_phi(y, k);
mu = get_mean(x, y, k);
sigma = get_covariance(x, y, mu);

p = get_p_x_given_y(x2, mu, sigma);

% P(X|Y)P(Y) :: MxK
probs = p .* phi';

printf('Comparing classifications against samples...\n');
[~, my_labels] = max(probs, [], 2); % Get row-wise maximum to find argmax(Y).
num_correct = sum(my_labels == y2);

printf('%d/%d (%f) images correctly classified.\n', num_correct, num_labels, ...
      num_correct/num_labels);
