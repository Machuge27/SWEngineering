# Week 3 --- AI in Software Engineering

## AI in Software Engineering

[![Intro Video](./images/YT1.jpg)](https://youtu.be/C24yVfqibv8)

### Table of Contents
- Introduction to AI Automation, Decision-Making, and User Experience
- AI for Task Automation
- AI for Improved Decision-Making
- AI for Enhanced User Experiences
- Conclusion

### 1. Introduction to AI Automation, Decision-Making, and User Experience

Artificial Intelligence (AI) has become a transformative force across industries, enabling automation of repetitive tasks, improving decision-making through data-driven insights, and enhancing user experiences with personalized interactions. In this tutorial, we will explore how AI achieves these goals, provide real-world examples, and demonstrate Python implementations for each.

[![video](./images/YT2.jpg)](https://youtu.be/zSlkAO9jB8I)

### 2. AI for Task Automation

**Definition:**

AI automates repetitive and time-consuming tasks by leveraging algorithms and machine learning models, freeing up human resources for more complex activities.

**Example in Day-to-Day Life:**

Email Filtering: AI automatically categorizes emails into folders (e.g., Primary, Social, Promotions) using natural language processing (NLP).

**Implementation:**

Let's implement a simple email classification system using Python's `scikit-learn` library.

```python
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
```

### 3. AI for Improved Decision-Making

**Definition:**

AI improves decision-making by analyzing large datasets, identifying patterns, and providing actionable insights or predictions.

**Example in Day-to-Day Life:**

Fraud Detection: AI detects fraudulent transactions in real-time by analyzing transaction patterns and flagging anomalies.

**Implementation:**

Let's implement a fraud detection system using an anomaly detection algorithm (Isolation Forest).

```python
# Import necessary libraries
import numpy as np
import pandas as pd
from sklearn.ensemble import IsolationForest
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report, confusion_matrix

# Load a sample dataset (credit card transactions)
from sklearn.datasets import make_classification
X, y = make_classification(n_samples=1000, n_features=10, n_classes=2, weights=[0.99, 0.01], random_state=42)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train the Isolation Forest model
model = IsolationForest(contamination=0.01, random_state=42)
model.fit(X_train)

# Predict anomalies (fraudulent transactions)
y_pred = model.predict(X_test)
y_pred = np.where(y_pred == -1, 1, 0)  # Convert -1 (anomaly) to 1 (fraud)

# Evaluate the model
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred))
print("\nClassification Report:")
print(classification_report(y_test, y_pred))
```

### 4. AI for Enhanced User Experiences

**Definition:**

AI enhances user experiences by personalizing interactions, predicting user preferences, and providing intuitive interfaces.

**Example in Day-to-Day Life:**

Recommendation Systems: Netflix recommends movies and TV shows based on user preferences and viewing history.

**Implementation:**

Let's implement a simple recommendation system using collaborative filtering with Python's `surprise` library.

```python
# Import necessary libraries
import pandas as pd
from surprise import Dataset, Reader, KNNBasic
from surprise.model_selection import train_test_split
from surprise import accuracy

# Create a sample dataset (user-item ratings)
data = {
    'user_id': [1, 1, 1, 2, 2, 3, 3, 3, 4, 4],
    'item_id': [1, 2, 3, 1, 4, 2, 3, 4, 1, 3],
    'rating': [5, 4, 3, 4, 5, 2, 4, 3, 5, 4]
}
df = pd.DataFrame(data)

# Load the dataset into Surprise
reader = Reader(rating_scale=(1, 5))
dataset = Dataset.load_from_df(df[['user_id', 'item_id', 'rating']], reader)

# Split the data into training and testing sets
trainset, testset = train_test_split(dataset, test_size=0.2, random_state=42)

# Train the KNNBasic collaborative filtering model
model = KNNBasic(sim_options={'name': 'cosine', 'user_based': True})
model.fit(trainset)

# Make predictions on the test set
predictions = model.test(testset)

# Evaluate the model
print("RMSE:", accuracy.rmse(predictions))

# Recommend items for a user
user_id = 1
items = df['item_id'].unique()
for item_id in items:
    if df[(df['user_id'] == user_id) & (df['item_id'] == item_id)].empty:
        pred = model.predict(user_id, item_id)
        print(f"Predicted rating for user {user_id} on item {item_id}: {pred.est:.2f}")
```

### 5. Conclusion

In this tutorial, we explored how AI automates tasks, improves decision-making, and enhances user experiences. Each concept was explained with real-world examples and demonstrated through Python implementations.

- **Task Automation:** AI reduces manual effort by automating repetitive tasks like email filtering.
- **Improved Decision-Making:** AI provides data-driven insights for better decisions, such as fraud detection.
- **Enhanced User Experiences:** AI personalizes interactions and recommendations, improving user satisfaction.

By mastering these applications of AI, you can develop innovative solutions that transform industries and improve everyday life.