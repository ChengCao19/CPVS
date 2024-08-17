rm(list = ls())

# 加载ggplot2包
library(ggplot2)
library(RColorBrewer)
library(svglite)

#display.brewer.all()                                                           # 显示所有可用的颜色方案
#brewer.pal(9, "YlGnBu")  

# 假设有一个数据框df，其中包含两列：Actual（实际值）和Theoretical（理论值）
# 数据来源于Rproject
# 其中包含对每个公式的计算结果
#----
# area = read.table("clipboard",header = TRUE)                                  # data2则来源于all_ep
# save(area,file = "D:/Rproject/Consistency_plot/area.RData")
load("area.RData")
# area1 = read.table("clipboard",header = TRUE)                                   # all_Ep中的sheet2
# save(area1,file = "D:/Rproject/Consistency_plot/area1.RData")
load("area1.RData")

# 绘制实际值vs理论值的散点图，并添加一条y=x的45度线
p1 = ggplot(data = area1, aes(x = Ori, y = CA6)) +
  geom_point(size = 7, shape = 21, fill = "#79375E", alpha = 0.6) +                                                 
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", size = 1.05) + 
  # 添加45度线
  labs(x = "Actual Value", y = "Theoretical Value", title = "") +             # 添加标签
  theme_bw()+                                                                 # 使用简洁主题
  theme(panel.grid.major = element_blank(),                                   # 去除主要网格线
        panel.grid.minor = element_blank(),                                   # 去除次要网格线
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14))+
  coord_fixed(ratio = 1, xlim = c(5, 45), ylim = c(5, 45))                    # 设置坐标轴范围

p1 = p1 + annotate("text", x = 10, y = 45, label = bquote(R^2 == .(round(area$Rs[6], 2))), size = 6)
p1 = p1 + annotate("text", x = 11, y = 43, label = bquote(RMSE == .(round(area$RMSE[6], 2))), size = 6)
p1 = p1 + annotate("text", x = 25, y = 5, label = "(f)", size = 8)
p1
ggsave("plot.pdf", p1, width = 5.98, height = 6, units = "in", dpi = 300)
# 导出格式目前自定义为512*512
