import pandas as pd

df = pd.read_csv('data.csv')

#adding a new column

df['salary'] = [1000, 2000, 3000, 4000]

#save updated data to a new csv file
df.to_csv('data.csv', index=False)

print("DataFrame after adding a new column: \n",df)