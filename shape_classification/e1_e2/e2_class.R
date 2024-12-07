library(gtools)

load("segmented_dfs5.RData")

#####
# Categorize the k2 parameter

# For the first segment [0, 0.0386)
counts_segment1 = table(segmented_dfs5[[1]]$Variety)  
# Count the occurrences of each variety
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# Sort the occurrences in descending order
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# Get the unique occurrence counts
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# Get the top two most frequent occurrence counts
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# Get the varieties with the top two highest occurrences
selected_data_segment1 = segmented_dfs5[[1]][segmented_dfs5[[1]]$Variety %in% selected_varieties_segment1, ]  
# Filter the data corresponding to the top two most frequent varieties in the first segment


# For the second segment (0.0386, 0.226]
counts_segment2 = table(segmented_dfs5[[2]]$Variety)  
# Count the occurrences of each variety
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# Sort the occurrences in descending order
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# Get the unique occurrence counts
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# Get the top two most frequent occurrence counts
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# Get the varieties with the top two highest occurrences
selected_data_segment2 = segmented_dfs5[[2]][segmented_dfs5[[2]]$Variety %in% selected_varieties_segment2, ]  
# Filter the data corresponding to the top two most frequent varieties in the second segment

# Create new variables to store the data from both segments
final_segment1 = selected_data_segment1  # First segment
final_segment2 = selected_data_segment2  # Second segment

# counts_segment1 <- table(segmented_dfs4[[1]]$Variety)  # Count the occurrences of each variety
# sorted_counts_segment1 <- sort(counts_segment1, decreasing = TRUE)  # Sort the occurrences in descending order
# distinct_counts_segment1 <- unique(sorted_counts_segment1)  # Get the unique occurrence counts
# top3_counts_segment1 <- distinct_counts_segment1[1:3]  # Get the top three most frequent occurrence counts
# selected_varieties_segment1 <- names(sorted_counts_segment1)[sorted_counts_segment1 %in% top3_counts_segment1]  # Get the varieties with the top three highest occurrences
# selected_data_segment1 <- segmented_dfs4[[1]][segmented_dfs4[[1]]$Variety %in% selected_varieties_segment1, ]  # Filter the data corresponding to the top three most frequent varieties

# counts_segment2 <- table(segmented_dfs4[[2]]$Variety)  # Count the occurrences of each variety
# sorted_counts_segment2 <- sort(counts_segment2, decreasing = TRUE)  # Sort the occurrences in descending order
# distinct_counts_segment2 <- unique(sorted_counts_segment2)  # Get the unique occurrence counts
# top3_counts_segment2 <- distinct_counts_segment2[1:3]  # Get the top three most frequent occurrence counts
# selected_varieties_segment2 <- names(sorted_counts_segment2)[sorted_counts_segment2 %in% top3_counts_segment2]  # Get the varieties with the top three highest occurrences
# selected_data_segment2 <- segmented_dfs4[[2]][segmented_dfs4[[2]]$Variety %in% selected_varieties_segment2, ]  # Filter the data corresponding to the top three most frequent varieties

# # Create new variables to store the data from both segments
# final_segment1 = selected_data_segment1
# final_segment2 = selected_data_segment2

# Get the variety names from final_segment1 and final_segment2
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety

# Remove duplicates and sort
distinct_varieties_segmente2a = sort(unique(varieties_segment1)) # First segment
distinct_varieties_segmente2b = sort(unique(varieties_segment2)) # Second segment

sorted_varieties_e2a = mixedsort(distinct_varieties_segmente2a)
sorted_varieties_e2b = mixedsort(distinct_varieties_segmente2b)

# Write to CSV files
# write.csv(sorted_varieties_e2a, file = "distinct_varieties_segmente2a.csv", row.names = FALSE)
# write.csv(sorted_varieties_e2b, file = "distinct_varieties_segmente2b.csv", row.names = FALSE)
