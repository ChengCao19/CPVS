rm(list = ls())

# 此代码用于D:\Rproject\line_chart_of_Volume_formulation中的公式评价数据

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
# volume = read.table("clipboard",header = TRUE)                                  # data2则来源于all_ep,指标评价
# save(volume, file = "volume.RData")
load("volume.RData")

# volume1 = read.table("clipboard",header = TRUE)
# save(volume1, file = "volume1.RData")
load("volume1.RData")

# 绘制实际值vs理论值的散点图，并添加一条y=x的45度线
p1 = ggplot(data = volume1, aes(x = Ori, y = CV11)) +
    geom_point(size = 7, shape = 21, fill = "#3D8777", alpha = 0.4) +                                                 
    geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "black", size = 1.05) + 
                                                                                # 添加45度线
    labs(x = "Actual Value", y = "Theoretical Value", title = "")+
    theme_bw()+                                                                 # 使用简洁主题
    theme(panel.grid.major = element_blank(),                                   # 去除主要网格线
          panel.grid.minor = element_blank(),                                   # 去除次要网格线
          panel.background = element_blank(),
          axis.text.x = element_text(size = 14),
          axis.text.y = element_text(size = 14),
          axis.title.x = element_text(size = 14),
          axis.title.y = element_text(size = 14))+
    coord_fixed(ratio = 1, xlim = c(0, 45), ylim = c(0, 45))                    # 设置坐标轴范围

p1 = p1 + annotate("text", x = 10, y = 45, label = bquote(R^2 == .(round(volume$Rs[11], 2))), size = 6)
p1 = p1 + annotate("text", x = 10, y = 40, label = bquote(RMSE == .(round(volume$RMSE[11], 2))), size = 6)
p1 = p1 + annotate("text", x = 23, y = 0, label = "(k)", size = 8)
p1
ggsave("plot.pdf", p1, width = 5.98, height = 6, units = "in", dpi = 300)
# 导出格式目前自定义为512*512
