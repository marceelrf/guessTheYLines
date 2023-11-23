library(plotly)
library(patchwork)


subplot(
  plot_ly(data = tmp_df, y = ~y, type = 'histogram',alpha =.5,
          name = "density") %>% layout(xaxis = list(autorange="reversed")),
  plot_ly(data = tmp_df, x = ~x, y = ~y, type = 'scatter',
          mode = 'markers'),
  #Define the size
  nrows = 1, widths = c(.3,.7), margin = 0,shareY = T
)

(gg_hist <- ggplot(tmp_df,aes(y = y, color = 'density')) +  
  geom_histogram(aes(x = after_stat(density)), bins = 8,  fill = '#67B7D1', alpha = 0.5) +  
  geom_density(color = '#67B7D1') +  
  geom_rug(color = '#67B7D1') + 
  ylab("") + 
  xlab("")  + theme(legend.title=element_blank(),
                    legend.position = "none") +
  scale_color_manual(values = c('density' = '#67B7D1'))+
  scale_x_reverse())

(gg_scatter <- ggplot(tmp_df, aes(x,y)) +
  geom_point(color = "firebrick2") +
  ylab("") + 
  xlab("")  + theme(legend.title=element_blank())
  )


(gg_hist & gg_scatter) +
  plot_layout(widths = c(1,4))
