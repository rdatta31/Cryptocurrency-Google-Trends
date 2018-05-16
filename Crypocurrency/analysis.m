clc; clear; close all;

%% Read tables
S = readtable('bitcoinSearchHistory.csv'); %search history past 12 months
S = table2timetable(S);

P = readtable('bitcoinPrice.csv'); %Price past 12 months
P = table2timetable(P);


%% Normalizing Data between 0 and 1

S.bitcoin__Worldwide_ = S.bitcoin__Worldwide_./100;

M = max(P.ClosePrice);
P.ClosePrice = P.ClosePrice/M;

TT = synchronize(P,S,'regular','linear','TimeStep',days(1));

r = corrcoef(S.bitcoin__Worldwide_,P.ClosePrice);
disp(r);


%% Plots

figure
x = 0:51;
plot(S.Week,S.bitcoin__Worldwide_);hold on;
plot(P.Date,P.ClosePrice);hold on;





