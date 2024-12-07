library(gtools)

load("segmented_dfs3.RData")

# Count the occurrences of each variety in the first segment
counts_segment1 = table(segmented_dfs3[[1]]$Variety)  
# Sort the occurrence counts in descending order
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# Get the unique occurrence counts
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# Get the top two most frequent occurrences in the first segment
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# Get the varieties corresponding to the top two occurrences in the first segment
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# Filter the data corresponding to the top two varieties in the first segment
selected_data_segment1 = segmented_dfs3[[1]][segmented_dfs3[[1]]$Variety %in% selected_varieties_segment1, ]  

# Count the occurrences of each variety in the second segment
counts_segment2 = table(segmented_dfs3[[2]]$Variety)  
# Sort the occurrence counts in descending order
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# Get the unique occurrence counts
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# Get the top two most frequent occurrences in the second segment
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# Get the varieties corresponding to the top two occurrences in the second segment
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# Filter the data corresponding to the top two varieties in the second segment
selected_data_segment2 = segmented_dfs3[[2]][segmented_dfs3[[2]]$Variety %in% selected_varieties_segment2, ]  

# Count the occurrences of each variety in the third segment
counts_segment3 = table(segmented_dfs3[[3]]$Variety)  
# Sort the occurrence counts in descending order
sorted_counts_segment3 = sort(counts_segment3, decreasing = TRUE)  
# Get the unique occurrence counts
distinct_counts_segment3 = unique(sorted_counts_segment3)  
# Get the top two most frequent occurrences in the third segment
top2_counts_segment3 = distinct_counts_segment3[1:2]  
# Get the varieties corresponding to the top two occurrences in the third segment
selected_varieties_segment3 = names(sorted_counts_segment3)[sorted_counts_segment3 %in% top2_counts_segment3]  
# Filter the data corresponding to the top two varieties in the third segment
selected_data_segment3 = segmented_dfs3[[3]][segmented_dfs3[[3]]$Variety %in% selected_varieties_segment3, ]  

# Create variables to save the data of the three segments
final_segment1 = selected_data_segment1
final_segment2 = selected_data_segment2
final_segment3 = selected_data_segment3

# Extract variety names from final_segment1, final_segment2, and final_segment3
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety
varieties_segment3 = final_segment3$Variety

# Remove duplicates and sort the varieties
distinct_varieties_segmentsf1a = sort(unique(varieties_segment1))
distinct_varieties_segmentsf1b = sort(unique(varieties_segment2))
distinct_varieties_segmentsf1c = sort(unique(varieties_segment3))

# Sort the varieties using mixedsort
sorted_varieties_sf1a = mixedsort(distinct_varieties_segmentsf1a)
sorted_varieties_sf1b = mixedsort(distinct_varieties_segmentsf1b)
sorted_varieties_sf1c = mixedsort(distinct_varieties_segmentsf1c)

# Write the sorted varieties to CSV files
# write.csv(sorted_varieties_sf1a, file = "distinct_varieties_segmentsf1a.csv", row.names = FALSE)
# write.csv(sorted_varieties_sf1b, file = "distinct_varieties_segmentsf1b.csv", row.names = FALSE)
# write.csv(sorted_varieties_sf1c, file = "distinct_varieties_segmentsf1c.csv", row.names = FALSE)
