## Predicting Fluctuations in Cryptocurrency Prices from Google Trends Data

**Introduction**

The objective of this study is to determine if any correlation of statistical significance exists between the price of the cryptocurrency Bitcoin and the popularity of the search term Bitcoin on Google. The hypothesis follows that Interest in the cryptocurrency can be measured via the search volume of Bitcoin related terms on Google. These terms may be used as indicator of demand for Bitcoin, and predict future price changes in the short term. 

**Methodology**

Price of Bitcoin was obtained from Coindesk, and the Search Volume Index (SVI)  for the term Bitcoin was obtained from Google Trends, for the time period between May, 2107 and May, 2018. Both sets of data were normalized for comparison of how changes in the search volume correlate with changes in the price. 

![fig1](https://github.com/rdatta31/Cryptocurrency-Google-Trends/blob/master/Images/Price_SVIBitcoin.png)

<img src="https://github.com/rdatta31/Cryptocurrency-Google-Trends/blob/master/Images/Price_SVIBitcoin.png" class="img-responsive" alt="">

*Figure 1: Variation of Bitcoin Price and Google Search Results for Bitcoin with Time*

Figure 1 shows that the price follows the same trend as the SVI. When more people are talking about Bitcoin, the price of the cryptocurrency is high and vice versa.  The correlation coefficient was found to be $$r = 0.8742$$. The data depicts that a peak in the SVI is typically followed by a peak in the price. Similarly, a dip in popularity of Bitcoin is followed by a dip in the price. The lag time between SVI and price is about two weeks. 

![fig2](https://github.com/rdatta31/Cryptocurrency-Google-Trends/blob/master/Images/Price_SVIBitcoinSellBuy.png)

*Figure 2: Variation of Bitcoin Price with Google Search Results for Bitcoin*

Figure 2 shows the linear regression model of the variation of the price of bitcoin with SVI. The regression model equation was found to be $$Price = 149.85*SVI + 3051.732$$. The correlation coefficient ($$r = 0.8742$$) is high, while the p-value is low ($$p−value = 4.368*10^{−11}$$). Since the p-value is less than 5%, the  effect of randomness of the data is negligible.
The same analysis was performed with the search terms Buy Bitcoin and Sell Bitcoin. 

![fig3](https://github.com/rdatta31/Cryptocurrency-Google-Trends/blob/master/Images/SVIBitcoinRegression.png)

*Figure 3: Variation of Bitcoin Price and Google Search Results for Buy Bitcoin & Sell Bitcoin with Time*

The same trend was observed, as shown in Figure 3. Something to note is that the SVI for the terms Buy Bitcoin and Sell Bitcoin seems to follow the same trend. Both search terms are equally popular at any point in time. The lag between the peak popularities of the search terms is again found to be about 2 weeks. 

![fig4](https://github.com/rdatta31/Cryptocurrency-Google-Trends/blob/master/Images/SVIBitcoinRegression2.png)

*Figure 4: Variation of Bitcoin Price with SVI for Buy Bitcoin*

Figure 4 shows the linear regression model of the variation of the price of bitcoin with SVI for the search term Buy Bitcoin. The regression model equation was found to be Price = 117.18*SVI + 4624.283. The correlation coefficient ($$r = 0.7653$$) is not as high as that for the search term Bitcoin, and the p-value is low ($$p−value = 5.08*10^{−6}$$). Since the p-value is less than 5%, the  effect of randomness of the data is negligible.

**Conclusions**

The terms Buy Bitcoin, Sell Bitcoin and Bitcoin can be seen as indicators of the demand for the cryptocurrency. When the SVIs for these terms are rising, the price of the cryptocurrency continues to rise and vice versa. However, the results only show statistically significant correlation, not causation. The dimensions affecting price are simply too many.  A BLSH (Buy Low Sell High) short term-strategy based on these results seems to be as follows 1) Buy bitcoin ~ 2 weeks after when SVI is at a minimum 2) Sell Bitcoin ~2 weeks after SVI is at a maximum.
