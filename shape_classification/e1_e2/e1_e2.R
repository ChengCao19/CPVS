library(writexl)

# Use the intersect function to get the intersection
intersection_eaa = intersect(sorted_varieties_e2a, sorted_varieties_e1a)  # Intersection of sf2 first segment (sf2a) and sf1a
intersection_eab = intersect(sorted_varieties_e2a, sorted_varieties_e1b)  # Intersection of sf2a and sf1b
intersection_eac = intersect(sorted_varieties_e2a, sorted_varieties_e1c)  # Intersection of sf2a and sf1c

intersection_eba = intersect(sorted_varieties_e2b, sorted_varieties_e1a)  # Intersection of sf2 second segment (sf2b) and sf1a
intersection_ebb = intersect(sorted_varieties_e2b, sorted_varieties_e1b)  # Intersection of sf2b and sf1b
intersection_ebc = intersect(sorted_varieties_e2b, sorted_varieties_e1c)  # Intersection of sf2b and sf1c

# Define Excel file name
excel_file <- "E_Intersection_Results.xlsx"

# Create data frames
df_eaa <- data.frame(Eaa = intersection_eaa)
df_eab <- data.frame(Eab = intersection_eab)
df_eac <- data.frame(Eac = intersection_eac)

df_eba <- data.frame(Eba = intersection_eba)
df_ebb <- data.frame(Ebb = intersection_ebb)
df_ebc <- data.frame(Ebc = intersection_ebc)

# Write the data frames to an Excel file
write_xlsx(list(df_eaa, df_eab, df_eac, df_eba, df_ebb, df_ebc), path = excel_file)

# Print success message
cat("Intersection results have been successfully written to Excel file:", excel_file)

##### Check the 6 results, two at a time to find intersections
intersection_list <- list(
  intersection_eaa, intersection_eab, intersection_eac,
  intersection_eba, intersection_ebb, intersection_ebc
)

# Create a matrix to check if there is an intersection between any two results
isEmpty <- matrix(FALSE, ncol = length(intersection_list), nrow = length(intersection_list))

for (i in 1:length(intersection_list)) {
  for (j in 1:length(intersection_list)) {
    if (i != j) {
      isEmpty[i, j] <- length(intersect(intersection_list[[i]], intersection_list[[j]])) == 0
    }
  }
}

isEmpty
