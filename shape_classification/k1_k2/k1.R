load("all_varieties.RData")

# Create an empty vector to store k1 values and variety names for all varieties
all_k1 <- c()
all_k1_varieties <- c()

# Traverse all varieties
for (variety in names(all_varieties)) {
  
  sheet1_data <- all_varieties[[variety]]$sheet1
  
  k1_values = as.numeric(sheet1_data$k1)
  
  k1_varieties <- rep(variety, length(k1_values))
  
  all_k1 <- c(all_k1, k1_values)
  all_k1_varieties <- c(all_k1_varieties, k1_varieties)
}
# Combine variety names and corresponding k1 values into a single data frame
combined_df <- data.frame(Variety = all_k1_varieties, K1 = all_k1)

##### Segmentation #####

k1_min <- min(combined_df$K1)
k1_max <- max(combined_df$K1)

num_segments <- 3
quantiles <- quantile(combined_df$K1, probs = seq(0, 1, length.out = num_segments + 1))

# Split K1 values according to quantile segments
segments <- cut(combined_df$K1, breaks = quantiles, include.lowest = TRUE)

segmented_dfs1 <- split(combined_df, segments)
save(segmented_dfs1, file = "segmented_dfs1.RData")
