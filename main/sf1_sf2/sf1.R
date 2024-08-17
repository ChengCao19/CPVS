# 加载保存的变量
load("all_varieties.RData")

# 创建空向量以存储所有品种的sf1值和品种名
all_sf1 <- c()
all_sf1_varieties <- c()

# 遍历所有品种
for (variety in names(all_varieties)) {
  # 获取当前品种的sheet1数据
  sheet1_data <- all_varieties[[variety]]$sheet1
  
  sf1_values = as.numeric(sheet1_data$sf1)
  
  sf1_varieties <- rep(variety, length(sf1_values))
  
  # 将当前品种的sf1值和品种名添加到所有值列表中
  all_sf1 <- c(all_sf1, sf1_values)
  all_sf1_varieties <- c(all_sf1_varieties, sf1_varieties)
}
# 将品种名和对应的sf1值合并到一个数据框中
combined_df <- data.frame(Variety = all_sf1_varieties, SF1 = all_sf1)

# 计算 SF1 值的最小值和最大值
sf1_min <- min(combined_df$SF1)
sf1_max <- max(combined_df$SF1)

# 确定分为三个段，使用两个分位数
num_segments <- 3
quantiles <- quantile(combined_df$SF1, probs = seq(0, 1, length.out = num_segments + 1))

# 将 SF1 值根据分位数段分割
segments <- cut(combined_df$SF1, breaks = quantiles, include.lowest = TRUE)

# 按照分段将 combined_df 分为不同的子数据框
segmented_dfs3 <- split(combined_df, segments)
# save(segmented_dfs3,file = "segmented_dfs3.RData")


# # 创建一个新的Excel工作簿
# wb <- createWorkbook()
# 
# # 为每个data.frame创建一个工作表，并把它们添加到工作簿中
# addWorksheet(wb, "Sheet1")
# writeData(wb, sheet = "Sheet1", segmented_dfs3[[1]])
# 
# addWorksheet(wb, "Sheet2")
# writeData(wb, sheet = "Sheet2", segmented_dfs3[[2]])
# 
# addWorksheet(wb, "Sheet3")
# writeData(wb, sheet = "Sheet3", segmented_dfs3[[3]])
# 
# # 指定路径并保存Excel文件
# saveWorkbook(wb, file = "D:/Rproject/sf3.xlsx", overwrite = TRUE)



