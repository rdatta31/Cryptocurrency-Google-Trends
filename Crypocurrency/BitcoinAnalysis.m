clc; clear; close all;

%% Read tables
S = readtable('bitcoinSearchHistory.csv'); %search history past 12 months
S = table2timetable(S);

SB = readtable('SellBitcoin.csv'); %search history past 12 months
SB = table2timetable(SB);

BB = readtable('BuyBitcoin.csv'); %search history past 12 months
BB = table2timetable(BB);

P = readtable('bitcoinPrice.csv'); %Price past 12 months
P = table2timetable(P);
P(1:4,:) = [];
P = P(1:7:end,:);

%% Normalizing Data between 0 and 1

normS = S.bitcoin__Worldwide_./100;
normSB = SB.sellBitcoin__Worldwide_./100;
normBB= BB.buyBitcoin__Worldwide_./100;

M = max(P.ClosePrice);
normP = P.ClosePrice./M;

TT = synchronize(P,S,'regular','linear','TimeStep',days(1));

r = corrcoef(normS,normP);


%% Plots

figure
box on;
plot(S.Week,normS,'LineWidth',0.8);hold on;
plot(P.Date,normP,'LineWidth',0.8);hold on;
title('Variation of Bitcoin Price and Google Searches for \itBitcoin');
legend('Google Searches','Price');
ax = gca;
        set(gca, 'Fontname','Times New Roman');
        set(gca, 'Fontsize',10);
        ylim([0 1.1]);
        
figure
box on;
plot(SB.Week,normSB,'LineWidth',0.8);hold on;
plot(BB.Week,normBB,'LineWidth',0.8); hold on;
plot(P.Date,normP,'LineWidth',0.8); hold on;
title('Variation of Bitcoin Price and Google Searches for \it Sell Bitcoin & Buy Bitcoin');
legend('Google Searches for \it Sell Bitcoin', 'Google Searches for \it Buy Bitcoin','Price');
ax = gca;
        set(gca, 'Fontname','Times New Roman');
        set(gca, 'Fontsize',10);
        ylim([0 1.1]);

%% Regression Model
%Bitcoin
figure
box on;
plot(S.bitcoin__Worldwide_,P.ClosePrice,'o','LineWidth',0.8);hold on;
title('Price vs Search Volume Index');
xlabel('Google Trends Search Volume Index');
ylabel('Price, USD')
ax = gca;
        set(gca, 'Fontname','Times New Roman');
        set(gca, 'Fontsize',10);
 
[rr,pp] = corrcoef(S.bitcoin__Worldwide_,P.ClosePrice);
xx = 1:100;
PP = polyfit(S.bitcoin__Worldwide_,P.ClosePrice,1);
yy = polyval(PP, xx);
plot(xx,yy,'--','LineWidth',0.75);
eq = sprintf('Price = %0.2f*SVI + %0.3f',PP(1),PP(2));
text(mean(xx),mean(yy),eq);
disp(eq);

%Buy Bitcoin
figure
box on;
plot(BB.buyBitcoin__Worldwide_,P.ClosePrice,'o','LineWidth',0.8);hold on;
title('Price vs Search Volume Index');
xlabel('Google Trends Search Volume Index');
ylabel('Price, USD')
ax = gca;
        set(gca, 'Fontname','Times New Roman');
        set(gca, 'Fontsize',10);
 
[rr1,pp1] = corrcoef(BB.buyBitcoin__Worldwide_,P.ClosePrice);
xx = 1:100;
PP = polyfit(BB.buyBitcoin__Worldwide_,P.ClosePrice,1);
yy = polyval(PP, xx);
plot(xx,yy,'--','LineWidth',0.75);
eq = sprintf('Price = %0.2f*SVI + %0.3f',PP(1),PP(2));
text(mean(xx),mean(yy),eq);
disp(eq);

% %shift data by 2 weeks
% figure
% box on;
% % weeks = 0:51;
% % plot(weeks,normBB,'LineWidth',0.8); hold on;
% % plot(weeks(1:end-2),normP(3:end),'LineWidth',1); hold on;
% figure
% X = BB.buyBitcoin__Worldwide_(1:end-2);
% Y = P.ClosePrice(3:end);
% plot(X,Y,'o','LineWidth',0.8);hold on;
% title('Price vs Search Volume Index');
% xlabel('Google Trends Search Volume Index');
% ylabel('Price, USD')
% ax = gca;
%         set(gca, 'Fontname','Times New Roman');
%         set(gca, 'Fontsize',10);
%  
% [rr,pp] = corrcoef(X,Y);
% xx = 1:100;
% 
% PP = polyfit(X,Y,1);
% yy = polyval(PP, xx);
% plot(xx,yy,'--','LineWidth',0.75);
% eq = sprintf('Expected Price = %0.2f*SVI + %0.3f',PP(1),PP(2));
% text(mean(xx),mean(yy),eq);
% disp(eq);
% 
% %%
% % expected price in 2 weeks
% f = @(x) PP(1).*x + PP(2);
% svi = BB.buyBitcoin__Worldwide_;
% exp_P = f(svi);
% weeks = 0:51;
% figure
% plot(weeks,P.ClosePrice);hold on;
% plot(weeks+2,exp_P);
% legend('Actual','Predicted');
% 
% 
% 
% 

