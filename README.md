# Antipsychotic Prescription Analysis

A simple R script for visualising antipsychotic prescription patterns using CRIS data.

## Overview

This script creates two visualisations to explore patterns in antipsychotic prescriptions:
1. **Violin Plot**: Age distribution by antipsychotic type and gender
2. **Stacked Bar Chart**: Employment status distribution by antipsychotic type

## Prerequisites

- R (version 4.0 or higher recommended)
- RStudio (optional but recommended)

## Required Packages

The script will automatically install and load the required package:
- `tidyverse` (includes ggplot2, dplyr, and other essential packages)

## Data Requirements

Your CSV file should contain the following columns:

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| `antipsychotic_type` | Character | Type of antipsychotic (e.g., "Typical", "Atypical", "Polypharmacy") |
| `age` | Numeric | Patient age at prescription |
| `gender` | Character | Patient gender ("Male", "Female") |
| `employment_type` | Character | Employment status (e.g., "Employed", "Unemployed", "Disability_pension") |
| `index_date` | Date | Date of first prescription (YYYY-MM-DD format) |

## How to Use

1. **Prepare your data**:
   - Save your data as a CSV file
   - Ensure column names match the requirements above

2. **Load your data**:
   ```r
   # Replace "your_data_file.csv" with your actual file path
   antipsychotic_data <- read_csv("your_data_file.csv")
   ```

3. **Run the script**:
   - Copy and paste the code into R or RStudio
   - Execute the entire script
   - The visualisations will appear in your plots panel

4. **Save plots** (optional):
   - Uncomment the `ggsave()` lines at the end of the script
   - Plots will be saved as PNG files in your working directory

## Output

The script generates:
- A violin plot showing age distributions
- A stacked bar chart showing employment patterns
- A data summary printed to the console
- A summary table by antipsychotic type and gender

## Customisation Options

You can easily modify:
- **Colors**: Change the `scale_fill_manual()` values
- **Themes**: Replace `theme_minimal()` with `theme_classic()` or others
- **Plot dimensions**: Adjust `width` and `height` in `ggsave()`
- **Additional grouping**: Add `facet_wrap()` for more detailed breakdowns

## Example Modifications

```r
# Add faceting by employment type
violin_plot + facet_wrap(~employment_type)

# Change colour scheme
bar_plot + scale_fill_viridis_d()

# Modify theme
violin_plot + theme_classic()
```

## Troubleshooting

**Common issues:**

- **Column name errors**: Ensure your CSV columns match the expected names exactly
- **Date format issues**: Dates should be in YYYY-MM-DD format
- **Missing values**: The script assumes clean data; remove or handle NA values if present

**Getting help:**
- Check column names with `colnames(antipsychotic_data)`
- View data structure with `str(antipsychotic_data)`
- Check for missing values with `summary(antipsychotic_data)`

## Learning Outcomes

After completing this exercise, you will understand:
- How to create violin plots for distribution visualisation
- How to make stacked bar charts for categorical comparisons
- Basic data manipulation with dplyr
- Professional plot formatting with ggplot2
- How to summarise and explore your data

## Next Steps

Consider exploring:
- Time series analysis using the index_date column
- Additional grouping variables
- Statistical tests for group differences
- Interactive plots using plotly
