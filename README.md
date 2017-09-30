# MATLAB-AI-Bot

Inspired by the recent work in Q learning (e.g. "Playing Atari with Deep Reinforcement Learning") 
and projects like open ai gym, this repository will be dedicated to gaming bots entirely in MATLAB. Rather
than interacting directly with the gaming environment, this repo will depend on frame grabbing and mouse/keyboard
automation, so that in theory it could interact with any application, albeit through 
sending IO to the OS. Screen grabbing and key sending is accomplished in MATLAB by invoking java.
