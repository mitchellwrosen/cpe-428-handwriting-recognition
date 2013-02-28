% x is DxM
% y is Mx1
% mu is KxD
% sigma is DxD
function sigma = get_covariance(x, y, mu)
   sigma = zeros(rows(x));

   centered_x = x - mu(y,:)';
   sigma = centered_x/columns(x) * centered_x';
end
