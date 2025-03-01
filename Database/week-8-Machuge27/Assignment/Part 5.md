# Integration Documentation: Loading Data from MySQL to Excel

This document outlines the process of exporting data from MySQL Workbench into a CSV file by right-clicking the table, importing it into Excel, and ensuring data consistency by converting text to columns.

---

## Step 1: Export Data from MySQL Workbench to CSV

1. **Locate the Table**:
   - Open MySQL Workbench and navigate to the database containing your table (e.g., `SchoolResourcePerformance`).

2. **Export the Table**:
   - Right-click on the table you want to export (e.g., `SchoolResourcePerformance`).
   - Select **Table Data Export Wizard** from the context menu.

3. **Configure Export Settings**:
   - In the export wizard:
     - Select the columns you want to export (or leave it as default to export all columns).
     - Choose the file format as **CSV**.
     - Specify the file path where you want to save the CSV file (e.g., `C:\Data\SchoolResourcePerformance.csv`).
   - Click **Next** and then **Finish** to export the data.

4. **Locate the CSV File**:
   - Navigate to the directory where the CSV file was saved (e.g., `C:\Data`).

---

## Step 2: Import the CSV File into Excel

1. **Open Excel**:
   - Launch Microsoft Excel.

2. **Import the CSV File**:
   - Go to the **Data** tab in Excel.
   - Click on **Get Data > From Text/CSV**.
   - Navigate to the location of the `SchoolResourcePerformance.csv` file and select it.

3. **Preview and Load Data**:
   - In the preview window, ensure the data looks correct.
   - Click **Load** to import the data into Excel.

---

## Step 3: Convert Text to Columns (if needed)

If your data is not properly split into columns (e.g., all data appears in a single column), follow these steps to convert text to columns:

1. **Select the Data**:
   - Highlight the column containing the data you want to split.

2. **Open the Text to Columns Wizard**:
   - Go to the **Data** tab in Excel.
   - Click on **Text to Columns**.

3. **Choose the File Type**:
   - In the wizard, select **Delimited** and click **Next**.

4. **Choose Delimiters**:
   - Check the box for **Comma** (since the CSV file is comma-delimited).
   - Click **Next**.

5. **Format Columns (Optional)**:
   - You can choose the data format for each column (e.g., General, Text, Date).
   - Click **Finish**.

6. **Verify the Data**:
   - Ensure the data is now correctly split into columns.

---

## Step 4: Ensure Data Consistency

1. **Check for Missing or Incorrect Data**:
   - Review the imported data for any missing or incorrect values.
   - Example: Ensure all `AvgStudentPerformance` values are numeric and within the expected range.

2. **Validate Data Against the Database**:
   - Compare the data in Excel with the original data in the MySQL database to ensure consistency.
   - Example: Verify that the number of rows and key metrics (e.g., average performance) match.

3. **Clean and Format Data**:
   - Remove any unnecessary rows or columns.
   - Format the data (e.g., apply number formatting, align text).

---

## Step 5: Save the Excel Workbook

1. **Save the File**:
   - Go to **File > Save As**.
   - Choose a location and save the file as `Education_Dashboard.xlsx`.

2. **Verify the Saved File**:
   - Open the saved file to ensure all data and formatting are preserved.

---

## Summary

- Data was exported from MySQL Workbench into a CSV file using the **Table Data Export Wizard**.
- The CSV file was imported into Excel using the **Get Data > From Text/CSV** feature.
- Text-to-columns conversion was performed to ensure proper data formatting.
- Data consistency was verified by comparing the Excel data with the original MySQL data.
- The final Excel workbook was saved as `Education_Dashboard.xlsx`.

---

This concludes the integration process. The Excel workbook is now ready for data analysis and dashboard creation.