% x is DxM
% y is Mx1
% mu is KxD
function mu = get_mean(x, y, k)
   % num_y(i) is the number of training examples w/ label i.
   num_y = sum(y == [1:k])';

   for i = 1 : k
      mu(i,:) = sum((y == i) .* x');
   end

   mu ./= num_y;
end
