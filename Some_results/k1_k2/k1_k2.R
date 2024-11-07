library(writexl)

# 使用 intersect 函数获取交集
intersection_kaa <- intersect(sorted_varieties_k2a, sorted_varieties_k1a)  # k2第一段参数k2a与k1a交
intersection_kab <- intersect(sorted_varieties_k2a, sorted_varieties_k1b)  #             k2a与k1b
intersection_kac <- intersect(sorted_varieties_k2a, sorted_varieties_k1c)  #             k2a与k1c

intersection_kba <- intersect(sorted_varieties_k2b, sorted_varieties_k1a)  # k2第二段参数k2b与k1a交
intersection_kbb <- intersect(sorted_varieties_k2b, sorted_varieties_k1b)  #             k2b与k1b
intersection_kbc <- intersect(sorted_varieties_k2b, sorted_varieties_k1c)  #             k2b与k1c

# 定义 Excel 文件名
excel_file <- "K交集结果.xlsx"

# 创建数据框
df_kaa <- data.frame(Kaa = intersection_kaa)
df_kab <- data.frame(Kab = intersection_kab)
df_kac <- data.frame(Kac = intersection_kac)

df_kba <- data.frame(Kba = intersection_kba)
df_kbb <- data.frame(Kbb = intersection_kbb)
df_kbc <- data.frame(Kbc = intersection_kbc)

# 将数据框写入 Excel 文件
write_xlsx(list(df_kaa, df_kab, df_kac,df_kba,df_kbb,df_kbc), path = excel_file)

# 打印成功消息
cat("交集结果已成功写入到 Excel 文件:", excel_file)

##### 检验6个结果，两两做交集
intersection_list <- list(
  intersection_kaa, intersection_kab, intersection_kac,
  intersection_kba, intersection_kbb, intersection_kbc
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