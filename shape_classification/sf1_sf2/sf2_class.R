library(gtools)

load("segmented_dfs6.RData")
# Note: The comment here does not match the code content
#####
# Classifying based on the k2 parameter

# For the range [0, 0.141), first segment
counts_segment1 = table(segmented_dfs6[[1]]$Variety)  
# Count the occurrences of each variety
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# Get the unique occurrence counts
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# Get the top two most frequent occurrences
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# Get the varieties corresponding to the top two occurrences
selected_data_segment1 = segmented_dfs6[[1]][segmented_dfs6[[1]]$Variety %in% selected_varieties_segment1, ]  
# Filter the data corresponding to the top two varieties in the first segment

# For the range (0.141, 0.357], second segment
counts_segment2 = table(segmented_dfs6[[2]]$Variety)  
# Count the occurrences of each variety
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# Get the unique occurrence counts
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# Get the top two most frequent occurrences
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# Get the varieties corresponding to the top two occurrences
selected_data_segment2 = segmented_dfs6[[2]][segmented_dfs6[[2]]$Variety %in% selected_varieties_segment2, ]  
# Filter the data corresponding to the top two varieties in the second segment

# Create new variables to store data from both segments
final_segment1 = selected_data_segment1  # First segment
final_segment2 = selected_data_segment2  # Second segment

# The following code is commented out (for a different case)
# counts_segment1 <- table(segmented_dfs4[[1]]$Variety)  # Count the occurrences of each variety
# sorted_counts_segment1 <- sort(counts_segment1, decreasing = TRUE)  # Sort the counts in descending order
# distinct_counts_segment1 <- unique(sorted_counts_segment1)  # Get the unique occurrence counts
# top3_counts_segment1 <- distinct_counts_segment1[1:3]  # Get the top three most frequent occurrences
# selected_varieties_segment1 <- names(sorted_counts_segment1)[sorted_counts_segment1 %in% top3_counts_segment1]  # Get the top three varieties
# selected_data_segment1 <- segmented_dfs4[[1]][segmented_dfs4[[1]]$Variety %in% selected_varieties_segment1, ]  # Filter the data corresponding to the top three varieties
# 
# counts_segment2 <- table(segmented_dfs4[[2]]$Variety)  # Count the occurrences of each variety
# sorted_counts_segment2 <- sort(counts_segment2, decreasing = TRUE)  # Sort the counts in descending order
# distinct_counts_segment2 <- unique(sorted_counts_segment2)  # Get the unique occurrence counts
# top3_counts_segment2 <- distinct_counts_segment2[1:3]  # Get the top three most frequent occurrences
# selected_varieties_segment2 <- names(sorted_counts_segment2)[sorted_counts_segment2 %in% top3_counts_segment2]  # Get the top three varieties
# selected_data_segment2 <- segmented_dfs4[[2]][segmented_dfs4[[2]]$Variety %in% selected_varieties_segment2, ]  # Filter the data corresponding to the top three varieties
# 
# # Create new variables to store data from both segments
# final_segment1 = selected_data_segment1
# final_segment2 = selected_data_segment2

# Extract variety names from final_segment1 and final_segment2
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety

# Remove duplicates and sort
distinct_varieties_segmentsf2a = sort(unique(varieties_segment1)) # First segment
distinct_varieties_segmentsf2b = sort(unique(varieties_segment2)) # Second segment

# Sort the varieties using mixedsort
sorted_varieties_sf2a = mixedsort(distinct_varieties_segmentsf2a)
sorted_varieties_sf2b = mixedsort(distinct_varieties_segmentsf2b)

# Write to CSV files
# write.csv(sorted_varieties_sf2a, file = "distinct_varieties_segmentsf2a.csv", row.names = FALSE)
# write.csv(sorted_varieties_sf2b, file = "distinct_varieties_segmentsf2b.csv", row.names = FALSE)
