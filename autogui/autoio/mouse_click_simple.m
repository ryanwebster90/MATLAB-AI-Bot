function mouse_click_simple(x,y,click_type,varargin)
% Presses a mouse button and releases it
% INPUTS:
% x,y = pel to click
% click_type = 0,1 for left, right respectively
% OPTIONS:
% 'sleep' specifices sleep time after click is performed (in ms)
% this is almost always performed, to give the OS time to register the
% click
% 'click_duration' how long the click is held (in ms)
%
% Ryan Webster, 2017

%sleep _after_ the button has been released
opts.sleep = 0;
%micro sleep between click and unclick
opts.click_duration = 0;
opts = vl_argparse(opts,varargin);

x = cast(x,'int16');
y = cast(y,'int16');


robot = java.awt.Robot;
robot.mouseMove(x,y);

%hold button down
if click_type == 0
  robot.mousePress(java.awt.event.InputEvent.BUTTON1_DOWN_MASK);
elseif click_type == 1
  robot.mousePress(java.awt.event.InputEvent.BUTTON3_DOWN_MASK);
end

robot.delay(opts.click_duration);

%release button
if click_type == 0
  robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_DOWN_MASK);
elseif click_type == 1
  robot.mouseRelease(java.awt.event.InputEvent.BUTTON3_DOWN_MASK);
end

% sleep after action is performed, to give OS time to register click
robot.delay(opts.sleep);







