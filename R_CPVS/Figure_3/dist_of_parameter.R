rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)

# data1 = read.table("clipboard",header = TRUE)           # data1为属性1:正视图数据
# data1$numm = 1:nrow(data1)
# data1$Species <- factor(data1$Species, levels = c("L", "H", "Y", "F"))
# save(data1, file = "D:/Rproject/distribution/data1.RData")
load("data1.RData")

#----1----
p = ggplot(data1, aes(x = numm, y = sf1, colour = Species, size = Species))+
  geom_point(alpha = 0.4)+
  scale_color_manual(
    values = c( "L" = "#826AA2CC", "H" = "#589A92CC", "Y" = "#0000FF", "F" = "#FF0000"),
    name = "Species",
    labels = c("UpC", "IsC", "AsC", "AfC"))+
  scale_size_manual(
    values = c("L" = 3.5, "H" = 3.5, "Y" = 3.5, "F" = 5.5),
    guide = "none")+
  theme_bw() +
  labs(x = "Varieties", y = "sf1", title = "")+
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
ggsave("sf1.pdf", p, width = 6.5, height = 5.5, unit = "in", dpi = 300)

#----2----
p1 = ggplot(data1, aes(x = numm, y = k1, color = Species, size = Species)) +
  geom_point(alpha = 0.4)+
  scale_color_manual(
    values = c( "L" = "#826AA2CC", "H" = "#589A92CC", "Y" = "#0000FF", "F" = "#FF0000"),
    name = "Species",
    labels = c("UpC", "IsC", "AsC", "AfC"))+
  scale_size_manual(
    values = c("L" = 3.5, "H" = 3.5, "Y" = 3.5, "F" = 5.5),
    guide = "none")+
  theme_bw() +
  labs(x = "Varieties", y = "k1", title = "")+
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
ggsave("k1.pdf", p1, width = 6.5, height = 5.5, unit = "in", dpi = 300)
#----3----

p2 = ggplot(data1, aes(x = numm, y = e1, color = Species, size = Species)) +
  geom_point(alpha = 0.4)+
  scale_color_manual(
    values = c( "L" = "#826AA2CC", "H" = "#589A92CC", "Y" = "#0000FF", "F" = "#FF0000"),
    name = "Species",
    labels = c("UpC", "IsC", "AsC", "AfC"))+
  scale_size_manual(
    values = c("L" = 3.5, "H" = 3.5, "Y" = 3.5, "F" = 5.5),
    guide = "none")+
  theme_bw() +
  labs(x = "Varieties", y = "e1", title = "")+
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
ggsave("e1.pdf", p2, width = 6.5, height = 5.5, unit = "in", dpi = 300)
