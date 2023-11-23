library(tidyverse)
(y <- rnorm(n = 200,mean = .5,sd = .2))

y[y<0] <- 0


y <- append(y,rnorm(n = 40,mean = .75,sd = .01))

y

tmp_df <- 
  tibble(y=y) %>% 
  arrange(y) %>% 
  rownames_to_column("x") %>% 
  mutate(x = as.numeric(x)) 

tmp_df %>% 
  ggplot(aes(x,y)) +
  geom_point()
