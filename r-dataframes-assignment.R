#Exercise 1
install.packages("dplyr")
library(dplyr)
library(tidyverse)
help(package = dplyr)

#Exercise 2
shrub_dims <- read.csv("./data/shrub-volume-experiment.csv")

#2.1
names(shrub_dims)

#2.2
str(shrub_dims)

#2.3
head(shrub_dims)

#2.4
select(shrub_dims, length)

#2.5
select(shrub_dims, site, experiment)

#2.6
filter(shrub_dims, height > 5)

#2.7
shrub_data_w_vols <- mutate(shrub_dims, volume = length * width * height)
print(shrub_data_w_vols)


#Exercise 3
by_site <- group_by(shrub_dims, site)
avg_height <- summarize(by_site, avg_height = mean(height))

#3.1
by_site <- group_by(shrub_dims, experiment)
avg_height <- summarize(by_site, avg_height = mean(height))
print(avg_height)

#3.2
by_site <- group_by(shrub_dims, site)
max_height <- summarize(by_site, max_height = max(height))
print(max_height)


#Exercise 4
shrub_exper <- read.csv("./data/shrub-volume-experiments-table.csv")
shrub_manip <- inner_join(shrub_dims, shrub_exper, by = "experiment")
print(shrub_manip)


#Excercise 5

#5.1 5.2
#import shrub dimension data as a csv file from data folder in working directory
shrub_data <- read.csv("./data/shrub-volume-experiment.csv")
#select shrub dimension data as dataframe
shrub_data %>%
  #add a column for volume calculated using the recorded length, width, and height for each plant
  mutate(volume = length * width * height) %>%
  #group the mutated dataframe by site in preparation for summary by average volume
  group_by(site) %>%
  #calculate the mean volume for plants found at each site and display in a new column labelled mean_volume
  summarize(mean_volume = mean(volume))

#select shrub dimension data as dataframe
shrub_data %>%
  #add a column for volume calculated using the recorded length, width, and height for each plant
  mutate(volume = length * width * height) %>%
  #group the mutated dataframe by site in preparation for summary by average volume
  group_by(experiment) %>%
  #calculate the mean volume for plants found at each site and display in a new column labelled mean_volume
  summarize(mean_volume = mean(volume))


#Exercise 6
install.packages("dplyr")

portaldb <- src_sqlite("portal_mammals.sqlite")
surveys <- tbl(portaldb, "surveys")
