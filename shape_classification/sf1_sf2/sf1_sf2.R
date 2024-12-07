library(writexl)

# Use the intersect function to find intersections
intersection_sfaa = intersect(sorted_varieties_sf2a, sorted_varieties_sf1a)  # Intersection between sf2a from the first segment and sf1a
intersection_sfab = intersect(sorted_varieties_sf2a, sorted_varieties_sf1b)  # Intersection between sf2a and sf1b
intersection_sfac = intersect(sorted_varieties_sf2a, sorted_varieties_sf1c)  # Intersection between sf2a and sf1c

intersection_sfba = intersect(sorted_varieties_sf2b, sorted_varieties_sf1a)  # Intersection between sf2b from the second segment and sf1a
intersection_sfbb = intersect(sorted_varieties_sf2b, sorted_varieties_sf1b)  # Intersection between sf2b and sf1b
intersection_sfbc = intersect(sorted_varieties_sf2b, sorted_varieties_sf1c)  # Intersection between sf2b and sf1c

# Define the Excel file name
excel_file <- "SF_Intersection_Results.xlsx"

# Create data frames
df_sfaa <- data.frame(Sfaa = intersection_sfaa)
df_sfab <- data.frame(Sfab = intersection_sfab)
df_sfac <- data.frame(Sfac = intersection_sfac)

df_sfba <- data.frame(Sfba = intersection_sfba)
df_sfbb <- data.frame(Sfbb = intersection_sfbb)
df_sfbc <- data.frame(Sfbc = intersection_sfbc)

# Write the data frames to an Excel file
write_xlsx(list(df_sfaa, df_sfab, df_sfac, df_sfba, df_sfbb, df_sfbc), path = excel_file)

# Print success message
cat("Intersection results have been successfully written to the Excel file:", excel_file)

##### Check the six results, do pairwise intersections
intersection_list <- list(
  intersection_sfaa, intersection_sfab, intersection_sfac,
  intersection_sfba, intersection_sfbb, intersection_sfbc
)

isEmpty <- matrix(FALSE, ncol = length(intersection_list), nrow = length(intersection_list))

for (i in 1:length(intersection_list)) {
  for (j in 1:length(intersection_list)) {
    if (i != j) {
      isEmpty[i, j] <- length(intersect(intersection_list[[i]], intersection_list[[j]])) == 0
    }
  }
}

isEmpty
