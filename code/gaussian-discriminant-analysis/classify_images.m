warning('off', 'Octave:broadcast');
addpath('../util');

printf('Reading images and labels...\n');
[training_images, training_labels, images, labels] = get_images_and_labels();

% 784 TOO MUCH!!! USE SUM!! BAD FEATURE! BUT USE OTHERS TOO
% sum, sum of top half, sum of bottom half
ti_top = training_images(1:end/2,:);
ti_bottom = training_images(end/2+1:end,:);
training_features = [sum(training_images); sum(ti_top); sum(ti_bottom)];

i_top = images(1:end/2,:);
i_bottom = images(end/2+1:end,:);
features = [sum(images); sum(i_top); sum(i_bottom)];

num_labels = length(labels);

printf('Analyzing training samples...\n');

% Assume P(X|Y) is Gaussian. Get mean of each cluster, and covariance (they
% all share one). Also get prior probability P(Y). Then, P(Y|X) is simply
% P(X|Y)P(Y)/P(X) by Bayes' theorem. Find Y that maximizes P(Y|X) to categorize
% X (which is simply argmax(Y)(P(X|Y)P(Y)), since P(X) does not depend on Y).
k = 10;
phi = get_phi(training_labels, k);                             % Kx1
mu = get_mean(training_features, training_labels, k);            % KxD

sigma = get_covariance(training_features, training_labels, mu);  % DxD

%{
printf('Classifying images...\n');
p = get_p_x_given_y(features, mu, sigma);               % MxK

% P(X|Y)P(Y) :: MxK
probs = p .* phi';

printf('Comparing classifications against samples...\n');
[~, my_labels] = max(probs, [], 2); % Get row-wise maximum to find argmax(Y).
num_correct = sum(my_labels == labels);

printf('%d/%d (%f) images correctly classified.\n', num_correct, num_labels, ...
      num_correct/num_labels);
%}
