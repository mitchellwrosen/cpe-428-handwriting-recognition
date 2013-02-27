% x is DxM
% y is 1xM
% theta is DxK

function softmax_log_likelihood(x, y, theta)
   m = columns(y);
   k = columns(theta);
   likelihood = 0;


   h = softmax_hypothesis(x, theta);
   for i = 1 : m
      product = 0;
      for l = 1 : k
         product *= softmax_hypothesis(x, theta)^(y(i) == l);
      end
      likelihood += log(product);
   end
end
