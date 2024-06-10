function x = jpeg2im(y)  
%JPEG2IM Decodes an IM2JPEG compressed image. 
%   X = JPEG2IM(Y) decodes compressed image Y, generating 
%   reconstructed approximation X.  Y is a structure generated by 
%   IM2JPEG.  
% 
%   See also IM2JPEG. 
 
%   Copyright 2002-2004 R. C. Gonzalez, R. E. Woods, & S. L. Eddins 
%   Digital Image Processing Using MATLAB, Prentice-Hall, 2004 
%   $Revision: 1.4 $  $Date: 2003/10/26 18:39:08 $ 
 
error(nargchk(1, 1, nargin));             % Check input arguments 
 
m = [16 11  10  16  24  40  51  61        % JPEG normalizing array 
     12  12  14  19  26  58  60  55       % and zig-zag reordering 
     14  13  16  24  40  57  69  56       % pattern. 
     14  17  22  29  51  87  80  62 
     18  22  37  56  68  109 103 77 
     24  35  55  64  81  104 113 92 
     49  64  78  87  103 121 120 101 
     72  92  95  98  112 100 103 99]; 
 
order = [1 9  2  3  10 17 25 18 11 4  5  12 19 26 33  ... 
        41 34 27 20 13 6  7  14 21 28 35 42 49 57 50  ... 
        43 36 29 22 15 8  16 23 30 37 44 51 58 59 52  ... 
        45 38 31 24 32 39 46 53 60 61 54 47 40 48 55  ... 
        62 63 56 64]; 
rev = order;                          % Compute inverse ordering 
for k = 1:length(order) 
   rev(k) = find(order == k); 
end 
 
m = double(y.quality) / 100 * m;      % Get encoding quality. 
xb = double(y.numblocks);             % Get x blocks. 
sz = double(y.size); 
xn = sz(2);                           % Get x columns. 
xm = sz(1);                           % Get x rows. 
x = huff2mat(y.huffman);              % Huffman decode. 
eob = max(x(:));                      % Get end-of-block symbol 
 
z = zeros(64, xb);   k = 1;           % Form block columns by copying 
for j = 1:xb                          % successive values from x into 
   for i = 1:64                       % columns of z, while changing 
      if x(k) == eob                  % to the next column whenever 
         k = k + 1;   break;          % an EOB symbol is found. 
      else 
         z(i, j) = x(k); 
         k = k + 1; 
      end 
   end 
end 
 
z = z(rev, :);                                 % Restore order 
x = col2im(z, [8 8], [xm xn], 'distinct');     % Form matrix blocks 
x = blkproc(x, [8 8], 'x .* P1', m);           % Denormalize DCT 
t = dctmtx(8);                                 % Get 8 x 8 DCT matrix 
x = blkproc(x, [8 8], 'P1 * x * P2', t', t);   % Compute block DCT-1 
x = uint8(x + 128);                            % Level shift 