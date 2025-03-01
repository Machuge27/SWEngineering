"""
# Objective For this Assignment

- To load and analyze a dataset using the pandas library in Python.
- To create simple plots and charts with the matplotlib library for visualizing the data.

## Submission Requirements

Submit a Jupyter notebook (.ipynb file) or Python script (.py file) containing:
- Data loading and exploration steps.
- Basic data analysis results.
- Visualizations.
- Any findings or observations.

## Task 1: Load and Explore the Dataset

1. Choose a dataset in CSV format (for example, you can use datasets like the Iris dataset, a sales dataset, or any dataset of your choice).
2. Load the dataset using pandas.
3. Display the first few rows of the dataset using `.head()` to inspect the data.
4. Explore the structure of the dataset by checking the data types and any missing values.
5. Clean the dataset by either filling or dropping any missing values.

## Task 2: Basic Data Analysis

1. Compute the basic statistics of the numerical columns (e.g., mean, median, standard deviation) using `.describe()`.
2. Perform groupings on a categorical column (for example, species, region, or department) and compute the mean of a numerical column for each group.
3. Identify any patterns or interesting findings from your analysis.

## Task 3: Data Visualization

Create at least four different types of visualizations:
1. Line chart showing trends over time (for example, a time-series of sales data).
2. Bar chart showing the comparison of a numerical value across categories (e.g., average petal length per species).
3. Histogram of a numerical column to understand its distribution.
4. Scatter plot to visualize the relationship between two numerical columns (e.g., sepal length vs. petal length).

Customize your plots with titles, labels for axes, and legends where necessary.

## Additional Instructions

### Dataset Suggestions

- You can use publicly available datasets from sites like Kaggle or UCI Machine Learning Repository.
- The Iris dataset (a classic dataset for classification problems) can be accessed via `sklearn.datasets.load_iris()`, which can be used for the analysis.

### Plot Customization

- Customize the plots using the matplotlib library to add titles, axis labels, and legends.
- Use seaborn for additional plotting styles, which can make your charts more visually appealing.

### Error Handling

- Handle possible errors during the file reading (e.g., file not found), missing data, or incorrect data types by using exception-handling mechanisms (`try`, `except`).

### Submission

- Ensure your submission is complete with all necessary code and explanations. Make sure that each plot is properly labeled and provides insights into the dataset.

"""

# Iris Dataset Analysis

# Import required libraries
import pandas as pd  # For data manipulation and analysis
import numpy as np  # For numerical operations
import matplotlib.pyplot as plt  # For plotting
import seaborn as sns  # For enhanced visualizations
from sklearn.datasets import load_iris  # To load the Iris dataset

# Task 1: Load and Explore the Dataset
def load_and_explore_dataset():
    """
    Loads the Iris dataset and performs basic exploration.

    Returns:
        pd.DataFrame: A DataFrame containing the Iris dataset with added species names.
    """
    try:
        # Load the Iris dataset from sklearn
        iris = load_iris()
        
        # Create a DataFrame with the data and target labels
        iris_df = pd.DataFrame(
            data=np.c_[iris['data'], iris['target']],  # Combine data and target columns
            columns=iris['feature_names'] + ['target']  # Set column names
        )
        
        # Map numerical target values (0, 1, 2) to species names
        species_map = {0: 'setosa', 1: 'versicolor', 2: 'virginica'}
        iris_df['species'] = iris_df['target'].map(species_map)  # Add a 'species' column
        
        # Display the first five rows of the dataset
        print("Dataset Head:")
        print(iris_df.head())
        
        # Display data types of each column
        print("\nData Types:")
        print(iris_df.dtypes)
        
        # Check for missing values in the dataset
        print("\nMissing Values:")
        print(iris_df.isnull().sum())
        
        return iris_df
    
    except Exception as e:
        # Handle errors during dataset loading
        print(f"Error loading dataset: {e}")
        return None

# Task 2: Basic Data Analysis
def perform_data_analysis(iris_df):
    """
    Performs basic statistical analysis on the Iris dataset.
    
    Args:
        iris_df (pd.DataFrame): The Iris dataset.
    """
    # Compute basic statistics for numerical columns
    print("\nBasic Statistics:")
    print(iris_df.describe())
    
    # Compute mean values of features grouped by species
    print("\nMean Values by Species:")
    print(
        iris_df.groupby('species')[  # Group data by species
            ['sepal length (cm)', 'sepal width (cm)', 'petal length (cm)', 'petal width (cm)']
        ].mean()  # Calculate the mean for each feature
    )

# Task 3: Data Visualization
def create_visualizations(iris_df):
    """
    Creates visualizations to analyze the Iris dataset.
    
    Args:
        iris_df (pd.DataFrame): The Iris dataset.
    """
    # Set the figure size for all plots
    plt.figure(figsize=(15, 10))
    
    # 1. Bar Chart: Average Petal Length by Species
    plt.subplot(2, 2, 1)  # Position the plot in a 2x2 grid
    sns.barplot(x='species', y='petal length (cm)', data=iris_df)  # Bar plot of petal length
    plt.title('Average Petal Length by Species')  # Add title
    plt.xlabel('Species')  # Label x-axis
    plt.ylabel('Petal Length (cm)')  # Label y-axis
    
    # 2. Histogram: Distribution of Petal Width
    plt.subplot(2, 2, 2)  # Position the plot in a 2x2 grid
    sns.histplot(
        data=iris_df, x='petal width (cm)', hue='species', multiple='stack'
    )  # Stacked histogram
    plt.title('Distribution of Petal Width')  # Add title
    plt.xlabel('Petal Width (cm)')  # Label x-axis
    plt.ylabel('Frequency')  # Label y-axis
    
    # 3. Scatter Plot: Sepal Length vs Petal Length
    plt.subplot(2, 2, 3)  # Position the plot in a 2x2 grid
    sns.scatterplot(
        data=iris_df, x='sepal length (cm)', y='petal length (cm)', hue='species'
    )  # Scatter plot with hue
    plt.title('Sepal Length vs Petal Length')  # Add title
    plt.xlabel('Sepal Length (cm)')  # Label x-axis
    plt.ylabel('Petal Length (cm)')  # Label y-axis
    
    # 4. Box Plot: Feature Comparisons
    plt.subplot(2, 2, 4)  # Position the plot in a 2x2 grid
    
    # Reshape data for boxplot (long-form format)
    iris_melted = iris_df.melt(
        id_vars=['species'],  # Columns to keep as identifiers
        value_vars=[
            'sepal length (cm)', 'sepal width (cm)', 
            'petal length (cm)', 'petal width (cm)'
        ],  # Features to reshape
        var_name='Feature', value_name='Value'  # New column names
    )
    
    # Create a boxplot for feature distribution
    sns.boxplot(x='Feature', y='Value', hue='species', data=iris_melted)
    plt.title('Feature Distribution by Species')  # Add title
    plt.xlabel('Feature')  # Label x-axis
    plt.ylabel('Value')  # Label y-axis
    plt.xticks(rotation=45)  # Rotate x-axis labels for readability
    
    # Adjust layout to prevent overlapping
    plt.tight_layout()
    
    # Display the plots
    plt.show()

# Main Execution
def main():
    """
    Main function to execute the analysis and visualization steps.
    """
    # Step 1: Load and explore dataset
    iris_df = load_and_explore_dataset()
    
    if iris_df is not None:  # Check if dataset was loaded successfully
        # Step 2: Perform data analysis
        perform_data_analysis(iris_df)
        
        # Step 3: Create visualizations
        create_visualizations(iris_df)

# Entry point for the script
if __name__ == "__main__":
    main()
