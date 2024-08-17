library(writexl)

# 使用 intersect 函数获取交集
intersection_eaa = intersect(sorted_varieties_e2a, sorted_varieties_e1a)  # sf2第一段参数sf2a与sf1a交
intersection_eab = intersect(sorted_varieties_e2a, sorted_varieties_e1b)  #              sf2a与sf1b
intersection_eac = intersect(sorted_varieties_e2a, sorted_varieties_e1c)  #              sf2a与sf1c

intersection_eba = intersect(sorted_varieties_e2b, sorted_varieties_e1a)  # sf2第二段参数sf2b与sf1a交
intersection_ebb = intersect(sorted_varieties_e2b, sorted_varieties_e1b)  #              sf2b与sf1b
intersection_ebc = intersect(sorted_varieties_e2b, sorted_varieties_e1c)  #              sf2b与sf1c

# 定义 Excel 文件名
excel_file <- "E交集结果.xlsx"

# 创建数据框
df_eaa <- data.frame(Eaa = intersection_eaa)
df_eab <- data.frame(Eab = intersection_eab)
df_eac <- data.frame(Eac = intersection_eac)

df_eba <- data.frame(Eba = intersection_eba)
df_ebb <- data.frame(Ebb = intersection_ebb)
df_ebc <- data.frame(Ebc = intersection_ebc)

# 将数据框写入 Excel 文件
write_xlsx(list(df_eaa, df_eab, df_eac,df_eba,df_ebb,df_ebc), path = excel_file)

# 打印成功消息
cat("交集结果已成功写入到 Excel 文件:", excel_file)

##### 检验6个结果，两两做交集
intersection_list <- list(
  intersection_eaa, intersection_eab, intersection_eac,
  intersection_eba, intersection_ebb, intersection_ebc
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
