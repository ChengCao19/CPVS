rm(list = ls())

library(ggplot2)
library(ggsci)
library(dplyr)

load("LW.RData")

L1 = data.frame(
  FileJ = LW$FileJ, 
  length = LW$length, 
  LengthPre1 = LW$LengthPre1, 
  l_re1 = LW$l_re1)
W1 = data.frame(
  FileJ = LW$FileJ, 
  width = LW$width, 
  WidPre1 = LW$WidPre1, 
  w_re1 = LW$w_re2)

L1_filtered = L1 %>%
  filter(l_re1 <= 0.2 & l_re1 >= -0.3)
W1_filtered = W1 %>%
  filter(w_re1 <= 0.2 & w_re1 >= -0.2)

#----
# residual distribution
p = ggplot(L1, aes(x = LengthPre1, y = l_re1)) +
  geom_point(shape = 23, fill = '#3D9195', color = "#3D9195",size = 7, stroke = 1.5, alpha = 0.6)+
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", linewidth = 1.95)+
  labs(x = "Predictive value(L)", y = "Residual", title = "")+
  theme_bw()+
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14))+
  scale_y_continuous(limits = c(-1, 1), breaks = c(-0.5, 0, 0.5))+
  scale_x_continuous(limits = c(2, 8), breaks = c(3, 4, 5, 6, 7))
p = p + annotate("text", x = 5, y = -1, label = "(d)", size = 8)
p
ggsave(filename = "cancha.pdf", p, width = 6, height = 6, units = "in", dpi = 300)

# QQ plot
p = ggplot(L1_filtered, aes(sample = l_re1))+
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
  coord_fixed(ratio = 8.5)+
  scale_y_continuous(limits = c(-0.4, 0.22), breaks = c(-0.35, -0.09, 0.17))
p = p + annotate("text", x = 0, y = -0.28, label = "(d)", size = 8)
p
ggsave(filename = "adjusted_plot.pdf", plot = p, width = 6, height = 6, dpi = 300)

#----
# residual distribution
p = ggplot(W1, aes(x = WidPre1, y = w_re1)) +
  geom_point(shape = 23, fill = '#3D9195', color = "#3D9195",size = 7, stroke = 1.5, alpha = 0.6)+
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", linewidth = 1.95)+
  labs(x = "Predictive value(W)", y = "Residual", title = "")+
  theme_bw()+
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14))+
  scale_y_continuous(limits = c(-1, 1), breaks = c(-0.5, 0, 0.5))+
  scale_x_continuous(limits = c(1.5, 4.5), breaks = c(2, 2.5, 3, 3.5, 4))
p = p + annotate("text", x = 3, y = -1, label = "(e)", size = 8)
p
ggsave(filename = "cancha.pdf", plot = p, width = 6, height = 6, units = "in", dpi = 300)

# QQ plot
p = ggplot(W1_filtered, aes(sample = w_re1))+
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
  coord_fixed(ratio = 9)+
  scale_y_continuous(limits = c(-0.28, 0.28), breaks = c(-0.25, 0, 0.25))
p = p + annotate("text", x = 0, y = -0.28, label = "(e)", size = 8)
p
ggsave(filename = "adjusted_plot.pdf", plot = p, width = 6, height = 6, units = "in", dpi = 300)


