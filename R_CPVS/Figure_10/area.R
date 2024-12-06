rm(list = ls())

# 加载ggplot2包
library(ggplot2)
library(RColorBrewer)
library(svglite)

#----
# area = read.table("clipboard",header = TRUE)                                  
# save(area,file = "D:/Rproject/Consistency_plot/area.RData")
load("area.RData")
# area1 = read.table("clipboard",header = TRUE)                                
# save(area1,file = "D:/Rproject/Consistency_plot/area1.RData")
load("area1.RData")

p1 = ggplot(data = area1, aes(x = Ori, y = CA6)) +
  geom_point(size = 7, shape = 21, fill = "#79375E", alpha = 0.6) +                                                 
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", size = 1.05) + 
                                                                                # Add 45 degree line
  labs(x = "Actual Value", y = "Theoretical Value", title = "") +             
  theme_bw()+                                                                 
  theme(panel.grid.major = element_blank(),                                   
        panel.grid.minor = element_blank(),                                   
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14))+
  coord_fixed(ratio = 1, xlim = c(5, 45), ylim = c(5, 45))                    

p1 = p1 + annotate("text", x = 10, y = 45, label = bquote(R^2 == .(round(area$Rs[6], 2))), size = 6)
p1 = p1 + annotate("text", x = 11, y = 43, label = bquote(RMSE == .(round(area$RMSE[6], 2))), size = 6)
p1 = p1 + annotate("text", x = 25, y = 5, label = "(f)", size = 8)
p1
ggsave("plot.pdf", p1, width = 5.98, height = 6, units = "in", dpi = 300)
