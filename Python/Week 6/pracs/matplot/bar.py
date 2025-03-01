import matplotlib.pyplot as plt
import numpy as np

x = ['Apples', 'Bananas', 'Cherries', 'Dates', 'Elderberries']
y = [5, 3, 7, 9, 1]

plt.bar(x, y)
plt.xlabel('Fruits')
plt.ylabel('Quantity')
plt.title('Bar Graph of Fruit qualities')
plt.show()