# Import the necessary libraries
import matplotlib.pyplot as plt
import numpy as np

# Generate 100 random numbers for x and y coordinates
x = np.random.random(100)
y = np.random.random(100)

# Print the generated x and y values to the console
print("x: ", x)
print("y: ", y)

# Create a scatter plot with the generated x and y values
plt.scatter(x, y)

# Label the x-axis
plt.xlabel('x')

# Label the y-axis
plt.ylabel('y')

# Set the title of the scatter plot
plt.title('Scatter Plot of random data')

# Display the scatter plot
plt.show()