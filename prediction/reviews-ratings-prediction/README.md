# Reviews Ratings Prediction
Text Analytics &amp; Reviews Ratings Prediction with NLTK

<img src="https://data-flair.training/blogs/wp-content/uploads/sites/2/2018/08/NLTK-NLP-with-Python.jpg" width="500px">

In this project, I created the bag of words for reviews, performed Dimension Reduction (PCA), Ordered Logistic Regression, and Multinomial Logistic Regression to predict reviews ratings.

## Data
- reviewerID -ID of the reviewer, e.g. A2SUAM1J3GNN3B
- asin -ID of the product, e.g. 0000013714
- reviewerName -name of the reviewer
- helpful -helpfulness rating of the review, e.g. 2 out of 3 people found the review to be helpful. The starter code’s dataframe would have 2 in the helpful_start column and 3 in the helpful_end column
- reviewText -text of the review• overall -rating of the product
- summary -summary of the review
- unixReviewTime -time of the review

## Analysis Process
1. Preprocessing - remove stopwords
2. Handle Negation
3. Stemming
4. Create Bag-of-words vector
5. Calculate distance between reviews
6. Perform Dimension Reduction (PCA) on first 100 reviews
7. Ordered Logistic Regression
8. Multinomial Logistic Regression
9. Lasso Regression
10. Calculate Euclidean distance between different products
