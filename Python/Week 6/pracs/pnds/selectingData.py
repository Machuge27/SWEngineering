import pandas as pd

df = pd.read_csv('data.csv')

#selecting single column
print("Selecting single column: \n",df['name'])

#selecting multiple columns
print("Selecting multiple columns: \n",df[['name','age']])

#selecting rows
print("Selecting rows: \n",df[1:3])

#selecting rows by index
print("Selecting rows by index: \n",df.loc[1:3])
print("Selecting rows by index: \n",df.loc[0])
print("Selecting rows by index: \n",df.iloc[1:3])

#selecting rows and columns
print("Selecting rows and columns: \n",df.loc[1:3,['name','age']])

#selecting rows by condition
print("Selecting rows by condition: \n",df[df['age']>30])



