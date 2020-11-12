# Spam Email Detection
_Create models to predict if an email message is spam or not_

## Data Exploration
- Percentage of spam in the data is 13.41%
- Finding 1: Spam message tends to be longer
- Finding 2: Spam message tends to have more digits
- Finding 3: Spam message tends to have more non-word characters

## Modeling
1. CountVectorizer & Multinomial Naive Bayes Classifier
2. TfidfVectorizer & Multinomial Naive Bayes Classifier
3. TfidfVectorizer & Support Vector Classification + Length of Document
4. TfidfVectorizer & Logistic Regression + Length of Document + # of digits per Document
5. CountVectorizer & Logistic Regression + + Length of Document + # of digits per Document + # of Non-word Characters
