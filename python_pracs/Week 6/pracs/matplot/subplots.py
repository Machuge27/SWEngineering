import matplotlib.pyplot as plt  # Importing the matplotlib library for plotting
import numpy as np  # Importing the numpy library for numerical operations

# Generating 100 linearly spaced values between 0 and 10
x = np.linspace(0, 10, 100)

# Calculating the sine and cosine of the generated values
y1 = np.sin(x)
y2 = np.cos(x)

# Creating a figure with two subplots arranged vertically (2 rows, 1 column)
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 6))

# Plotting the sine values on the first subplot
ax1.plot(x, y1, 'g-.')
ax1.set_xlabel('x')  # Setting the x-axis label for the first subplot
ax1.set_ylabel('sin(x)')  # Setting the y-axis label for the first subplot
ax1.set_title('Sinusoidal Graph')  # Setting the title for the first subplot

# Plotting the cosine values on the second subplot
ax2.plot(x, y2, 'b-.')  # Using a blue dash-dot line for the cosine plot
ax2.set_xlabel('x')  # Setting the x-axis label for the second subplot
ax2.set_ylabel('cos(x)')  # Setting the y-axis label for the second subplot
ax2.set_title('Cosinusoidal Graph')  # Setting the title for the second subplot

plt.tight_layout()  # Adjusting the layout to prevent overlap
plt.show()  # Displaying the plots