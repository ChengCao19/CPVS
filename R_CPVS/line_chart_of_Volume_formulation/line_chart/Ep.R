rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)

data1 = read.table("clipboard",header = TRUE)
# 读取计算后的误差值
data2 = data.frame(
  x = c(1:nrow(data1)),
  y = data1$Ep                                       # Excel中名称为Ep14，此处直接为Ep仍然可以
)                                                    # 此处的y按照

# ggplot(data1, aes(x = x, y = error))+
#   geom_bar(aes(fill = error, color = error), stat = "identity", alpha = 1, width = 1)+
#   geom_line(color = "black", size = 0.5)+
#   scale_color_gradientn(colours = brewer.pal(9,'Reds'),name = "Value")

p1 = ggplot(data2, aes(x = x, y = y))+
  geom_line(size = 1.05, color = "#5994AF")+
  theme_bw()+
  theme(
    panel.grid = element_blank(),
    plot.margin = margin(t=1, r=1, b=0.5, l=0.5, unit="cm"),
    axis.title.x = element_blank(),                     # 隐藏x轴的名称
    axis.title.y = element_blank())+
  scale_x_continuous(name = "",limits = c(0, 120),
                     breaks = seq(0, 120, 20))+
  scale_y_continuous(name = "",limits = c(0, 2),
                     breaks = seq(0, 2, 1))

p1

