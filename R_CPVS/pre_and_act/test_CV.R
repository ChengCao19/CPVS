rm(list = ls())

library(ggplot2)
library(RColorBrewer)
library(svglite)

#display.brewer.all()                                                           # 显示所有可用的颜色方案
#brewer.pal(9, "YlGnBu")  

# CV = read.table("clipboard",header = TRUE)                                  # data2则来源于all_ep
# save(CV,file = "D:/Rproject/pre_and_act/CV.RData")
load("D:/Rproject/pre_and_act/CV.RData")

#display.brewer.all()                                                           # 显示所有可用的颜色方案
#brewer.pal(9, "YlGnBu")  
calculate_metrics = function(actual, predicted) {
  residuals = actual - predicted
  mse = mean(residuals^2)                                                       # 均方误差MSE
  rmse = sqrt(mse)                                                              # 均方根误差RMSE
  mae = mean(abs(residuals))                                                    # 平均绝对误差MAE
  mape = mean(abs(residuals / actual)) * 100                                    # 平均绝对百分比误差MAPE
  
  ss_res = sum(residuals^2)                                                     # 残差平方和
  ss_tot = sum((actual - mean(actual))^2)                                       # 总平方和
  r_squared = 1 - (ss_res / ss_tot)                                             # R方
  # 计算调整后R方
  n = length(actual)  # 数据点数量
  p = length(coef(lm(predicted ~ actual))) - 1  # 自变量数量，假定预测值是由实际值预测的简单线性回归模型的系数数量-1
  adjusted_r_squared = 1 - ((1 - r_squared) * (n - 1) / (n - p - 1))
  
  # 返回一个包含所有指标的列表
  list(MSE = mse, RMSE = rmse, MAE = mae, MAPE = mape, R_Squared = r_squared, Adjusted_R_Squared = adjusted_r_squared)
}
results1 = calculate_metrics(CV$volume, CV$CV1)
results2 = calculate_metrics(CV$volume, CV$CV2)
results3 = calculate_metrics(CV$volume, CV$CV3)
results4 = calculate_metrics(CV$volume, CV$CV4)
results5 = calculate_metrics(CV$volume, CV$CV5)
results_df = data.frame(
  Model = c("CV1", "CV2", "CV3", "CV4", "CV5"),
  R_Squared = c(results1$R_Squared, results2$R_Squared, results3$R_Squared, results4$R_Squared, results5$R_Squared),
  RMSE = c(results1$RMSE, results2$RMSE, results3$RMSE, results4$RMSE, results5$RMSE)
)

# 绘制实际值vs理论值的散点图，并添加一条y=x的45度线
p1 = ggplot(data = CV, aes(x = volume, y = CV1)) +
  geom_point(size = 7, shape = 21, fill = "#8D3F97", alpha = 0.4) +                                                 
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "black", size = 1.05) + 
                                                                              # 添加45度线
  labs(x = "Actual Value", y = "Theoretical Value", title = "") +             # 添加标签
  theme_bw()+                                                                 # 使用简洁主题
  theme(panel.grid.major = element_blank(),                                   # 去除主要网格线
        panel.grid.minor = element_blank(),                                   # 去除次要网格线
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))+
  coord_fixed(ratio = 1, xlim = c(0, 40), ylim = c(0, 40))                    # 设置坐标轴范围

p1 = p1 + annotate("text", x = 5, y = 40, label = bquote(R^2 == .(round(results_df$R_Squared[1], 2))), size = 6)
p1 = p1 + annotate("text", x = 6, y = 38, label = bquote(RMSE == .(round(results_df$RMSE[1], 2))), size = 6)
p1 = p1 + annotate("text", x = 20, y = 0, label = "(a)", size = 8)
p1
ggsave("plot.pdf", p1, width = 5.98, height = 6, units = "in", dpi = 300)






