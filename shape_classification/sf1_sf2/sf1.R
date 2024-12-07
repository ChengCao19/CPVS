# Load saved variables
load("all_varieties.RData")

# Create empty vectors to store SF1 values and variety names for all varieties
all_sf1 <- c()
all_sf1_varieties <- c()

# Iterate through all varieties
for (variety in names(all_varieties)) {
  # Get sheet1 data for the current variety
  sheet1_data <- all_varieties[[variety]]$sheet1
  
  sf1_values = as.numeric(sheet1_data$sf1)
  
  sf1_varieties <- rep(variety, length(sf1_values))
  
  # Add the SF1 values and variety names of the current variety to the all lists
  all_sf1 <- c(all_sf1, sf1_values)
  all_sf1_varieties <- c(all_sf1_varieties, sf1_varieties)
}

# Combine variety names and corresponding SF1 values into a data frame
combined_df <- data.frame(Variety = all_sf1_varieties, SF1 = all_sf1)

# Calculate the minimum and maximum values of SF1
sf1_min <- min(combined_df$SF1)
sf1_max <- max(combined_df$SF1)

# Divide into three segments using two quantiles
num_segments <- 3
quantiles <- quantile(combined_df$SF1, probs = seq(0, 1, length.out = num_segments + 1))

# Split the SF1 values according to the quantile segments
segments <- cut(combined_df$SF1, breaks = quantiles, include.lowest = TRUE)

# Split the combined_df into different sub-dataframes according to the segments
segmented_dfs3 <- split(combined_df, segments)
# save(segmented_dfs3, file = "segmented_dfs3.RData")


# # Create a new Excel workbook
# wb <- createWorkbook()
# 
# # Create a worksheet for each data.frame and add them to the workbook
# addWorksheet(wb, "Sheet1")
# writeData(wb, sheet = "Sheet1", segmented_dfs3[[1]])
# 
# addWorksheet(wb, "Sheet2")
# writeData(wb, sheet = "Sheet2", segmented_dfs3[[2]])
# 
# addWorksheet(wb, "Sheet3")
# writeData(wb, sheet = "Sheet3", segmented_dfs3[[3]])
# 
# # Specify the path and save the Excel file
# saveWorkbook(wb, file = "D:/Rproject/sf3.xlsx", overwrite = TRUE)
