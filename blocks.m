%Lab 1 EE314L
%code takes 2 input integer values m/n
%and outputs a matrix split into 4
%quadrants with 0's in upper right
%and lower left and 1's in remaining
%quadrants. Dimensions of matrix are
%2m by 2n
function outMatrix = blocks(m,n)
Ones = ones(m,n);
Zeros = zeros(m,n);
outMatrix = [Ones, Zeros; Zeros, Ones];
end