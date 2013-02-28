%{
          [ p(y(i) = 1 | x(i); theta) ]
h(x(i)) = [           ...             ] =
          [ p(y(i) = k | x(i); theta) ]

                         1                  [ exp(theta(1)'*x(i)) ]
        = --------------------------------- [         ...         ]
          sum(j=1 to k) exp(theta(j)'*x(i)) [ exp(theta(k)'*x(i)) ]


So, get h = [h(x(1)) h(x(2)) ... h(x(m))] (size KxM) so that
        h(i,j) = p(y(j) = i|x(j);theta)
%}
function h = hypothesis(x, theta)
   h = exp(theta' * x);
   h = h ./ sum(h); % Normalize (Matlab needs bsxfun).
end
