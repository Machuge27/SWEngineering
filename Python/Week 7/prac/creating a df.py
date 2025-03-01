import pandas as pd

data = {
    'Name': ['John', 'Anna', 'Peter', 'Linda'],
    'Age': [25, 36, 29, 42],
    'City': ['New York', 'Paris', 'Berlin', 'London']
    
}

df = pd.DataFrame(data)

# adding a new row
new_row = {
    'Name': 'Tom',
    'Age': 35,
    'City': 'New York'
}

df.loc[len(df)] = new_row


# adding a new column
# df['Country'] = ['USA', 'France', 'Germany', 'UK', 'USA']


with open('data.csv', 'w') as f:
    df.to_csv(f, index=False)
    
    
print("Data Written to a csv file:\n ", df)    