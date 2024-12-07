library(gtools)

load("segmented_dfs1.RData")

counts_segment1 = table(segmented_dfs1[[1]]$Variety)  
# Count the occurrences of each variety in segment 1
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# Get unique counts
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# Get the top two most frequent counts in segment 1
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# Get the varieties corresponding to the top two counts in segment 1
selected_data_segment1 = segmented_dfs1[[1]][segmented_dfs1[[1]]$Variety %in% selected_varieties_segment1, ]  
# Filter the data for the top two varieties in segment 1

counts_segment2 = table(segmented_dfs1[[2]]$Variety)  
# Count the occurrences of each variety in segment 2
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# Get unique counts
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# Get the top two most frequent counts in segment 2
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# Get the varieties corresponding to the top two counts in segment 2
selected_data_segment2 = segmented_dfs1[[2]][segmented_dfs1[[2]]$Variety %in% selected_varieties_segment2, ]  
# Filter the data for the top two varieties in segment 2

counts_segment3 = table(segmented_dfs1[[3]]$Variety)  
# Count the occurrences of each variety in segment 3
sorted_counts_segment3 = sort(counts_segment3, decreasing = TRUE)  
# Sort the counts in descending order
distinct_counts_segment3 = unique(sorted_counts_segment3)  
# Get unique counts
top2_counts_segment3 = distinct_counts_segment3[1:2]  
# Get the top two most frequent counts in segment 3
selected_varieties_segment3 = names(sorted_counts_segment3)[sorted_counts_segment3 %in% top2_counts_segment3]  
# Get the varieties corresponding to the top two counts in segment 3
selected_data_segment3 = segmented_dfs1[[3]][segmented_dfs1[[3]]$Variety %in% selected_varieties_segment3, ]  
# Filter the data for the top two varieties in segment 3

# Create variables to save the three segments' data
final_segment1 = selected_data_segment1
final_segment2 = selected_data_segment2
final_segment3 = selected_data_segment3

# Extract variety names from final_segment1, final_segment2, and final_segment3
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety
varieties_segment3 = final_segment3$Variety

# Remove duplicates and sort
distinct_varieties_segmentk1a = sort(unique(varieties_segment1))
distinct_varieties_segmentk1b = sort(unique(varieties_segment2))
distinct_varieties_segmentk1c = sort(unique(varieties_segment3))

sorted_varieties_k1a = mixedsort(distinct_varieties_segmentk1a)
sorted_varieties_k1b = mixedsort(distinct_varieties_segmentk1b)
sorted_varieties_k1c = mixedsort(distinct_varieties_segmentk1c)

# Write to CSV files
# write.csv(sorted_varieties_k1a, file = "distinct_varieties_segmentk1a.csv", row.names = FALSE)
# write.csv(sorted_varieties_k1b, file = "distinct_varieties_segmentk1b.csv", row.names = FALSE)
# write.csv(sorted_varieties_k1c, file = "distinct_varieties_segmentk1c.csv", row.names = FALSE)