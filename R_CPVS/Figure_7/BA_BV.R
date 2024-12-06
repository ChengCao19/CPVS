rm(list = ls())

library(ggplot2)
library(ggsci)
library(ggpubr)
library(ggExtra)
library(broom)

# data = read.table("clipboard",sep = "\t",header = TRUE)
load("data11.RData")
#----
model = lm(area ~ volume, data = data11)
summary_model = summary(model)                                                  # linear

intercept = round(summary_model$coefficients[1,1], digits = 3) 
slope = round(summary_model$coefficients[2,1], digits = 3) 
                                                                                # create equation
equation = paste("y = ", slope, "x + ", intercept)
r_squared = round(summary_model$r.squared, digits = 2)                          # R方

Scatter = ggplot(data11, aes(x = volume, y = area))+
  #expand_limits(x=c(-13.5,-0.5),y=c(-15,240))+
  geom_point(shape = 21, size = 3.8, aes(fill= classify), position="jitter",alpha=1)+
  stat_smooth(method = "lm",formula = y ~ x, size = 1.2, linetype = 1, alpha = 0.7)+
  geom_rug(aes(color = varieties),size = 1, alpha = 0.4, position = "jitter",show.legend = FALSE)+
  scale_fill_npg()+
  theme_bw()+                                                         # stat_cor(method = "pearson")+
  theme(axis.text.x=element_text(angle=0,size=15,vjust=1,hjust=0.5,color = "black"),
        axis.text.y=element_text(size=15,color = "black"),
        axis.title.y=element_text(size=18.4),
        axis.title.x=element_text(size=18.4),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank())+
  labs(x = "Volume", y = "Area") +
  annotate("text", x = min(data11$volume), y = max(data11$area), 
           label = paste(equation, "\nR² = ", round(r_squared, digits = 2)), 
           hjust = 0, vjust = 1, size = 6)
  
Scatter

p = ggMarginal(Scatter,type="density",xparams = list(fill ="#7CAE00"),size = 12,
           yparams = list(fill ="#7CAE00"))
p
ggsave("VS1.pdf", p, width = 6.5, height = 5.5, unit = "in", dpi = 300)

#----
model = lm(area ~ log(volume), data = data11)
summary_model = summary(model)                                                  

intercept = round(coef(summary_model)[1], digits = 3)
slope = round(coef(summary_model)[2], digits = 3)

equation = paste("y = ", slope, "ln(x)- ", abs(intercept))
r_squared = round(summary_model$r.squared, digits = 2)

Scatter <- ggplot(data11, aes(x = volume, y = area)) +
  geom_point(shape = 21, size = 3.8, aes(fill= classify), position="jitter", alpha=1) +
  stat_smooth(method = "lm", formula = y ~ log(x), size = 1.2, linetype = 1, alpha = 0.7) +
  geom_rug(aes(color = varieties), size = 1, alpha = 0.4, position = "jitter", show.legend = FALSE) +
  scale_fill_npg() +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 0, size = 15, vjust = 1, hjust = 0.5, color = "black"),
        axis.text.y = element_text(size = 15, color = "black"),
        axis.title.y = element_text(size = 18.4),
        axis.title.x = element_text(size = 18.4))+
  labs(x = "Volume", y = "Area")+
  annotate("text", x = min(data11$volume), y = max(data11$area), 
           label = paste(equation, "\nR² = ", r_squared), 
           hjust = 0, vjust = 1, size = 6)
Scatter

p1 = ggMarginal(Scatter, type = "density", xparams = list(fill ="#7CAE00"), size = 12,
           yparams = list(fill ="#7CAE00"))
ggsave("VS2.pdf", p1, width = 6.5, height = 5.5, unit = "in", dpi = 300)

#----
model = nls(area ~ a * volume^b, data = data11, start = list(a = 1, b = 1))
summary_model = summary(model)                                                 

