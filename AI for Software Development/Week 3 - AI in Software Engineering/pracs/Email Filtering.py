# Email Filtering

# Import necessary libraries
from sklearn.datasets import fetch_20newsgroups
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import make_pipeline
from sklearn.metrics import classification_report

# Load a sample dataset (20 Newsgroups)
categories = ['alt.atheism', 'soc.religion.christian', 'comp.graphics', 'sci.med']
train_data = fetch_20newsgroups(subset='train', categories=categories)
test_data = fetch_20newsgroups(subset='test', categories=categories)

# Create a pipeline for text classification
model = make_pipeline(TfidfVectorizer(), MultinomialNB())

# Train the model
model.fit(train_data.data, train_data.target)

# Predict on test data
predicted = model.predict(test_data.data)

# Evaluate the model
print(classification_report(test_data.target, predicted, target_names=test_data.target_names))