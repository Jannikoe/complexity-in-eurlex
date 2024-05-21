install.packages("libr")
install.packages("stringr")
library(dplyr)
library(tidyr)
library(stringr)
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

# find and exclude features with NaN Values
which(is.na(red_german1), arr.ind=TRUE)
which(is.na(red_english1), arr.ind=TRUE)

red_english2 <- subset(red_english1, select = -c(15,17,40,71,74,115,127,161))
red_german2 <- subset(red_german1, select = -c(15,17,40,71,74,115,127,161))

# find and exclude features with SD = 0
which(apply(red_german2, 2, sd)==0, arr.ind = TRUE)
which(apply(red_english2, 2, sd)==0, arr.ind = TRUE)

red_english3 <- subset(red_english2, select = -c(4,28,49,60,75,100,122,170,199,
                                                 278,292,343,355,359))
red_german3 <- subset(red_german2, select = -c(4,28,49,60,75,100,122,170,199,
                                               278,292,343,355,359))

#create subsets for Feature(s) with respective ID
subgerman <- red_german3[,c('101','183','160','184','729'),drop=FALSE]
subenglish <- red_english3[,c('101','183','160','184','729'),drop=FALSE]

sds <- apply(red_english3, 2, sd)
View(sds)
apply(red_german3, 2, sd)

Unique_Words_de <- red_german3[,'854']
Unique_Words_en <- red_english3[,'854']

attach(mtcars)
par(mfrow=c(1,2))
hist(Unique_Words_de, ylim=c(0,60),xlim=c(0,200))
hist(Unique_Words_en, xlim=c(0,200))

plot(Unique_Words_de)
plot(Unique_Words_en)
boxplot(Unique_Words_de, ylim=c(0,350),xlab="Deutsch",
        ylab="Number of unique words")
boxplot(Unique_Words_en, ylim=c(0,350),xlab="Englisch",
        ylab="")
