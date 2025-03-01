import matplotlib.pyplot as plt
import numpy as np

data = np.random.random(1000)

plt.hist(data, bins=30)
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.title('Histogram of random data') #Histogram plot for random data
plt.show()
