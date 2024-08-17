setwd("D:/Rproject/correlation_plot")
rm(list = ls())

#----Correlation plot of BV and BW

library(ggplot2)
library(ggsci)
library(ggpubr)
library(ggExtra)

# data = read.table("clipboard",sep = "\t",header = TRUE)
load("data11.RData")

model = lm(volume ~ width, data = data11)
#model = lm(log(volume) ~ log(width), data = data11)
summary_model = summary(model)
                                                                                # 截距与斜率
intercept = round(summary_model$coefficients[1,1], digits = 3) 
slope = round(summary_model$coefficients[2,1], digits = 3) 
                                                                                # 构建公式字符串
equation = paste("y = ", slope, "x - ", abs(intercept))
#equation = paste("ln(y) =", slope, "ln(x) +", intercept)
r_squared = round(summary_model$r.squared, digits = 2)                          # R方

Scatter = ggplot(data11,aes(x = width, y = volume))+
            #expand_limits(x=c(-13.5,-0.5),y=c(-15,240))+
            geom_point(shape = 21, size = 3.8, aes(fill= classify), position="jitter",alpha=1)+
            stat_smooth(method = "lm",formula = y ~ x, size = 1.2, linetype = 1, alpha = 0.7)+
            geom_rug(aes(color = varieties),size = 1, alpha = 0.4, position = "jitter",show.legend = FALSE)+
            scale_fill_npg()+
            theme_bw()+                                                         # stat_cor(method = "pearson")+
            theme(panel.grid.major=element_blank())+theme(panel.grid.minor=element_blank())+
            theme(axis.text.x=element_text(angle=0,size=15,vjust=1,hjust=0.5,color = "black"),
                  axis.text.y=element_text(size=15,color = "black"),
                  axis.title.y=element_text(size=18.4),
                  axis.title.x=element_text(size=18.4))+
  labs(x = "Width", y = "Volume")+
  annotate("text", x = min(data11$width), y = max(data11$volume)+5, 
           label = paste(equation, "\nR² = ", round(r_squared, digits = 3)), 
           hjust = 0, vjust = 1, size = 6)
Scatter
# ggMarginal(Scatter,type="density",xparams = list(fill ="#7CAE00"),size = 12,
#            yparams = list(fill ="#7CAE00"))

ggsave("VW2.pdf", Scatter, width = 6.5, height = 5.5, unit = "in", dpi = 300)

