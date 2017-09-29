function im = grab_frame(x,y,M, N)
% Grabs a box of the current frame from the OS
%
% INPUTS: 
% x,y = topleft pel of rectangle, w.r.t. to the topleft of the screen
% M = height of box
% N = width of box
%
% OUTPUTS:
% im = MxNx3 single array, scaled to [0,1]
%
% Ryan Webster, 2017

robot = java.awt.Robot;
buffered_im = robot.createScreenCapture(java.awt.Rectangle(x, y, M, N));

im = typecast(buffered_im.getRGB(0,0,M,N,[],0,M),'uint8'); 


% remove every 4th element (all 255's, i.e. max value)
im = reshape(im,4,[]);
% BGR to RGB
im = im(3:-1:1,:);

% buffered_im is stored a bit differently than is standard in MATLAB,
% so permute, reshape etc.
im = single(permute(reshape(permute(im,[2,1]),M,N,3),[2,1,3]))/255;
