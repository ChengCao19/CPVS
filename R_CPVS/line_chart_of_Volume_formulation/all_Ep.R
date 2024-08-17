rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)
library(dplyr)

data1 = read.table("clipboard",header = TRUE)              # 数据采用all_ep中经过筛选后的数据

filtered_data = data1 %>%                                  # 筛选以及排序
  filter(RMSE > 0, Rs > 0) %>%
  arrange(RMSE, desc(Rs))

ggplot(filtered_data, aes(x = formulation, y = Rs, fill = formulation)) +
  geom_col() +
  geom_text(aes(label = round(Rs, 2)), position = position_dodge(width = 0.5), vjust = -0.5, color = "black") +
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

ggplot(filtered_data, aes(x = formulation, y = RMSE, fill = formulation)) +
  geom_col() +
  geom_text(aes(label = round(RMSE, 2)), position = position_dodge(width = 0.5), vjust = -0.5, color = "black") +
  theme_bw() +
  scale_fill_npg()+
  labs(title = "",
       x = "Formulation",  
       y = "RMSE") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),  # 倾斜x轴的文本，便于阅读
        panel.grid.major = element_blank(),                 # 去除主要网格线
        panel.grid.minor = element_blank(),                 # 去除次要网格线
        panel.background = element_blank())+
        #legend.position = "none")+
  scale_y_continuous(limits = c(0, 6), breaks = seq(0, 6, by = 1))

