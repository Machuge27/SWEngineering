import pandas as pd

df = pd.read_csv('data.csv')

# Sorting
# Sort the DataFrame by Age in ascending order
df_sorted = df.sort_values('Age')
df_sorted_disc = df.sort_values('Age', ascending=False)  # Sort in descending order

print("Sorted:\n", df_sorted)
print("Sorted Descending:\n", df_sorted_disc)

# Sorting using multiple columns
# Sort the DataFrame by Age and then by City
df_sorted = df.sort_values(['Age', 'City'], ascending=[True, False]) # Sort by Age in ascending order and City in descending order
print("Sorted by Age and City:\n", df_sorted)

# Grouping and Aggregation
# Group the DataFrame by City and calculate the mean Age in each city
df_grouped = df.groupby('City').mean()
print("Grouped:\n", df_grouped)

# Group the DataFrame by City and calculate the mean and median Age in each city
df_grouped = df.groupby('City').agg({'Age': ['mean', 'median']})
print("Grouped with multiple aggregation functions:\n", df_grouped)

# 
grouped = df.groupby('City').agg({'Age': 'mean', 'Name': 'count'})
print(grouped)

# Summary Statistics
# Calculate the summary statistics of the DataFrame
summary = df.describe()
print("Summary:\n", summary)

# Calculate the summary statistics of the Age column
summary = df['Age'].describe()
print("Summary of Age column:\n", summary)

# Calculate the mean of the Age column
mean = df['Age'].mean()

# Calculate the median of the Age column
median = df['Age'].median()

# Calculate the mode of the Age column
mode = df['Age'].mode()

# calculating the sum
sum = df['Age'].sum()

# calculating the count
count = df['Age'].count()

# calculating the max
max = df['Age'].max()

print("Mean: ", mean)
print("Median: ", median)
print("Mode: ", mode)
print("Sum: ", sum)
print("Count: ", count)
print("Max: ", max)


# Calculate the standard deviation of the Age column
std = df['Age'].std()
print("Standard Deviation: ", std)

# Calculate the variance of the Age column
var = df['Age'].var()
print("Variance: ", var)

# Calculate the skewness of the Age column
# skew = df['Age'].skew()
# print("Skewness: ", skew)

# Calculate the kurtosis of the Age column
# kurt = df['Age'].kurt()
# print("Kurtosis: ", kurt)

# Calculate the correlation between Age and Salary columns
# corr = df['Age'].corr(df['Salary'])