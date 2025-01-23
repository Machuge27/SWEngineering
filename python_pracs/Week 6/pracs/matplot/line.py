# line graph using matplotlib

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('sin(x)')
plt.title('Sinusoidal Graph') #Line plot for sin(x)
# Line color and Style
# plt.plot(x, y, 'r--') # red dashed line
# plt.plot(x, y, 'g-') # green solid line
# plt.plot(x, y, 'b-.') # blue dash-dot line
# plt.plot(x, y, 'k:') # black dotted line
# plt.plot(x, y, 'm-') # magenta solid line
# plt.plot(x, y, 'c--') # cyan dashed line
# plt.plot(x, y, 'b-.') # blue dash-dot line
plt.show()