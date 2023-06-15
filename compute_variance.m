function [outvalue] = compute_variance(vector);
var_mean = mean(vector);
outvalue = 1/(length(vector)-1)*sum((vector-var_mean).^2);
end