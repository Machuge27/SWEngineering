import pandas as pd 

data = {
    'name': ['John', 'Anna', 'Peter', 'Linda'],
    'location': ['New York', 'Paris', 'Berlin', 'London'],
    'age': [24, 13, 53, 33]
}

df = pd.DataFrame(data)

print("DataFrame: \n",df)

#write the data into a data.cs file
df.to_csv('data.csv', index=False)

