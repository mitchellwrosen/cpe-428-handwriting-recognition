% Calculates d/dT J(T)
% x is (D+1)xM, y is Mx1, theta is (D+1)xK, grad is (D+1)xK
function grad = cost_derivative(x, y, theta)
   m = columns(x);
   k = columns(theta);

   h = hypothesis(x, theta);

   grad = -1/m * x * ((repmat(y',k,1) == [1:k]') - h)';
end

function test_vectorization(d, m, k)
   x = rand(d,m);
   y = 1+floor(10*rand(1,m));
   theta = rand(d,k);

   h = exp(theta' * x);
   h = h ./ sum(h); % Normalize (Matlab needs bsxfun)

   % Unvectorized.
   for j = 1 : k
      s = 0;
      for i = 1 : m
         s += x(:,i) * ((y(i) == j) - h(j,i));
      end
      ans1(:,j) = -1/m * s;
   end

   % One vectorization.
   for j = 1 : k
      ans2(:,j) = -1/m * x * ((y == j)' - h(j,:))';
   end

   % Two vectorizations.
   ans3 = -1/m * x * ((repmat(y',k,1) == [1:k]') - h)';

   ans1
   ans2
   ans3
end
