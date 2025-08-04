# Load required libraries
required_packages <- c("tidyverse")
for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
    cat("Installed package:", pkg, "\n")
  }
  library(pkg, character.only = TRUE)
}

# VISUALISATION 1: VIOLIN PLOT 
# Age distribution by antipsychotic type and gender


# load your individual data into r in a CSV and then turn into an object called 'antipsychotic data'
violin_plot <- ggplot(antipsychotic_data, 
                      aes(x = antipsychotic_type, y = age, fill = gender)) +
  
  # Create violin plots (show distribution shape)
  geom_violin(alpha = 0.7, position = position_dodge(width = 0.8)) +
  
  # Add median points for reference
  stat_summary(fun = median, geom = "point", 
               position = position_dodge(width = 0.8), 
               size = 2, color = "black") +
  
  # Colors and labels
  scale_fill_manual(values = c("Male" = "#3498db", "Female" = "#e74c3c")) +
  
  labs(title = "Age Distribution by Antipsychotic Type and Gender",
       subtitle = "Violin plots show distribution shape, dots show median age",
       x = "Antipsychotic Type",
       y = "Age (years)",
       fill = "Gender") +
  
  # Clean theme
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 10),
        axis.text.x = element_text(angle = 45, hjust = 1))

print(violin_plot)

# VISUALIZATION 2: STACKED BAR CHART 
# Employment type distribution by antipsychotic type


# Calculate proportions add your data here

employment_summary <- antipsychotic_data %>%
  count(antipsychotic_type, employment_type) %>%
  group_by(antipsychotic_type) %>%
  mutate(proportion = n / sum(n))

bar_plot <- ggplot(employment_summary, 
                   aes(x = antipsychotic_type, y = proportion, fill = employment_type)) +
  
  # Create stacked bars
  geom_bar(stat = "identity", position = "stack", alpha = 0.8) +
  
  # Convert to percentages
  scale_y_continuous(labels = scales::percent_format()) +
  
  # Nice color palette
  scale_fill_brewer(type = "qual", palette = "Set2") +
  
  labs(title = "Employment Status by Antipsychotic Type",
       subtitle = "Proportional distribution showing employment patterns",
       x = "Antipsychotic Type",
       y = "Proportion (%)",
       fill = "Employment Status") +
  
  # Clean theme
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 10),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom")

print(bar_plot)


# QUICK DATA SUMMARY 


cat("\n=== DATA SUMMARY ===\n")
cat("Total patients:", nrow(antipsychotic_data), "\n")
cat("Age range:", min(antipsychotic_data$age), "-", max(antipsychotic_data$age), "years\n")
cat("Study period:", min(antipsychotic_data$index_date), "to", max(antipsychotic_data$index_date), "\n")

# Summary table
summary_table <- antipsychotic_data %>%
  group_by(antipsychotic_type, gender) %>%
  summarise(
    count = n(),
    mean_age = round(mean(age), 1),
    .groups = "drop"
  )

print(summary_table)

# BONUS: Save plots (uncomment to save)


# ggsave("violin_plot.png", violin_plot, width = 10, height = 6, dpi = 300)
# ggsave("employment_plot.png", bar_plot, width = 10, height = 6, dpi = 300)

cat("\n Analysis complete! Two lovely visualisations created.\n")
cat(" Try changing colors, themes, or adding facet_wrap() for more insights!\n")
