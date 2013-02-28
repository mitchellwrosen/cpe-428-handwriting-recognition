% x is DxM
% mu is KxD
% sigma is DxD
% p is MxK, where p(i,j) is P(Xi|Yj)
function p = get_p_x_given_y(x, mu, sigma)
   m = columns(x);
   k = rows(mu);

   p = zeros(m, k);
   for i = 1 : k
      p(:,i) = mvnpdf(x', mu(i,:), sigma); % Dis shit fucked.
      %p(:,i) = my_mvnpdf(x', mu(i,:), sigma);
   end
end
