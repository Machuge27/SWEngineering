# Recommendation Systems

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