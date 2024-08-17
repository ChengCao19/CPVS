# 加载保存的变量
load("all_varieties.RData")

# 创建空向量以存储所有品种的sf1值和品种名
all_e1 <- c()
all_e1_varieties <- c()

# 遍历所有品种
for (variety in names(all_varieties)) {
  # 获取当前品种的sheet1数据
  sheet1_data <- all_varieties[[variety]]$sheet1
  
  e1_values = as.numeric(sheet1_data$e1)
  
  e1_varieties <- rep(variety, length(e1_values))
  
  # 将当前品种的sf1值和品种名添加到所有值列表中
  all_e1 <- c(all_e1, e1_values)
  all_e1_varieties <- c(all_e1_varieties, e1_varieties)
}
# 将品种名和对应的sf1值合并到一个数据框中
combined_df <- data.frame(Variety = all_e1_varieties, E1 = all_e1)

# 计算 SF1 值的最小值和最大值
e1_min <- min(combined_df$E1)
e1_max <- max(combined_df$E1)

# 确定分为三个段，使用两个分位数
num_segments <- 3
quantiles <- quantile(combined_df$E1, probs = seq(0, 1, length.out = num_segments + 1))

# 将 SF1 值根据分位数段分割
segments <- cut(combined_df$E1, breaks = quantiles, include.lowest = TRUE)

# 按照分段将 combined_df 分为不同的子数据框
segmented_dfs2 <- split(combined_df, segments)
# save(segmented_dfs2,file = "segmented_dfs2.RData")