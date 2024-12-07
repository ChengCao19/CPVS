# Load saved variables
load("all_varieties.RData")

# Create empty vectors to store SF2 values and variety names for all varieties
all_sf2 <- c()
all_sf2_varieties <- c()

# Iterate through all varieties
for (variety in names(all_varieties)) {
  # Get sheet2 data for the current variety
  sheet2_data <- all_varieties[[variety]]$sheet2
  
  sf2_values = as.numeric(sheet2_data$sf2)
  
  sf2_varieties <- rep(variety, length(sf2_values))
  
  # Add the SF2 values and variety names of the current variety to the all lists
  all_sf2 <- c(all_sf2, sf2_values)
  all_sf2_varieties <- c(all_sf2_varieties, sf2_varieties)
}

# Combine variety names and corresponding SF2 values into a data frame
combined_df <- data.frame(Variety = all_sf2_varieties, SF2 = all_sf2)

# Remove rows containing NA values
combined_df <- combined_df[complete.cases(combined_df), ]

##### Segmentation #####
# Separate values greater than 0.37
greater_than_point_37 <- combined_df[combined_df$SF2 > 0.37, ]

# Segment the remaining data
remaining_data <- combined_df[combined_df$SF2 <= 0.37, ]

# Calculate the quantiles needed for segmentation
quantiles <- quantile(remaining_data$SF2, probs = c(0, 0.5, 1))

# Split the remaining data according to the quantile segments
segments <- cut(remaining_data$SF2, breaks = quantiles, include.lowest = TRUE)

# Split the remaining data into different sub-dataframes according to the segments
segmented_dfs6 <- split(remaining_data, segments)

# The final result includes data greater than 0.37 and the segmented remaining data
# final_results4 <- list(greater_than_point_24, segmented_dfs4)
# save(segmented_dfs6, file = "segmented_dfs6.RData")


# library(openxlsx)
# # Create a new Excel workbook
# wb <- createWorkbook()
# 
# # Create a worksheet for each data.frame and add them to the workbook
# addWorksheet(wb, "Sheet1")
# writeData(wb, sheet = "Sheet1", segmented_dfs6[[1]])
# 
# addWorksheet(wb, "Sheet2")
# writeData(wb, sheet = "Sheet2", segmented_dfs6[[2]])
# 
# 
# # Specify the path and save the Excel file
# saveWorkbook(wb, file = "D:/Rproject/sf32.xlsx", overwrite = TRUE)

# library(ggplot2)
# ggplot(combined_df, aes(x=1:length(SF2), y=SF2))+
#   geom_point() +
#   labs(x = "Index", y = "SF2") +
#   theme_bw()+
#   theme(panel.grid = element_blank())
