warning('off', 'Octave:broadcast');
addpath('../util');

printf('Reading images and labels...\n');
[training_images, training_labels, images, labels] = get_images_and_labels();

% Prepend images with a row of 1s.
training_images = vertcat(ones(1, columns(training_images)), training_images);
images = vertcat(ones(1, columns(images)), images);

printf('Running softmax algorithm w/ gradient descent.\n');
num_iterations = 2;
pct_correct = gradient_descent2(training_images, training_labels, ...
      images, labels, 10, num_iterations);

scatter([1:length(pct_correct)], pct_correct, 10, 'blue', 'filled');
axis([1 num_iterations 0 1]);
pause
