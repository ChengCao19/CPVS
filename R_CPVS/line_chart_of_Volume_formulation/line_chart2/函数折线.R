rm(list = ls())

library(ggplot2)
library(ggsci)

# 创建一个数据框，包含x的值
df <- data.frame(x = seq(-3, 3), y = seq(0.25, 0.6))

# 添加四个函数的值到数据框
df$y1 = pi/6
df$y2 = 1/2
df$y3 = 2*pi/15
df$y4 = 2/5

# 使用ggplot绘制图像
ggplot(df, aes(x = x)) +
  geom_line(aes(y = y1, color = "pi/6"), size = 1.3) +
  geom_line(aes(y = y2, color = "1/2"), size = 1.3) +
  geom_line(aes(y = y3, color = "2*pi/15"), size = 1.3) +
  geom_line(aes(y = y4, color = "2/5"), size = 1.3) +
  labs(title = "",
       x = "x",
       y = "y",
       color = "function")+
  scale_color_npg()+
  #scale_color_manual(values = ) +
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  scale_y_continuous(breaks = c(0.4, 0.42, 0.46, 0.5, 0.52))
