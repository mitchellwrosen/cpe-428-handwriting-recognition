% x is MxD
% mu is 1xD
% sigma is DxD
function y = my_mvnpdf(x, mu, sigma)
   d = columns(x);

   a = (2*pi)^(d/2) * det(sigma)^(0.5);

   cx = x - mu;
   %b = -0.5 * cx * pinv(sigma) * cx';
   b = -0.5 * sum(cx * pinv(sigma) .* cx, 2);

   y = 1/a * exp(b);
end
