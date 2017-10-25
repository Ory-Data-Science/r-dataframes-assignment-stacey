#dplyr
#Shub volume data frame
install.packages("dplyr")
library("tidyverse")
library(dplyr)
help(package = dplyr)

shrub<-read.csv("shrub-volume-experiment.csv")


str(shrub)
#'data.frame':	12 obs. of  5 variables:
#$ site      : int  1 1 1 2 2 2 3 3 3 4 ...
#$ experiment: int  1 2 3 1 2 3 1 2 3 1 ...
#$ length    : num  2.2 2.1 2.7 3 3.1 2.5 1.9 1.1 3.5 2.9 ...
#$ width     : num  1.3 2.2 1.5 4.5 3.1 2.8 1.8 0.5 2 2.7 ...
#$ height    : num  9.6 7.6 2.2 1.5 4 3 4.5 2.3 7.5 3.2 ...


head(shrub)
#site experiment length width height
#1    1          1    2.2   1.3    9.6
#2    1          2    2.1   2.2    7.6
#3    1          3    2.7   1.5    2.2
#4    2          1    3.0   4.5    1.5
#5    2          2    3.1   3.1    4.0
#6    2          3    2.5   2.8    3.0

select(shrub,length)
length
#1     2.2
#2     2.1
#3     2.7
#4     3.0
#5     3.1
#6     2.5
#7     1.9
#8     1.1
#9     3.5
#10    2.9
#11    4.5
#12    1.2

select(shrub,site, experiment)
#site experiment
#1     1          1
#2     1          2
#3     1          3
#4     2          1
#5     2          2
#6     2          3
#7     3          1
#8     3          2
#9     3          3
#10    4          1
#11    4          2
#12    4          3

shrubs%>%filter(height>5)
#shrubID length width height
#1      a1    2.2   1.3    9.6
#2      a2    2.1   2.2    7.6
#3      e1    3.5   2.0    7.5

shrub_data_w_vols <- mutate(shrub, "volume" = length*width*height)
 