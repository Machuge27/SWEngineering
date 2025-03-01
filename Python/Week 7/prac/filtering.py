import pandas as pd

df = pd.read_csv('data.csv')

# Selecting Columns
age_col = df['Age']  # Selects the Age column
print(age_col)

# Filtering Rows based on a condition:
# Selecting rows where Age is greater than 30
df_filtered = df[df['Age'] > 30]
print(df_filtered)

# Multiple condition
# Get rows where Age is greater than 30 and City is 'New York'
df_filtered = df[(df['Age'] > 20) & (df['City'] == 'New York')]
print("MC:\n",df_filtered)

# Adding/Removing Columns:
df['Country'] = ['USA', 'Italy', 'Germany', 'UK']  # Adds a new column
print(df)
df.drop('Country', axis=1, inplace=True)  # Drops the 'Country' column
print(df)