function y = mat2huff(x)
%MAT2HUFF Huffman encodes a matrix.
% Y = mat2huff(X) Huffman encodes matrix X using symbol
% probabilities in unit-width histogram bins between X's minimum
% and maximum value s. The encoded data is returned as a structure
% Y :
% Y.code           the Huffman - encoded values of X, stored in
%                  a uint16 vector. The other fields of Y contain
%                  additional decoding information , including :
% Y.min            the minimum value of X plus 32768
% Y.size           the size of X
% Y.hist           the histogram of X
% 
% If X is logical, uintB, uint16 ,uint32 ,intB ,int16, or double,
% with integer values, it can be input directly to MAT2HUF F. The
% minimum value of X must be representable as an int16.
%
% If X is double with non - integer values --- for example, an image
% with values between O and 1 --- first scale X to an appropriate
% integer range before the call.For example, use Y
% MAT2HUFF (255 * X) for 256 gray level encoding.
%
% NOTE : The number of Huffman code words is round(max(X(:)))
% round (min(X(:)))+1. You may need to scale input X to generate
% codes of reasonable length. The maximum row or column dimension
% of X is 65535.

if ~ismatrix(x) || ~isreal(x) || (~isnumeric(x) && ~islogical(x))
    error('X must be a 2-D real numeric or logical matrix.');
end
% Store the size of input x.
y.size = uint32(size(x));
% Find the range of x values
% by +32768 as a uint16.
x = round(double(x));
xmin = min(x(:));
xmax = max(x(:));
pmin = double(int16(xmin));
pmin = uint16(pmin+32768);
y.min = pmin;
% Compute the input histogram between xmin and xmax with unit
% width bins , scale to uint16 , and store.
x = x(:)';
h = histc(x, xmin:xmax);
if max(h) > 65535
    h = 65535 * h / max(h);
end
h = uint16(h); 
y.hist = h;
% Code the input mat rix and store t h e r e s u lt .
map = huffman(double(h));            % Make Huffman code map
hx = map(x(:) - xmin + 1);           % Map image
hx = char(hx)';                      % Convert to char array
hx = hx(:)';
hx(hx == ' ') = [ ];                 % Remove blanks
ysize = ceil(length(hx) / 16);       % Compute encoded size
hx16 = repmat('0', 1, ysize * 16);   % Pre-allocate modulo-16 vector
hx16(1:length(hx)) = hx;             % Make hx modulo-16 in length
hx16 = reshape(hx16, 16, ysize);     % Reshape to 16-character words
hx16 = hx16' - '0';                  % Convert binary string to decimal
twos = pow2(15 : - 1 : 0);
y.code = uint16(sum(hx16 .* twos(ones(ysize ,1), :), 2))';