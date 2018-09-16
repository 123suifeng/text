%demo for the FK

clear all;
close all;
clc;


% the limits of joint value
% trans [-30, 30]
% roll, [-[i/2, [i/2]
% Q1   [-pi/2, pi/2]
% Q3   [-pi/2, pi/2]
[T, R]=FK(0 ,pi/6 ,pi/7 ,pi/10);