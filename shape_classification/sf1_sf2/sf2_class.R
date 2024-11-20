library(gtools)

load("segmented_dfs6.RData")
# 注意:此处注释与代码内容不符
#####
# 对k2参数进行分类

# 处于[0, 0.141)，第一段
counts_segment1 = table(segmented_dfs6[[1]]$Variety)  
# 统计每个品种出现的次数
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# 对出现次数进行排序
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# 获取不重复的出现次数
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# 获取前两多的出现次数
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# 获取前两多的品种
selected_data_segment1 = segmented_dfs6[[1]][segmented_dfs6[[1]]$Variety %in% selected_varieties_segment1, ]  
# 筛选出前两多的品种对应的数据


# 处于(0.141, 0.357],第二段
counts_segment2 = table(segmented_dfs6[[2]]$Variety)  
# 统计每个品种出现的次数
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# 对出现次数进行排序
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# 获取不重复的出现次数
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# 获取前两多的出现次数
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# 获取前两多的品种
selected_data_segment2 = segmented_dfs6[[2]][segmented_dfs6[[2]]$Variety %in% selected_varieties_segment2, ]  
# 筛选出前两多的品种对应的数据

# 创建新的变量保存两段数据
final_segment1 = selected_data_segment1  # 第一段
final_segment2 = selected_data_segment2  # 第二段

# counts_segment1 <- table(segmented_dfs4[[1]]$Variety)  # 统计每个品种出现的次数
# sorted_counts_segment1 <- sort(counts_segment1, decreasing = TRUE)  # 对出现次数进行排序
# distinct_counts_segment1 <- unique(sorted_counts_segment1)  # 获取不重复的出现次数
# top3_counts_segment1 <- distinct_counts_segment1[1:3]  # 获取前三多的出现次数
# selected_varieties_segment1 <- names(sorted_counts_segment1)[sorted_counts_segment1 %in% top3_counts_segment1]  # 获取前三多的品种
# selected_data_segment1 <- segmented_dfs4[[1]][segmented_dfs4[[1]]$Variety %in% selected_varieties_segment1, ]  # 筛选出前三多的品种对应的数据
# 
# counts_segment2 <- table(segmented_dfs4[[2]]$Variety)  # 统计每个品种出现的次数
# sorted_counts_segment2 <- sort(counts_segment2, decreasing = TRUE)  # 对出现次数进行排序
# distinct_counts_segment2 <- unique(sorted_counts_segment2)  # 获取不重复的出现次数
# top3_counts_segment2 <- distinct_counts_segment2[1:3]  # 获取前三多的出现次数
# selected_varieties_segment2 <- names(sorted_counts_segment2)[sorted_counts_segment2 %in% top3_counts_segment2]  # 获取前三多的品种
# selected_data_segment2 <- segmented_dfs4[[2]][segmented_dfs4[[2]]$Variety %in% selected_varieties_segment2, ]  # 筛选出前三多的品种对应的数据
# 
# # 创建新的变量保存两段数据
# final_segment1 = selected_data_segment1
# final_segment2 = selected_data_segment2

# 从final_segment1和final_segment2中获取品种名称
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety

# 去重并排序
distinct_varieties_segmentsf2a = sort(unique(varieties_segment1)) # 第一段
distinct_varieties_segmentsf2b = sort(unique(varieties_segment2)) # 第二段

sorted_varieties_sf2a = mixedsort(distinct_varieties_segmentsf2a)
sorted_varieties_sf2b = mixedsort(distinct_varieties_segmentsf2b)

# 写入 CSV 文件
# write.csv(sorted_varieties_sf2a, file = "distinct_varieties_segmentsf2a.csv", row.names = FALSE)
# write.csv(sorted_varieties_sf2b, file = "distinct_varieties_segmentsf2b.csv", row.names = FALSE)

