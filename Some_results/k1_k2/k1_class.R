library(gtools)

load("segmented_dfs1.RData")

counts_segment1 = table(segmented_dfs1[[1]]$Variety)  
# 统计第一段每个品种出现的次数
sorted_counts_segment1 = sort(counts_segment1, decreasing = TRUE)  
# 对出现次数进行排序
distinct_counts_segment1 = unique(sorted_counts_segment1)  
# 获取不重复的出现次数
top2_counts_segment1 = distinct_counts_segment1[1:2]  
# 获取第一段前两多的出现次数
selected_varieties_segment1 = names(sorted_counts_segment1)[sorted_counts_segment1 %in% top2_counts_segment1]  
# 获取第一段前两多的品种
selected_data_segment1 = segmented_dfs1[[1]][segmented_dfs1[[1]]$Variety %in% selected_varieties_segment1, ]  
# 筛选出第一段前两多的品种对应的数据

counts_segment2 = table(segmented_dfs1[[2]]$Variety)  
# 统计第二段每个品种出现的次数
sorted_counts_segment2 = sort(counts_segment2, decreasing = TRUE)  
# 对出现次数进行排序
distinct_counts_segment2 = unique(sorted_counts_segment2)  
# 获取不重复的出现次数
top2_counts_segment2 = distinct_counts_segment2[1:2]  
# 获取第二段前两多的出现次数
selected_varieties_segment2 = names(sorted_counts_segment2)[sorted_counts_segment2 %in% top2_counts_segment2]  
# 获取第二段前两多的品种
selected_data_segment2 = segmented_dfs1[[2]][segmented_dfs1[[2]]$Variety %in% selected_varieties_segment2, ]  
# 筛选出第二段前两多的品种对应的数据

counts_segment3 = table(segmented_dfs1[[3]]$Variety)  
# 统计第三段每个品种出现的次数
sorted_counts_segment3 = sort(counts_segment3, decreasing = TRUE)  
# 对出现次数进行排序
distinct_counts_segment3 = unique(sorted_counts_segment3)  
# 获取不重复的出现次数
top2_counts_segment3 = distinct_counts_segment3[1:2]  
# 获取第三段前两多的出现次数
selected_varieties_segment3 = names(sorted_counts_segment3)[sorted_counts_segment3 %in% top2_counts_segment3]  
# 获取第三段前两多的品种
selected_data_segment3 = segmented_dfs1[[3]][segmented_dfs1[[3]]$Variety %in% selected_varieties_segment3, ]  
# 筛选出第三段前两多的品种对应的数据

# 创建变量保存三段数据
final_segment1 = selected_data_segment1
final_segment2 = selected_data_segment2
final_segment3 = selected_data_segment3

# 从 final_segment1、final_segment2 和 final_segment3 中获取品种名称
varieties_segment1 = final_segment1$Variety
varieties_segment2 = final_segment2$Variety
varieties_segment3 = final_segment3$Variety

# 去重并排序
distinct_varieties_segmentk1a = sort(unique(varieties_segment1))
distinct_varieties_segmentk1b = sort(unique(varieties_segment2))
distinct_varieties_segmentk1c = sort(unique(varieties_segment3))

sorted_varieties_k1a = mixedsort(distinct_varieties_segmentk1a)
sorted_varieties_k1b = mixedsort(distinct_varieties_segmentk1b)
sorted_varieties_k1c = mixedsort(distinct_varieties_segmentk1c)

# 写入 CSV 文件
# write.csv(sorted_varieties_k1a, file = "distinct_varieties_segmentk1a.csv", row.names = FALSE)
# write.csv(sorted_varieties_k1b, file = "distinct_varieties_segmentk1b.csv", row.names = FALSE)
# write.csv(sorted_varieties_k1c, file = "distinct_varieties_segmentk1c.csv", row.names = FALSE)
