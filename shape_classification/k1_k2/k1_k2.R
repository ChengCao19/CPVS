library(writexl)

# Use the intersect function to get the intersection
intersection_kaa <- intersect(sorted_varieties_k2a, sorted_varieties_k1a)  # Intersection between k2 segment 1 parameter k2a and k1a
intersection_kab <- intersect(sorted_varieties_k2a, sorted_varieties_k1b)  # Intersection between k2a and k1b
intersection_kac <- intersect(sorted_varieties_k2a, sorted_varieties_k1c)  # Intersection between k2a and k1c

intersection_kba <- intersect(sorted_varieties_k2b, sorted_varieties_k1a)  # Intersection between k2 segment 2 parameter k2b and k1a
intersection_kbb <- intersect(sorted_varieties_k2b, sorted_varieties_k1b)  # Intersection between k2b and k1b
intersection_kbc <- intersect(sorted_varieties_k2b, sorted_varieties_k1c)  # Intersection between k2b and k1c

# Define Excel file name
excel_file <- "K_intersection_results.xlsx"

# Create data frames
df_kaa <- data.frame(Kaa = intersection_kaa)
df_kab <- data.frame(Kab = intersection_kab)
df_kac <- data.frame(Kac = intersection_kac)

df_kba <- data.frame(Kba = intersection_kba)
df_kbb <- data.frame(Kbb = intersection_kbb)
df_kbc <- data.frame(Kbc = intersection_kbc)

# Write the data frames to an Excel file
write_xlsx(list(df_kaa, df_kab, df_kac, df_kba, df_kbb, df_kbc), path = excel_file)

# Print success message
cat("The intersection results have been successfully written to the Excel file:", excel_file)

##### Check the 6 results by intersecting them pairwise
intersection_list <- list(
  intersection_kaa, intersection_kab, intersection_kac,
  intersection_kba, intersection_kbb, intersection_kbc
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
