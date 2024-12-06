rm(list = ls())

library(ggplot2)
library(ggsci)
library(RColorBrewer)
library(scales)

# data1 = read.table("clipboard",header = TRUE)           
# data1$numm = 1:nrow(data1)
# save(data1, file = "D:/Rproject/distribution/data11.RData")
load("data11.RData")

model = lm(length ~ Height, data = data1)
summary_model = summary(model)
                                                                                
intercept = round(summary_model$coefficients[1,1], digits = 3) 
slope = round(summary_model$coefficients[2,1], digits = 3) 
                                                                                
equation = paste("y = ", slope, "x - ", abs(intercept))
r_squared = round(summary_model$r.squared, digits = 2)                          

p = ggplot(data1, aes(x = Height, y = length)) +
  geom_point(shape = 21, size = 6, aes(fill= classify)) +
  geom_smooth(method = "lm") +
  theme_bw()+
  labs(x = "Pixel length", y = "Actual length", title = "")+
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
  scale_y_continuous(labels = label_number(scale = 1, suffix = "", accuracy = 0.1))+
  annotate("text", x = min(data1$Height), y = max(data1$length), 
           label = paste(equation, "\nR² = ", round(r_squared, digits = 2)), 
           hjust = 0, vjust = 1, size = 10)
p
ggsave("Length.pdf", p, width = 6.5, height = 5.5, unit = "in", dpi = 300)


