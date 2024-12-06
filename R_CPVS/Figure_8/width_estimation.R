rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)

load("data11.RData")

model = lm(width ~ Width, data = data1)
summary_model = summary(model)
                                                        
intercept = round(summary_model$coefficients[1,1], digits = 3) 
slope = round(summary_model$coefficients[2,1], digits = 3) 
                                                        
equation = paste("y = ", slope, "x + ", intercept)
r_squared = round(summary_model$r.squared, digits = 2)  

p1 = ggplot(data1, aes(x = Width, y = width)) +
  geom_point(shape = 21, size = 6, aes(fill= classify)) +
  geom_smooth(method = "lm") +
  theme_bw() +
  labs(x = "Pixel width", y = "Actual width", title = "")+
  theme(
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    panel.grid.major = element_blank(),                 
    panel.grid.minor = element_blank(),                 
    panel.background = element_blank(),
    axis.title.x = element_text(size = 18),
    axis.title.y = element_text(size = 18),
    axis.text.x = element_text(size = 18),
    axis.text.y = element_text(size = 18))+             
  annotate("text", x = min(data1$Width), y = 4.5, 
           label = paste(equation, "\nR² = ", round(r_squared, digits = 2)), 
           hjust = 0, vjust = 1, size = 10)
p1
ggsave("width.pdf", p1, width = 6.5, height = 5.5, unit = "in", dpi = 300)



