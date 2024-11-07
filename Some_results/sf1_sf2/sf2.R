# 加载保存的变量
load("all_varieties.RData")

# 创建空向量以存储所有品种的sf2值和品种名
all_sf2 <- c()
all_sf2_varieties <- c()

# 遍历所有品种
for (variety in names(all_varieties)) {
  # 获取当前品种的sheet2数据
  sheet2_data <- all_varieties[[variety]]$sheet2
  
  sf2_values = as.numeric(sheet2_data$sf2)
  
  sf2_varieties <- rep(variety, length(sf2_values))
  
  # 将当前品种的sf2值和品种名添加到所有值列表中
  all_sf2 <- c(all_sf2, sf2_values)
  all_sf2_varieties <- c(all_sf2_varieties, sf2_varieties)
}
# 将品种名和对应的sf2值合并到一个数据框中
combined_df <- data.frame(Variety = all_sf2_varieties, SF2 = all_sf2)

# 移除包含NA值的行
combined_df <- combined_df[complete.cases(combined_df), ]

##### 分段 #####
# 分离大于0.37的值
greater_than_point_37 <- combined_df[combined_df$SF2 > 0.37, ]

# 分段处理剩余的数据
remaining_data <- combined_df[combined_df$SF2 <= 0.37, ]

# 计算分段所需的分位数
quantiles <- quantile(remaining_data$SF2, probs = c(0, 0.5, 1))

# 将剩余的数据根据分位数段分割
segments <- cut(remaining_data$SF2, breaks = quantiles, include.lowest = TRUE)

# 按照分段将剩余的数据分为不同的子数据框
segmented_dfs6 <- split(remaining_data, segments)

# 最后的结果包括大于0.24的数据和分段后的剩余数据
# final_results4 <- list(greater_than_point_24, segmented_dfs4)
# save(segmented_dfs6, file = "segmented_dfs6.RData")


# library(openxlsx)
# # 创建一个新的Excel工作簿
# wb <- createWorkbook()
# 
# # 为每个data.frame创建一个工作表，并把它们添加到工作簿中
# addWorksheet(wb, "Sheet1")
# writeData(wb, sheet = "Sheet1", segmented_dfs6[[1]])
# 
# addWorksheet(wb, "Sheet2")
# writeData(wb, sheet = "Sheet2", segmented_dfs6[[2]])
# 
# 
# # 指定路径并保存Excel文件
# saveWorkbook(wb, file = "D:/Rproject/sf32.xlsx", overwrite = TRUE)

# library(ggplot2)
# ggplot(combined_df, aes(x=1:length(SF2), y=SF2))+
#   geom_point() +
#   labs(x = "Index", y = "SF2") +
#   theme_bw()+
#   theme(panel.grid = element_blank())
