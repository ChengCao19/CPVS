# 加载保存的变量
load("all_varieties.RData")

# 创建空向量以存储所有品种的sf2值和品种名
all_e2 <- c()
all_e2_varieties <- c()

# 遍历所有品种
for (variety in names(all_varieties)) {
  # 获取当前品种的sheet2数据
  sheet2_data <- all_varieties[[variety]]$sheet2
  
  e2_values = as.numeric(sheet2_data$e2)
  
  e2_varieties <- rep(variety, length(e2_values))
  
  # 将当前品种的sf2值和品种名添加到所有值列表中
  all_e2 <- c(all_e2, e2_values)
  all_e2_varieties <- c(all_e2_varieties, e2_varieties)
}
# 将品种名和对应的sf2值合并到一个数据框中
combined_df <- data.frame(Variety = all_e2_varieties, E2 = all_e2)

# 移除包含NA值的行
combined_df <- combined_df[complete.cases(combined_df), ]

##### 分段 #####
# 分离大于0.67的值
greater_than_point_67 <- combined_df[combined_df$E2 > 0.67, ]

# 分段处理剩余的数据
remaining_data <- combined_df[combined_df$E2 <= 0.67, ]

# 计算分段所需的分位数
quantiles <- quantile(remaining_data$E2, probs = c(0, 0.5, 1))

# 将剩余的数据根据分位数段分割
segments <- cut(remaining_data$E2, breaks = quantiles, include.lowest = TRUE)

# 按照分段将剩余的数据分为不同的子数据框
segmented_dfs5 <- split(remaining_data, segments)

# 最后的结果包括大于0.24的数据和分段后的剩余数据
# final_results4 <- list(greater_than_point_24, segmented_dfs4)
# save(segmented_dfs5, file = "segmented_dfs5.RData")
