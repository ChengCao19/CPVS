rm(list = ls())

library(ggplot2)
library(ggsci)
library(dplyr)

# load data
load("CA2.RData")

CA2_filtered <- CA2 %>%
  filter(a_re21 >= -2.3 & a_re21 <= 4)

# residual distribution
p = ggplot(CA2_filtered, aes(x = CA21, y = a_re21)) +
  geom_point(shape = 23, fill = '#3D9195', color = "#3D9195",size = 7, stroke = 1.5, alpha = 0.6)+
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", linewidth = 1.95)+
  labs(x = "Predictive value(CA21)", y = "Residual", title = "")+
  theme_bw()+
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14))+
  scale_y_continuous(limits = c(-8, 8))+
  scale_x_continuous(limits = c(10, 40), breaks = c(15, 20, 25, 30, 35))
p = p + annotate("text", x = 25, y = -8, label = "(c)", size = 8)
p
ggsave(filename = "cancha.pdf", p, width = 6, height = 6, units = "in", dpi = 300)

# QQ plot
p = ggplot(CA2_filtered, aes(sample = a_re21))+
  stat_qq(shape = 21, fill = "#82B29A", size = 5, alpha = 0.6)+
  stat_qq_line()+
  labs(title = "")+
  xlab("")+
  ylab("")+
  theme_bw()+
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    plot.margin = margin(t = 0, r = 1, b = 0, l = 0, unit = "cm"),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14))+
  coord_fixed(ratio = 0.65)
p = p + annotate("text", x = 0, y = -2.5, label = "(c)", size = 8)
p
ggsave(filename = "adjusted_plot.pdf", plot = p, width = 6, height = 6, units = "in", dpi = 300)
