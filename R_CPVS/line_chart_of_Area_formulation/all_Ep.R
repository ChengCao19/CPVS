rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)

data1 = read.table("clipboard",header = TRUE)              # 数据采用all_ep中经过筛选后的数据

ggplot(data1, aes(x = formulation, y = Rs, fill = formulation)) +
  geom_col() +
  theme_bw() +
  scale_fill_npg()+
  labs(title = "",
       x = "Formulation",  
       y = "Rs") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),  # 倾斜x轴的文本，便于阅读
        panel.grid.major = element_blank(),                 # 去除主要网格线
        panel.grid.minor = element_blank(),                 # 去除次要网格线
        panel.background = element_blank())+
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.2))

