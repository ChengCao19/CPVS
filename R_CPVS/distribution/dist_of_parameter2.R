rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)

# data2 = read.table("clipboard",header = TRUE)           # data1为属性2:俯视图数据
# data2$numm = 1:nrow(data2)
# data1$Species <- factor(data1$Species, levels = c("L", "H", "Y", "F"))
# save(data2, file = "D:/Rproject/distribution/data2.RData")
load("data2.RData")

#----1----
p = ggplot(data2, aes(x = numm, y = sf2, colour = Species, size = Species)) +
  geom_point(alpha = 0.4)+
  scale_color_manual(
    values = c( "L" = "#826AA2CC", "H" = "#589A92CC", "Y" = "#0000FF", "F" = "#FF0000"),
    name = "Species",
    labels = c("UpC", "IsC", "AsC", "AfC"))+
  scale_size_manual(
    values = c("L" = 3.5, "H" = 3.5, "Y" = 3.5, "F" = 5.5),
    guide = "none")+
  theme_bw() +
  labs(x = "Varieties", y = "sf2", title = "")+
  theme(
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    panel.grid.major = element_blank(),                 # 去除主要网格线
    panel.grid.minor = element_blank(),                 # 去除次要网格线
    panel.background = element_blank(),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14))+
  scale_y_continuous(breaks = seq(0, 1, by = 0.25),    # 自定义纵轴刻度
                     limits = c(0, 1)) 
p
ggsave("sf2.pdf", p, width = 6.5, height = 5.5, unit = "in", dpi = 300)

#----2----
p1 = ggplot(data2, aes(x = numm, y = k2, colour = Species, size = Species))+
  geom_point(alpha = 0.4)+
  scale_color_manual(
    values = c( "L" = "#826AA2CC", "H" = "#589A92CC", "Y" = "#0000FF", "F" = "#FF0000"),
    name = "Species",
    labels = c("UpC", "IsC", "AsC", "AfC"))+
  scale_size_manual(
    values = c("L" = 3.5, "H" = 3.5, "Y" = 3.5, "F" = 5.5),
    guide = "none")+
  theme_bw() +
  labs(x = "Varieties", y = "k2", title = "")+
  theme(
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    panel.grid.major = element_blank(),                 # 去除主要网格线
    panel.grid.minor = element_blank(),                 # 去除次要网格线
    panel.background = element_blank(),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14))+
  scale_y_continuous(breaks = seq(0, 1, by = 0.25),    # 自定义纵轴刻度
                     limits = c(0, 1))
p1
ggsave("k2.pdf", p1, width = 6.5, height = 5.5, unit = "in", dpi = 300)

#----3----
p2 = ggplot(data2, aes(x = numm, y = e2, colour = Species, size = Species)) +
  geom_point(alpha = 0.4)+
  scale_color_manual(
    values = c( "L" = "#826AA2CC", "H" = "#589A92CC", "Y" = "#0000FF", "F" = "#FF0000"),
    name = "Species",
    labels = c("UpC", "IsC", "AsC", "AfC"))+
  scale_size_manual(
    values = c("L" = 3.5, "H" = 3.5, "Y" = 3.5, "F" = 5.5),
    guide = "none")+
  theme_bw()+
  labs(x = "Varieties", y = "e2", title = "")+
  theme(
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    panel.grid.major = element_blank(),                 # 去除主要网格线
    panel.grid.minor = element_blank(),                 # 去除次要网格线
    panel.background = element_blank(),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14))+
  scale_y_continuous(breaks = seq(0, 1, by = 0.25),    # 自定义纵轴刻度
                     limits = c(0, 1))
p2
ggsave("e2.pdf", p2, width = 6.5, height = 5.5, unit = "in", dpi = 300)

