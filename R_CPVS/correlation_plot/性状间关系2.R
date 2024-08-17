rm(list = ls())

library(ggplot2)
library(GGally)
library(ggsci)
library(corrmorant)
library(cols4all)
library(dplyr)
#devtools::install_local("C:/Users/15161/Desktop/corrmorant-master.zip")
# data11 = read.table("clipboard", set = "\t", header = TRUE)
# save(data11, file = "D:/Rproject/correlation_plot/data11.RData")

load('data11.RData')
data11 <- data11 %>%
  mutate(Species = recode(Species,
                          "H" = "Sea island cotton",
                          "L" = "Upland cotton",
                          "O" = "Other",
                          "Y" = "Asia cotton"))


ordercolors = c("#e688b3", "#8bc49c", "#9372b0", "#50928D")
ordercolors1 = c("")

p = ggpairs(data11,
        columns = 4: 7,
        mapping = ggplot2::aes(fill=Species, color=Species),
        lower = list(continuous=wrap('smooth', shape=21, size=2.5, color="grey20", alpha = 0.6)),
        diag = list(continuous=wrap("densityDiag", color="grey20", alpha=0.75)),
        upper = list(continuous=wrap("cor", size=5), combo=wrap("box_no_facet", color="grey20")))+
  scale_fill_manual(values = ordercolors) +
  scale_color_manual(values = ordercolors) +
  ggplot2::theme_bw() +
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    plot.background = element_blank(),
    panel.background = element_blank()
  )
p
ggsave("cor.pdf", p, width = 10.5, height = 9.5, unit = "in", dpi = 300)
