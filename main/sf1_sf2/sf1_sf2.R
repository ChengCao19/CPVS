library(writexl)

# 使用 intersect 函数获取交集
intersection_sfaa = intersect(sorted_varieties_sf2a, sorted_varieties_sf1a)  # sf2第一段参数sf2a与sf1a交
intersection_sfab = intersect(sorted_varieties_sf2a, sorted_varieties_sf1b)  #              sf2a与sf1b
intersection_sfac = intersect(sorted_varieties_sf2a, sorted_varieties_sf1c)  #              sf2a与sf1c

intersection_sfba = intersect(sorted_varieties_sf2b, sorted_varieties_sf1a)  # sf2第二段参数sf2b与sf1a交
intersection_sfbb = intersect(sorted_varieties_sf2b, sorted_varieties_sf1b)  #              sf2b与sf1b
intersection_sfbc = intersect(sorted_varieties_sf2b, sorted_varieties_sf1c)  #              sf2b与sf1c

# 定义 Excel 文件名
excel_file <- "SF交集结果.xlsx"

# 创建数据框
df_sfaa <- data.frame(Sfaa = intersection_sfaa)
df_sfab <- data.frame(Sfab = intersection_sfab)
df_sfac <- data.frame(Sfac = intersection_sfac)

df_sfba <- data.frame(Sfba = intersection_sfba)
df_sfbb <- data.frame(Sfbb = intersection_sfbb)
df_sfbc <- data.frame(Sfbc = intersection_sfbc)

# 将数据框写入 Excel 文件
write_xlsx(list(df_sfaa, df_sfab, df_sfac,df_sfba,df_sfbb,df_sfbc), path = excel_file)

# 打印成功消息
cat("交集结果已成功写入到 Excel 文件:", excel_file)

##### 检验6个结果，两两做交集
intersection_list <- list(
  intersection_sfaa, intersection_sfab, intersection_sfac,
  intersection_sfba, intersection_sfbb, intersection_sfbc
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
