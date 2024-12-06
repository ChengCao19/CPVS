rm(list = ls())

library(ggplot2)
library(RColorBrewer)
library(svglite)

load("LW.RData")

#display.brewer.all()                                                           # Show all available color schemes
#brewer.pal(9, "YlGnBu")  
calculate_metrics = function(actual, predicted) {
  residuals = actual - predicted
  mse = mean(residuals^2)                                                       # MSE
  rmse = sqrt(mse)                                                              # RMSE
  mae = mean(abs(residuals))                                                    # MAE
  mape = mean(abs(residuals / actual)) * 100                                    # MAPE
  
  ss_res = sum(residuals^2)                                                     # SSR
  ss_tot = sum((actual - mean(actual))^2)                                       # SST
  r_squared = 1 - (ss_res / ss_tot)                                             # R-square
                                                                                # Adjusted R-square
  n = length(actual)  
  p = length(coef(lm(predicted ~ actual))) - 1  
  adjusted_r_squared = 1 - ((1 - r_squared) * (n - 1) / (n - p - 1))
  
                                                                                # Returns a list of all metrics
  list(MSE = mse, RMSE = rmse, MAE = mae, MAPE = mape, R_Squared = r_squared, Adjusted_R_Squared = adjusted_r_squared)
}
results1 = calculate_metrics(LW$width, LW$WidPre1)
results2 = calculate_metrics(LW$length, LW$LengthPre1)

#----
p1 = ggplot(data = LW, aes(x = length, y = LengthPre1)) +
  geom_point(size = 7, shape = 21, fill = "#8D3F97", alpha = 0.4) +                                                 
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "black", size = 1.05) + 
  
  labs(x = "Actual Value", y = "Theoretical Value", title = "") +             
  theme_bw()+                                                                 
  theme(panel.grid.major = element_blank(),                                   
        panel.grid.minor = element_blank(),                                   
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))+
  coord_fixed(ratio = 1, xlim = c(0, 10), ylim = c(0, 10))                    

p1 = p1 + annotate("text", x = 1.25, y = 10, label = bquote(R^2 == .(round(results2$R_Squared, 2))), size = 6)
p1 = p1 + annotate("text", x = 1.55, y = 9.5, label = bquote(RMSE == .(round(results2$RMSE, 2))), size = 6)
p1 = p1 + annotate("text", x = 5, y = 0, label = "(d)", size = 8)
p1
ggsave("plot.pdf", p1, width = 5.98, height = 6, units = "in", dpi = 300)

#----
p1 = ggplot(data = LW, aes(x = width, y = WidPre1)) +
  geom_point(size = 7, shape = 21, fill = "#8D3F97", alpha = 0.4) +                                                 
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "black", size = 1.05) + 
  
  labs(x = "Actual Value", y = "Theoretical Value", title = "") +             
  theme_bw()+                                                                
  theme(panel.grid.major = element_blank(),                                   
        panel.grid.minor = element_blank(),                                   
        panel.background = element_blank(),
        axis.text.x = element_text(size = 14),
        axis.text.y = element_text(size = 14),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))+
  coord_fixed(ratio = 1, xlim = c(0, 10), ylim = c(0, 10))                    

p1 = p1 + annotate("text", x = 1.25, y = 10, label = bquote(R^2 == .(round(results1$R_Squared, 2))), size = 6)
p1 = p1 + annotate("text", x = 1.55, y = 9.5, label = bquote(RMSE == .(round(results1$RMSE, 2))), size = 6)
p1 = p1 + annotate("text", x = 5, y = 0, label = "(e)", size = 8)
p1
ggsave("plot.pdf", p1, width = 5.98, height = 6, units = "in", dpi = 300)
