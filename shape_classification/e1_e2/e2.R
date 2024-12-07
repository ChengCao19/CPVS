# Load the saved variables
load("all_varieties.RData")

# Create empty vectors to store all varieties' sf2 values and variety names
all_e2 <- c()
all_e2_varieties <- c()

# Iterate over all varieties
for (variety in names(all_varieties)) {
  # Get the sheet2 data for the current variety
  sheet2_data <- all_varieties[[variety]]$sheet2
  
  e2_values = as.numeric(sheet2_data$e2)
  
  e2_varieties <- rep(variety, length(e2_values))
  
  # Add the current variety's sf2 values and variety names to the lists
  all_e2 <- c(all_e2, e2_values)
  all_e2_varieties <- c(all_e2_varieties, e2_varieties)
}
# Combine variety names and corresponding sf2 values into a data frame
combined_df <- data.frame(Variety = all_e2_varieties, E2 = all_e2)

# Remove rows containing NA values
combined_df <- combined_df[complete.cases(combined_df), ]

##### Segmentation #####
# Separate values greater than 0.67
greater_than_point_67 <- combined_df[combined_df$E2 > 0.67, ]

# Process the remaining data
remaining_data <- combined_df[combined_df$E2 <= 0.67, ]

# Calculate the quantiles needed for segmentation
quantiles <- quantile(remaining_data$E2, probs = c(0, 0.5, 1))

# Split the remaining data based on the quantiles
segments <- cut(remaining_data$E2, breaks = quantiles, include.lowest = TRUE)

# Split the remaining data into different sub-dataframes based on the segments
segmented_dfs5 <- split(remaining_data, segments)

# The final results include data greater than 0.24 and the segmented remaining data
# final_results4 <- list(greater_than_point_24, segmented_dfs4)
# save(segmented_dfs5, file = "segmented_dfs5.RData")
