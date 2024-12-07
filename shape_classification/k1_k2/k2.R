load("all_varieties.RData")

all_k2 <- c()
all_k2_varieties <- c()

for (variety in names(all_varieties)) {
  
  sheet2_data <- all_varieties[[variety]]$sheet2
  
  k2_values = as.numeric(sheet2_data$k2)
  
  k2_varieties <- rep(variety, length(k2_values))
  
  all_k2 <- c(all_k2, k2_values)
  all_k2_varieties <- c(all_k2_varieties, k2_varieties)
}

combined_df <- data.frame(Variety = all_k2_varieties, K2 = all_k2)

combined_df <- combined_df[complete.cases(combined_df), ]

##### segmentation #####

greater_than_point_24 <- combined_df[combined_df$K2 > 0.24, ]

remaining_data <- combined_df[combined_df$K2 <= 0.24, ]

quantiles <- quantile(remaining_data$K2, probs = c(0, 0.5, 1))

segments <- cut(remaining_data$K2, breaks = quantiles, include.lowest = TRUE)

segmented_dfs4 <- split(remaining_data, segments)

save(segmented_dfs4, file = "segmented_dfs4.RData")
