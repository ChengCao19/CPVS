rm(list = ls())

library(ggplot2)
library(tidyr)
library(dplyr)
library(ggsci)

#----CV----
load("CV.RData")

CV_long = CV %>%
  pivot_longer(cols = c(volume, CV1),
               names_to = "Function",
               values_to = "Value")

p = ggplot(data = CV_long, aes(x = FileJ, y = Value))+
  #geom_point(aes(color = Function), size = 2.5, alpha = 0.5)+
  geom_line(aes(color = Function), size = 1.2, alpha = 0.8)+
  #scale_fill_npg()+
  #scale_color_npg()+
  scale_color_manual(values = c("#C85A2ECC", "#46B0B0CC"))+
  scale_y_continuous(limits = c(5, 45))+
  labs(title = "",
       x = "",
       y = "")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        legend.position = "none")
p
ggsave("zhexian.pdf", p, width = 6, height = 4, units = "in", dpi = 300)

#----CA1----
load("CA1.RData")

CA1_long = CA1 %>%
  pivot_longer(cols = c(area, CA11),
               names_to = "Function",
               values_to = "Value")

p = ggplot(data = CA1_long, aes(x = FileJ, y = Value))+
  geom_point(aes(color = Function), size = 2.5, alpha = 0.5)+
  geom_line(aes(color = Function), size = 1.2, alpha = 0.8)+
  #scale_fill_npg()+
  #scale_color_npg()+
  scale_color_manual(values = c("#C85A2ECC", "#46B0B0CC"))+
  scale_y_continuous(limits = c(5, 45))+
  labs(title = "",
       x = "",
       y = "")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        legend.position = "none")
p
ggsave("zhexian.pdf", p, width = 6, height = 4.5, units = "in", dpi = 300)

#----CA2----
load("CA2.RData")

CA2_long = CA2 %>%
  pivot_longer(cols = c(area, CA21),
               names_to = "Function",
               values_to = "Value")

p = ggplot(data = CA2_long, aes(x = FileJ, y = Value))+
  geom_line(aes(color = Function), size = 1.2, alpha = 0.8)+
  scale_fill_npg()+
  scale_color_npg()+
  labs(title = "",
       x = "",
       y = "area")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")
p
ggsave("zhexian.svg", p, device = "svg", width = 6, height = 4, units = "in", dpi = 300)

#----L----
load("LW.RData")

L1_long = LW %>%
  pivot_longer(cols = c(length, LengthPre1),
               names_to = "Function",
               values_to = "Value")

p = ggplot(data = L1_long, aes(x = FileJ, y = Value))+
  geom_line(aes(color = Function), size = 1.2, alpha = 0.8)+
  scale_fill_npg()+
  scale_color_npg()+
  labs(title = "",
       x = "",
       y = "length")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")
p
ggsave("zhexian.svg", p, device = "svg", width = 5.95, height = 4, units = "in", dpi = 300)

#----W----
load("LW.RData")

W1_long = LW %>%
  pivot_longer(cols = c(width, WidPre1),
               names_to = "Function",
               values_to = "Value")

p = ggplot(data = W1_long, aes(x = FileJ, y = Value))+
  geom_line(aes(color = Function), size = 1.2, alpha = 0.8)+
  scale_fill_npg()+
  scale_color_npg()+
  labs(title = "",
       x = "",
       y = "width")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        legend.position = "none")+
  scale_y_continuous(limits = c(0, 6))
p
ggsave("zhexian.svg", p, device = "svg", width = 6, height = 4, units = "in", dpi = 300)
