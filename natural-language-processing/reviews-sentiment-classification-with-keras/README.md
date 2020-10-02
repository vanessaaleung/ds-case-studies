# Reviews Sentiment Classification With Keras
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSoe2OI2-615f_qj1u50xsTSbpWEAaeoX22JMUjy0knxyTlM8bo&usqp=CAU" width="400px">

### Data
--------------------
<a href="https://archive.ics.uci.edu/ml/datasets/Sentiment+Labelled+Sentences">Sentiment Labelled Sentences Data Set</a> from the UCI Machine Learning Repository
<img src="data.png" width="400px">

### Tasks
----------------------
- Baseline model: bag-of-word model with Logistic Regression
  <ol>
    <li>Vectorize sentences: takes words and creates a vocabulary of unique words</li>
    <li>Create bag of words model by representing each document as a vector</li>
    <li>Build a logistic regression model with `label` field as the y variable and bag of words vectors as the x variable</li>
  </ol>
- Keras neural networks model
  <ol>
    <li>Use a ReLU function for hidden layers, a sigmoid function for the output layer</li>
  </ol>
<img src="https://files.realpython.com/media/njanakiev-1d-convolution.d7afddde2776.png" width="500px">

- Convolutional neural networks

- Hyperparameters Optimization
