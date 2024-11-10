function [body, header, footer] = wjz_read_ge_rf(filename, binary_only);

%function [body, header, footer] = wjz_read_ge_rf(filename, binary_only);
%
%This file reads the GE RF files, including the
%following types:
%   .rho   .pha   .grx   .gry   .grz
%
%The 'binary_only' should be input as 1 if the input file has no header nor
%footer.
%
% - WJZ20120329

fid = fopen(filename, 'r');
fseek(fid, 0, 'eof');
size_total = ftell(fid);
fseek(fid, 0, 'bof');


if binary_only == 0
    size_header = 64; %in bytes;
    size_footer = 4; %in bytes;
    size_body = size_total - size_header - size_footer;

    count_header = size_header / 2; %'short' is 2 bytes per word;
    count_footer = size_footer / 2; 
    count_body = size_body / 2; 

    header = fread(fid, count_header, 'short', 'ieee-be');
    body = fread(fid, count_body, 'short', 'ieee-be');
    footer = fread(fid, count_footer, 'short', 'ieee-be');

    if header(4) ~= size_total
        error('Read out failed!!');
    end
elseif binary_only == 1
    size_body = size_total;
    count_body = size_body / 2;
    body = fread(fid, count_body, 'short', 'ieee-be');
    header = 0;
    footer = 0;
end

fclose(fid);