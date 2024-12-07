library(readxl)

data_folder = "D:/Rproject/data"                                                # Data folder path
                                                                                # Get a first-level folder list
first_level_folders = dir(data_folder, full.names = TRUE, recursive = FALSE)
all_varieties = list()
                                                                                # Traverse first-level folders
for (first_level_folder in first_level_folders) {
                                                                                # Get the product name (i.e. Excel file name)
  excel_files <- list.files(first_level_folder, pattern = "\\.xlsx$", full.names = TRUE)
                                                                                # Traverse each excel file
  for (excel_file in excel_files) {
    variety <- sub("\\.xlsx$", "", basename(excel_file))
    
    sheet1_data <- read_excel(excel_file, sheet = "Sheet1")
    sheet2_data <- read_excel(excel_file, sheet = "Sheet2")
    
    sheet1_raw_col_names <- colnames(sheet1_data)
    sheet2_raw_col_names <- colnames(sheet2_data)
    
    sheet1_col_names <- c("k1", "e1", "q1","sf1")  
    sheet2_col_names <- c("k2", "e2", "q2","sf2")  
    colnames(sheet1_data) <- sheet1_col_names
    colnames(sheet2_data) <- sheet2_col_names
    
    sheet1_data <- rbind(sheet1_raw_col_names, sheet1_data)
    sheet2_data <- rbind(sheet2_raw_col_names, sheet2_data)
    
    variety_data <- list(sheet1 = sheet1_data, sheet2 = sheet2_data)
    
    all_varieties[[variety]] <- variety_data
  }
}
# all_k1_values <- c()  # 存储所有品种的k1值
# all_e1_values <- c()  # 存储所有品种的e1值
# all_sf1_values <- c()  # 存储所有品种的sf1值
# all_k2_values <- c()  # 存储所有品种的k2值
# all_e2_values <- c()  # 存储所有品种的e2值
# all_sf2_values <- c()  # 存储所有品种的sf2值
# 
# # 遍历所有品种数据
# for (variety_data in all_varieties) {
#   
#   # 提取Sheet1中的k1、e1和sf1数据
#   k1_values <- variety_data$sheet1$k1
#   e1_values <- variety_data$sheet1$e1
#   sf1_values <- variety_data$sheet1$sf1
#   k2_values <- variety_data$sheet2$k2
#   e2_values <- variety_data$sheet2$e2
#   sf2_values <- variety_data$sheet2$sf2
#   
#   # 将k1、e1和sf1值转换为数值型
#   k1_values <- as.numeric(k1_values)
#   e1_values <- as.numeric(e1_values)
#   sf1_values <- as.numeric(sf1_values)
#   k2_values <- as.numeric(k2_values)
#   e2_values <- as.numeric(e2_values)
#   sf2_values <- as.numeric(sf2_values)
#   
#   # 将品种的k1、e1和sf1值添加到相应变量中
#   all_k1_values <- c(all_k1_values, k1_values)
#   all_e1_values <- c(all_e1_values, e1_values)
#   all_sf1_values <- c(all_sf1_values, sf1_values)
#   all_k2_values <- c(all_k2_values, k2_values)
#   all_e2_values <- c(all_e2_values, e2_values)
#   all_sf2_values <- c(all_sf2_values, sf2_values)
# }

