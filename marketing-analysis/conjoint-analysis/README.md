# Conjoint Analysis in TV Design

**What is Conjoint Analysis**

<img src="https://www.questionpro.com/userimages/site_media/questionpro-conjoint-analysis-example.jpg">

Conjoint analysis is a marketing research technique employed to understand the customers’ preferences for different product attributes or features and their willingness to pay (WTP) for a certain feature. Conjoint analysis is also used to forecast the market share, optimal price, etc to see if a new product could be widely accepted in the market.
For example, in this conjoint analysis project, we are primarily interested in determining the reaction of the market to our new TV design, so we analyzed each feature that included screen size, technology, brand, and price. After conducting the analysis, we were able to answer the following questions:
- What features do potential customers value the most and their willingness to pay for it (WTP);
- What is the optimal price per TV to be set in the market;
- What could be the market share based on the current competitive environment
- What is the maximum profit the firm can expect to earn at the optimal price?

**What are Partworths**

Partworths are numerical scores that measure the relative importance of each feature. They are estimated by regressing customer preferences on each attribute dummies from the profiles of the products.

**Data Source**

To conduct a conjoint analysis, we needed two sources of data. Firstly, profiles of different products, both ours and our competitors, are required. Attributes and attribute levels of the products were collected to construct the profiles. Secondly, preference data on the products needed to be collected. Customers’ preferences of the products were input in a manner (rankings, ratings, etc.) that allowed the preferences to be ranked for the estimate of Partworths.

**Function Usage**

Input:
1. Preferences
2. Design matrix

Output:
1. Partworth estimates
2. Attribute importance (%)
3. Willingness to pay for each attribute ($)
4. Optimal price
5. Market share at optimal price
6. Maximum profit at optimal price
