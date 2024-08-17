rm(list = ls())

library(openxlsx)

# data1 = read.table("clipboard",header = TRUE)                                 # 该数据在源文件中筛选后再操作
# save(data1, file = "data1.RData")
load("data1.RData")

# define function
cal_metrics = function(x, y) {
  rmse = sqrt(sum(x^2)/nrow(x))
  rsquared = 1 - (sum(x^2) / sum((y - mean(y))^2))
  
  return(list(RMSE = rmse, Rsquared = rsquared))
}

#----SFAA----

# RMSE[1] = sqrt(sum(data2$Error1^2)/nrow(data2$Error1))                        # 示例计算方法
# R_aqu[1] = 1 - sum(data2$Error1^2) / sum((data2$volume - mean(data2$volume))^2)
# sfaa，sfab，sfac，sfba，sfbb，sfbc共6个类型
data2 = subset(data1, classify == 'sfaa')
results_list = list()
counter = 1
for (i in seq(from = 8, to = 26, by = 2)) {
  result = cal_metrics(data2[i],data2$volume)
  result$i_value = counter
  results_list[[counter]] = result
  counter = counter + 1
}
combined_results = do.call(rbind, results_list)
wb = createWorkbook() 
addWorksheet(wb, "All Results")
# 将合并后的数据框写入到这个工作表
writeData(wb, "All Results", combined_results)
saveWorkbook(wb, "results_list.xlsx", overwrite = TRUE)

#----SFAB----
data3 = subset(data1, classify == 'sfab')
results_list = list()
counter = 1
for (i in seq(from = 8, to = 26, by = 2)) {
  result = cal_metrics(data3[i],data3$volume)
  result$i_value = counter
  results_list[[counter]] = result
  counter = counter + 1
}
combined_results = do.call(rbind, results_list)
wb = createWorkbook() 
addWorksheet(wb, "All Results")
# 将合并后的数据框写入到这个工作表
writeData(wb, "All Results", combined_results)
saveWorkbook(wb, "results_list2.xlsx", overwrite = TRUE)

#----SFAC----
data4 = subset(data1, classify == 'sfac')
results_list = list()
counter = 1
for (i in seq(from = 8, to = 26, by = 2)) {
  result = cal_metrics(data4[i],data4$volume)
  result$i_value = counter
  results_list[[counter]] = result
  counter = counter + 1
}
combined_results = do.call(rbind, results_list)
wb = createWorkbook() 
addWorksheet(wb, "All Results")
writeData(wb, "All Results", combined_results)
saveWorkbook(wb, "results_list3.xlsx", overwrite = TRUE)

#----SFBA----
data5 = subset(data1, classify == 'sfba')
results_list = list()
counter = 1
for (i in seq(from = 8, to = 26, by = 2)) {
  result = cal_metrics(data5[i],data5$volume)
  result$i_value = counter
  results_list[[counter]] = result
  counter = counter + 1
}
combined_results = do.call(rbind, results_list)
wb = createWorkbook() 
addWorksheet(wb, "All Results")
writeData(wb, "All Results", combined_results)
saveWorkbook(wb, "results_list4.xlsx", overwrite = TRUE)




#----SFBB----
data6 = subset(data1, classify == 'sfbb')
results_list = list()
counter = 1
for (i in seq(from = 8, to = 26, by = 2)) {
  result = cal_metrics(data6[i],data6$volume)
  result$i_value = counter
  results_list[[counter]] = result
  counter = counter + 1
}
combined_results = do.call(rbind, results_list)
wb = createWorkbook() 
addWorksheet(wb, "All Results")
writeData(wb, "All Results", combined_results)
saveWorkbook(wb, "results_list5.xlsx", overwrite = TRUE)

#----SFBC----
data7 = subset(data1, classify == 'sfbc')
results_list = list()
counter = 1
for (i in seq(from = 8, to = 26, by = 2)) {
  result = cal_metrics(data7[i],data7$volume)
  result$i_value = counter
  results_list[[counter]] = result
  counter = counter + 1
}
combined_results = do.call(rbind, results_list)
wb = createWorkbook() 
addWorksheet(wb, "All Results")
writeData(wb, "All Results", combined_results)
saveWorkbook(wb, "results_list6.xlsx", overwrite = TRUE)
