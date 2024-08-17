rm(list = ls())

library(ggplot2)
library(GGally)
library(ggsci)
library(corrmorant)
library(cols4all)
library(psych)
library(ggforce)
#devtools::install_local("C:/Users/15161/Desktop/corrmorant-master.zip")
# data11 = read.table("clipboard", set = "\t", header = TRUE)
# save(data11, file = "D:/Rproject/correlation_plot/data11.RData")

load('data11.RData') 

#----
pdf("pairs_plot.pdf", width = 10.5, height = 9.5)
pairs.panels(
  data11[4:7],
  panel = panel.smooth,   # 在散点图上添加平滑曲线
  hist.col = "lightblue", # 设置直方图的颜色
  density = TRUE,         # 在直方图上添加密度曲线
  ellipse = TRUE,         # 在散点图上添加浓度椭圆
  lm = TRUE,              # 在散点图上添加线性回归拟合线
  cor = TRUE,             # 显示相关系数
  stars = TRUE,           # 用星号显示相关系数的显著性
  bg = "lightgreen",      # 设置点的背景色
  pch = 21,               # 设置点的形状为填充圆
  col = "darkblue",       # 设置点的颜色
  cex = 0.6               # 设置点的大小
)
dev.off()
#----


