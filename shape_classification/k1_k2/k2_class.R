library(gtools)

load("segmented_dfs4.RData")

#####
# Classify k2 parameter

# In the range [0, 0.0386), segment 1
counts_segment1 = table(segmented_dfs4[[1]]$Variety)  
# Count the occurrences of each variety
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# Get unique counts
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# Get the top two most frequent counts
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# Get the varieties corresponding to the top two counts
selected_data_segment1 = segmented_dfs4[[1]][segmented_dfs4[[1]]$Variety %in% selected_varieties_segment1, ]  
# Filter the data for the top two varieties in segment 1

# In the range (0.0386, 0.226], segment 2
counts_segment2 = table(segmented_dfs4[[2]]$Variety)  
# Count the occurrences of each variety
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# Get unique counts
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# Get the top two most frequent counts
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# Get the varieties corresponding to the top two counts
selected_data_segment2 = segmented_dfs4[[2]][segmented_dfs4[[2]]$Variety %in% selected_varieties_segment2, ]  
# Filter the data for the top two varieties in segment 2

# Create new variables to save the two segments' data
final_segment1 = selected_data_segment1  # Segment 1
final_segment2 = selected_data_segment2  # Segment 2

# counts_segment1 <- table(segmented_dfs4[[1]]$Variety)  # Count the occurrences of each variety
# sorted_counts_segment1 <- sort(counts_segment1, decreasing = TRUE)  # Sort the counts in descending order
# distinct_counts_segment1 <- unique(sorted_counts_segment1)  # Get unique counts
# top3_counts_segment1 <- distinct_counts_segment1[1:3]  # Get the top three most frequent counts
# selected_varieties_segment1 <- names(sorted_counts_segment1)[sorted_counts_segment1 %in% top3_counts_segment1]  # Get the top three varieties
# selected_data_segment1 <- segmented_dfs4[[1]][segmented_dfs4[[1]]$Variety %in% selected_varieties_segment1, ]  # Filter the data for the top three varieties
# 
# counts_segment2 <- table(segmented_dfs4[[2]]$Variety)  # Count the occurrences of each variety
# sorted_counts_segment2 <- sort(counts_segment2, decreasing = TRUE)  # Sort the counts in descending order
# distinct_counts_segment2 <- unique(sorted_counts_segment2)  # Get unique counts
# top3_counts_segment2 <- distinct_counts_segment2[1:3]  # Get the top three most frequent counts
# selected_varieties_segment2 <- names(sorted_counts_segment2)[sorted_counts_segment2 %in% top3_counts_segment2]  # Get the top three varieties
# selected_data_segment2 <- segmented_dfs4[[2]][segmented_dfs4[[2]]$Variety %in% selected_varieties_segment2, ]  # Filter the data for the top three varieties
# 
# # Create new variables to save the two segments' data
# final_segment1 = selected_data_segment1
# final_segment2 = selected_data_segment2

# Extract variety names from final_segment1 and final_segment2
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety

# Remove duplicates and sort
distinct_varieties_segmentk2a = sort(unique(varieties_segment1)) # Segment 1
distinct_varieties_segmentk2b = sort(unique(varieties_segment2)) # Segment 2

sorted_varieties_k2a = mixedsort(distinct_varieties_segmentk2a)
sorted_varieties_k2b = mixedsort(distinct_varieties_segmentk2b)

# Write to CSV files
# write.csv(sorted_varieties_k2a, file = "distinct_varieties_segmentk2a.csv", row.names = FALSE)
# write.csv(sorted_varieties_k2b, file = "distinct_varieties_segmentk2b.csv", row.names = FALSE)
