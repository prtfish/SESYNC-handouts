## Tidy data concept


## Reshaping multiple columns in category/value pairs

library(tidyr)
counts_gather <- gather(counts_df, key = "species", value = "count", wolf:fox)

counts_spread <- spread(counts_gather, key = species, value = count)

## Exercise 
counts_gather <- counts_gather[-8,]
counts_spread <- spread(counts_gather, key = species, value = count, fill = 0)


## Read comma-separated-value (CSV) files

surveys <- read.csv("data/surveys.csv")



## Subsetting and sorting

library(dplyr)


surveys_1990_winter <- dplyr::select(surveys_1990_winter, record_id, month, day, plot_id, species_id, sex, hindfoot_length, weight)
surveys_1990_winter <- dplyr::select(surveys_1990_winter, -year)
sorted <- arrange(surveys_1990_winter, desc(species_id), weight)

## Exercise 2

df_RO <- filter(surveys, species_id == "RO")
df_RO <- select(df_RO, record_id, sex, weight)

## Grouping and aggregation

surveys_1990_winter_gb <- group_by(surveys_1990_winter, species_id)

counts_1990_winter <- summarize(surveys_1990_winter_gb, count = n())



## Exercise 3

df_DM <- filter(surveys_species_id == "DM")
df_DM <- select(df_DM, month, weight, hindfoot_length)
df_DM_gb <- group_by(df_DM, month)
df_DM_avg <- summarize(df_DM_gb, hfl_avg = mean(hindfoot_length, na.rm=T), wgt_avg=mean(weight, na.rm=T))


## Pivto tables through aggregate and spread

surveys_1990_winter_gb <- group_by(surveys_1990_winter, ...)
counts_by_month <- ...(surveys_1990_winter_gb, ...)
pivot <- ...

## Transformation of variables

prop_1990_winter <- mutate(...)

## Exercise 4

...

## Chainning with pipes

prop_1990_winter_piped <- surveys %>%
  filter(year == 1990, month %in% 1:3)%>%
  ... # select all columns but year
select(-year) %>%
  ... # group by species_id
group_by(species_id)%>%
  ... # summarize with counts
summarize(counts=n())
  ... # mutate into proportions
