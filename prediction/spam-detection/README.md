# Spam Email Detection
_Create models to predict if an email message is spam or not_

<p align="center">
  <img src="https://www.saleshandy.com/blog/wp-content/uploads/2017/01/wsi-imageoptim-11-Reasons-Why-Your-Email-Ends-Up-In-Spam.png" height="300px">
</p>

## Data
- The dataset contains 5572 messages, with 13.41% marked as spam message

<img src="data.png" height="250px">

## Data Exploration
- Finding 1: Spam message tends to be longer
- Finding 2: Spam message tends to have more digits
- Finding 3: Spam message tends to have more non-word characters

## Modeling
1. CountVectorizer & Multinomial Naive Bayes Classifier
2. TfidfVectorizer & Multinomial Naive Bayes Classifier
3. TfidfVectorizer & Support Vector Classification + Length of Document
4. TfidfVectorizer & Logistic Regression + Length of Document + # of digits per Document
5. CountVectorizer & Logistic Regression + + Length of Document + # of digits per Document + # of Non-word Characters

### Model Comparison
- The best model is Model 5

<img src="model-comparison.png">

- Smallest coefficient in the model: ['..', '. ', ' i', ' go', 'pe', ' y', '? ', ' h', 'ok', 'go']
- Largest coefficient in the model: ['digit_count', 'co', 'ww', 'ne', 'ar', 'ia', 'xt', ' x', 'mob', ' ch']
