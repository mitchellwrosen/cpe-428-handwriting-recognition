% y is labels.
% k is number of unique labels.
% phi is Kx1
function phi = get_phi(y, k)
   phi = zeros(k, 1);
   phi = sum(y == [1:k])' / length(y);
end
