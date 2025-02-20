# Import necessary libraries
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import numpy as np
import matplotlib.pyplot as plt

# Sample data for house price prediction [size (in square feet), number of bedrooms]
X = np.array([[2104, 3], [1600, 3], [2400, 3], [1416, 2], [3000, 4]])

# Sample data for house price prediction [price (in dollars)]
y = np.array([400000, 330000, 369000, 232000, 540000])

# Split the data into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create and train the model
model = LinearRegression()
model.fit(X_train, y_train)

# Predict the price of a house with size 3000 square feet and 3 bedrooms
price = model.predict([[3000, 3]])
print(f"The predicted price of the house is: ${price[0]:.2f}")

# Plotting the data
fig, ax1 = plt.subplots()

# Bar plot for size
ax1.bar(np.arange(len(X)), X[:, 0], color='b', alpha=0.6, label='Size (square feet)')
ax1.set_xlabel('House Index')
ax1.set_ylabel('Size (square feet)', color='b')
ax1.tick_params(axis='y', labelcolor='b')

# Create a second y-axis for the price
ax2 = ax1.twinx()
ax2.plot(np.arange(len(X)), y, color='r', marker='o', linestyle='-', label='Price (dollars)')
ax2.set_ylabel('Price (dollars)', color='r')
ax2.tick_params(axis='y', labelcolor='r')

# Show plot
fig.tight_layout()
plt.show()