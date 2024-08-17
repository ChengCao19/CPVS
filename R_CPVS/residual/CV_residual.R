rm(list = ls())

library(ggplot2)
library(ggsci)
library(dplyr)

# CV = read.table("clipboard", sep = "\t", header = TRUE)
# save(CV, file = 'D:/Rproject/residual/CV.RData')
load("CV.RData")

# 假设CV是你的数据框（data frame），且v_ep1列包含了残差
CV_filtered <- CV %>%
  filter(abs(v_re1) <= 3.84)

# 直方图
# ggplot(CV_filtered, aes(x = v_re1)) +
#   geom_histogram(bins = 30, fill = "skyblue", color = "black") +
#   labs(x = "残差 (v_re1)", y = "", title = "") +
#   scale_x_continuous(
#     breaks = seq(round(min(CV_filtered$v_re1),1), round(max(CV_filtered$v_re1),1), length.out = 6))+
#   scale_y_continuous(breaks = c(0, 5, 10, 15, 20)) +
#   theme_bw()+
#   theme(
#     panel.grid.major = element_blank(), 
#     panel.grid.minor = element_blank())
# 残差分布
p = ggplot(CV_filtered, aes(x = CV1, y = v_re1)) +
  geom_point(shape = 23, fill = '#3D9195', color = "#3D9195",size = 7, stroke = 1.5, alpha = 0.6)+
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", linewidth = 1.95)+
  labs(x = "Predictive value(CV1)", y = "Residual", title = "")+
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
p = p + annotate("text", x = 25, y = -5, label = "(a)", size = 8)
p
ggsave(filename = "cancha.pdf", p, width = 6, height = 6, units = "in", dpi = 300)

# QQ图
p = ggplot(CV_filtered, aes(sample = v_re1))+
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
  coord_fixed(ratio = 0.7)
p = p + annotate("text", x = 0, y = -2.5, label = "(a)", size = 8)
p
ggsave(filename = "adjusted_plot.pdf", p, width = 6, height = 6, units = "in",dpi = 300)


