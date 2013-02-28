function [training_images, training_labels, images, labels] = ...
      get_images_and_labels()

   training_images = loadMNISTImages('~/projects/cpe-428/lab5/data/train-images-idx3-ubyte');
   training_labels = loadMNISTLabels('~/projects/cpe-428/lab5/data/train-labels-idx1-ubyte');
   images = loadMNISTImages('~/projects/cpe-428/lab5/data/t10k-images-idx3-ubyte');
   labels = loadMNISTLabels('~/projects/cpe-428/lab5/data/t10k-labels-idx1-ubyte');

   % Change labels to class numbers.
   training_labels += 1;
   labels += 1;
end
