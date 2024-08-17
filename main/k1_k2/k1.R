# 加载保存的变量
load("all_varieties.RData")

# 创建空向量以存储所有品种的k1值和品种名
all_k1 <- c()
all_k1_varieties <- c()

# 遍历所有品种
for (variety in names(all_varieties)) {
  # 获取当前品种的sheet1数据
  sheet1_data <- all_varieties[[variety]]$sheet1
  
  k1_values = as.numeric(sheet1_data$k1)
  
  k1_varieties <- rep(variety, length(k1_values))
  
  # 将当前品种的k1值和品种名添加到所有值列表中
  all_k1 <- c(all_k1, k1_values)
  all_k1_varieties <- c(all_k1_varieties, k1_varieties)
}
# 将品种名和对应的k1值合并到一个数据框中
combined_df <- data.frame(Variety = all_k1_varieties, K1 = all_k1)

##### 分段 #####
# 计算 K1 值的最小值和最大值
k1_min <- min(combined_df$K1)
k1_max <- max(combined_df$K1)

# 确定分为三个段，使用两个分位数
num_segments <- 3
quantiles <- quantile(combined_df$K1, probs = seq(0, 1, length.out = num_segments + 1))

# 将 K1 值根据分位数段分割
segments <- cut(combined_df$K1, breaks = quantiles, include.lowest = TRUE)

# 按照分段将 combined_df 分为不同的子数据框
segmented_dfs1 <- split(combined_df, segments)
save(segmented_dfs1, file = "segmented_dfs1.RData")
