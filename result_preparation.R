install.packages("libr")
install.packages("stringr")
library(stringr)
library(dplyr)
library(tidyr)
library(tidyverse)

#load and shape datasets
german <- read.csv("results_deutsch_100.csv", stringsAsFactors = FALSE, sep="\t")
english <- read.csv("results_english_100.csv", stringsAsFactors = FALSE, sep="\t")

reshaped_de <- select(german, Text_Title, Feature_id, Value)
reshaped_de <- pivot_wider(reshaped_de, names_from = Text_Title, values_from = Value)

reshaped_en <- select(english, Text_Title, Feature_id, Value)
reshaped_en <- pivot_wider(reshaped_en, names_from = Text_Title, values_from = Value)

#find the common features in the analysis
red_english <- semi_join(reshaped_en, reshaped_de, by="Feature_id")
red_german <- semi_join(reshaped_de, reshaped_en, by="Feature_id")

red_english1 <- column_to_rownames(red_english, var="Feature_id")
red_english1 <- red_english1[order(as.numeric(row.names(red_english1))),]
red_english1 <- t(red_english1)

red_german1 <- column_to_rownames(red_german, var="Feature_id")
red_german1 <- red_german1[order(as.numeric(row.names(red_german1))),]
red_german1 <- t(red_german1)

# find NaN Values
NAs_de <- which(is.na(red_german1), arr.ind=TRUE)
NAs_en <- which(is.na(red_english1), arr.ind=TRUE)

#create subsets for Feature(s) with respective ID
subgerman <- subset(sorted_de, Feature_id ==101 | Feature_id ==183 | 
                      Feature_id ==160 | Feature_id==184 | Feature_id ==343 |
                      Feature_id ==729)
subenglish <- subset(sorted_en, Feature_id ==101 | Feature_id ==183 | 
                       Feature_id ==160 | Feature_id==184 | Feature_id ==343 |
                       Feature_id ==729)

apply(red_german1, 2, sd)
apply(red_english1, 2, sd)
apply(red_german1, 2, mean)
summary(sorted_de$Value, sorted_de$Feature_id)

Unique_Words_de <- subset(sorted_de, Feature_id == 854)
Unique_Words_en <- subset(sorted_en, Feature_id == 854)

attach(mtcars)
par(mfrow=c(1,2))
hist(Unique_Words_de$Value, ylim=c(0,60),xlim=c(0,200))
hist(Unique_Words_en$Value, xlim=c(0,200))

plot(Unique_Words_de$Value)
plot(Unique_Words_en$Value)
boxplot(Value~Feature_id, data=Unique_Words_de, ylim=c(0,350),xlab="Deutsch",
        ylab="Number of unique words")
boxplot(Value~Feature_id, data=Unique_Words_en, ylim=c(0,350),xlab="Englisch",
        ylab="")