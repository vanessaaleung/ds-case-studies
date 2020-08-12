# Modeling The Volatility Of Us Bond Yields
_Build a model to study the nature of volatility in the case of US government bond yields_

## Objective
Financial risk has many faces, and we measure it in many ways, but for now, let's agree that it is a measure of the possible loss on an investment. In financial markets, where we measure prices frequently, volatility (which is analogous to standard deviation) is an obvious choice to measure risk. But in real markets, volatility changes with the market itself.

In the picture above, we see the returns of four very different assets. All of them exhibit alternating regimes of low and high volatilities. The highest volatility is observed around the end of 2008 - the most severe period of the recent financial crisis.

## Analysis
### Evolution of Bond Yields
The yield of a bond is the price of the money lent. The higher the yield, the more money you receive on your investment. The yield curve has many maturities; in this case, it ranges from 1 year to 30 years. Different maturities have different yields, but yields of neighboring maturities are relatively close to each other and also move together.

We can see that the long yields (e.g. SVENY30) tend to be more stable in the long term, while the short yields (e.g. SVENY01) vary a lot. These movements are related to the monetary policy of the FED and economic cycles.

<img src="images/evolution.png" height="500px">

### Evolution of Votality
To understand how volatility evolves we have to examine the changes in the time series. We need to calculate the changes in the yield levels. This is called "differentiation" in time series analysis. Differentiation has the added benefit of making a time series **independent of time**.

- The direction (positive or negative) of a return is mostly independent of the previous day's return. In other words, you don't know if the next day's return will be positive or negative just by looking at the time series.
- The magnitude of the return is similar to the previous day's return. That means, if markets are calm today, we expect the same tomorrow. However, in a volatile market (crisis), you should expect a similarly turbulent tomorrow.

<img src="images/votality.png" height="500px">

#### Test for Autocorrelation
Autocorrelation measures how a datapoint's past determines the future of a time series.
- If the autocorrelation is close to 1, the next day's value will be very close to today's value.
- If the autocorrelation is close to 0, the next day's value will be unaffected by today's value.

<img src="images/autocorrelations.png" height="500px">

### GARCH
A Generalized AutoRegressive Conditional Heteroskedasticity (GARCH) model is the most well known econometric tool to handle changing volatility in financial time series data. It assumes a **hidden volatility** variable that has a long-run average it tries to return to while the short-run behavior is affected by the past returns.

<img src="images/garch1.png" height="500px">

<img src="images/garch20.png" height="500px">

We can see that the 1-year GARCH model shows a similar but more erratic behavior compared to the 20-year GARCH model. Not only does the 1-year model have greater volatility, but the volatility of its volatility is larger than the 20-year model. That brings us to two statistical facts of financial markets not mentioned yet.

- The unconditional (before GARCH) distribution of the yield differences has heavier tails than the normal distribution.
- The distribution of the yield differences adjusted by the GARCH model has lighter tails than the unconditional distribution, but they are still heavier than the normal distribution.

### Distributions

<img src="images/density.png" height="500px">

<img src="images/qqplot.png" height="500px">
