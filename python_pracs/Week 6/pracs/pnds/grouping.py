import pandas as pd 

df = pd.read_csv('data.csv')

#Grouping data
print("Grouping data: \n",df.groupby('location').sum())

#Grouping data by multiple columns
print("Grouping data by multiple columns: \n",df.groupby(['location','name']).sum())

#Grouping data by multiple columns and selecting a single column
print("Grouping data by multiple columns and selecting a single column: \n",df.groupby(['location','name'])['age'].sum())

#Grouping by age and get the average salary for each age
print("Grouping by age and get the average salary for each age: \n",df.groupby('age')['salary'].mean()) 