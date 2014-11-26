---
layout: post
title:  "Halloween-themed M&Ms"
date:   2013-06-02 01:42:00
homepage: http://nelsonauner.com
download: http://nelsonauner.com/r/2014/10/30/Halloween-Magic-with-Functionals.html
author: Nelson Auner
thumbnail: Halloweenggplot.png
---


```r
library(reshape2) # http://bit.ly/1x2OEv5
library(magrittr) # ceci n'est pas un pipe
suppressPackageStartupMessages(library(dplyr))
library(ggplot2)
mms <- read.csv('http://stat.pugetsound.edu/hoard/datasets/mms.csv')
ggplot(mms,
       aes(x=diameter,
           y=mass,
           size=type,
           colour=color)) +  
  scale_color_manual(values = 
                       mms$color %>% 
                       unique %>% 
                       as.character %>% sort) +
  scale_size_manual(values = c(6,4,2)) + 
  geom_point(alpha=2/3) + 
  stat_smooth(method=loess,fill="orange",alpha=.5,colour="orange",size=1,aes(group=type)) + 
  ggtitle("Mass vs. Diameter of M&Ms") + 
  theme(legend.key = element_rect(colour = "black")) +
   theme(panel.background = element_rect(fill = "black"))
```