# # 计算残差平方和（RSS）
# residuals <- residuals(model)
# RSS <- sum(residuals^2)
# # 计算总平方和（TSS）
# mean_area <- mean(data$area)
# TSS <- sum((data$area - mean_area)^2)
# # 计算类似于R-squared的值
# pseudo_R2 <- 1 - (RSS / TSS)
# print(pseudo_R2)

a = round(coef(model)['a'], digits = 3)
b = round(coef(model)['b'], digits = 3)

equation = paste("y = ", a, "* x^", b)
pseudo_R2 = round(0.8197138, digits = 2) # 使用之前计算得到的值

volume_seq <- seq(min(data11$volume), max(data11$volume), length.out = 100)
predicted_area <- a * volume_seq^b

Scatter <- ggplot(data11, aes(x = volume, y = area)) +
  geom_point(shape = 21, size = 3.8, aes(fill = classify), position = "jitter", alpha = 1) +
  geom_line(data = data.frame(volume_seq, predicted_area), aes(x = volume_seq, y = predicted_area), color = "blue", size = 1.2) +
  geom_rug(aes(color = varieties), size = 1, alpha = 0.4, position = "jitter", show.legend = FALSE) +
  scale_fill_npg() +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 0, size = 15, vjust = 1, hjust = 0.5, color = "black"),
        axis.text.y = element_text(size = 15, color = "black"),
        axis.title.y = element_text(size = 18.4),
        axis.title.x = element_text(size = 18.4)) +
  labs(x = "Volume", y = "Area") +
  annotate("text", x = min(data11$volume), y = max(data11$area), 
           label = paste(equation, "\nR² = ", pseudo_R2), 
           hjust = 0, vjust = 1, size = 6) 

print(Scatter)

# Add edge distribution map
p3 = ggMarginal(Scatter, type = "density", margins = "both", xparams = list(fill = "#7CAE00"), yparams = list(fill = "#7CAE00"))
p3
ggsave("VS3.pdf", p3, width = 6.5, height = 5.5, unit = "in", dpi = 300)

#----
model = lm(log(area) ~ log(volume), data = data11)
summary_model = summary(model)                                                  # logarithm

intercept = round(coef(summary_model)[1], digits = 3)
slope = round(coef(summary_model)[2], digits = 3)

equation = paste("ln(y) =", slope, "ln(x) +", intercept)
# 将该模型转化为乘幂形式:y=a*x^b
# a = 3.85  # 前面计算得到的a值
# b = 0.631  # 从对数模型直接得到的b值
# equation = paste("y = ", a, "* x^", b)
r_squared = round(summary_model$r.squared, digits = 2) # R方

Scatter <- ggplot(data11, aes(x = volume, y = area)) +
  geom_point(shape = 21, size = 3.8, aes(fill= classify), position="jitter", alpha=1) +
  stat_smooth(method = "lm", formula = y ~ log(x), size = 1.2, linetype = 1, alpha = 0.7) +
  geom_rug(aes(color = varieties), size = 1, alpha = 0.4, position = "jitter", show.legend = FALSE) +
  scale_fill_npg() +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 0, size = 15, vjust = 1, hjust = 0.5, color = "black"),
        axis.text.y = element_text(size = 15, color = "black"),
        axis.title.y = element_text(size = 18.4),
        axis.title.x = element_text(size = 18.4)) +
  labs(x = "Volume", y = "Area") +
  annotate("text", x = min(data11$volume), y = max(data11$area), 
           label = paste(equation, "\nR² = ", r_squared), 
           hjust = 0, vjust = 1, size = 6)                                      # Adjust the size parameter to ensure the text is readable

print(Scatter)

p4 = ggMarginal(Scatter, type = "density", xparams = list(fill ="#7CAE00"), size = 12,
           yparams = list(fill ="#7CAE00"))
ggsave("VS4.pdf", p4, width = 6.5, height = 5.5, unit = "in", dpi = 300)
