load("all_varieties.RData")

# Create empty vectors to store all varieties' sf1 values and variety names
all_e1 <- c()
all_e1_varieties <- c()

# Iterate over all varieties
for (variety in names(all_varieties)) {
  # Get the sheet1 data for the current variety
  sheet1_data <- all_varieties[[variety]]$sheet1
  
  e1_values = as.numeric(sheet1_data$e1)
  
  e1_varieties <- rep(variety, length(e1_values))
  
  # Add the current variety's sf1 values and variety names to the lists
  all_e1 <- c(all_e1, e1_values)
  all_e1_varieties <- c(all_e1_varieties, e1_varieties)
}
# Combine variety names and corresponding sf1 values into a data frame
combined_df <- data.frame(Variety = all_e1_varieties, E1 = all_e1)

# Calculate the minimum and maximum values of SF1
e1_min <- min(combined_df$E1)
e1_max <- max(combined_df$E1)

# Define three segments using two quantiles
num_segments <- 3
quantiles <- quantile(combined_df$E1, probs = seq(0, 1, length.out = num_segments + 1))

# Split the SF1 values into segments based on the quantiles
segments <- cut(combined_df$E1, breaks = quantiles, include.lowest = TRUE)

# Split combined_df into different sub-dataframes based on the segments
segmented_dfs2 <- split(combined_df, segments)
# save(segmented_dfs2, file = "segmented_dfs2.RData")
