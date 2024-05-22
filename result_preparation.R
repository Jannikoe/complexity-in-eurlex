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

#find the common features in the analysis and put them into columns
red_english <- semi_join(reshaped_en, reshaped_de, by="Feature_id")
red_german <- semi_join(reshaped_de, reshaped_en, by="Feature_id")

red_english1 <- column_to_rownames(red_english, var="Feature_id")
red_english1 <- red_english1[order(as.numeric(row.names(red_english1))),]
red_english1 <- t(red_english1)

red_german1 <- column_to_rownames(red_german, var="Feature_id")
red_german1 <- red_german1[order(as.numeric(row.names(red_german1))),]
red_german1 <- t(red_german1)

# find and exclude features with NaN Values
NA_vars_de <- as.data.frame(which(is.na(red_german1), arr.ind=TRUE))
NA_vars_en <- as.data.frame(which(is.na(red_english1), arr.ind=TRUE))

NA_indices_de <- unique(NA_vars_de[2])
NA_indices_en <- unique(NA_vars_en[2])
NA_indices <- union(NA_indices_de,NA_indices_en)

red_english2 <- red_english1[,-NA_indices$col]
red_german2 <- red_german1[,-NA_indices$col]

# find and exclude features with SD = 0
no_SD_de <- as.data.frame(which(apply(red_german2, 2, sd)==0, arr.ind = TRUE))
no_SD_en <- as.data.frame(which(apply(red_english2, 2, sd)==0, arr.ind = TRUE))
colnames(no_SD_de) <- 'col'
colnames(no_SD_en) <- 'col'
no_SD_indices <- union(no_SD_de,no_SD_en)

red_english3 <- red_english2[,-no_SD_indices$col]
red_german3 <- red_german2[,-no_SD_indices$col]
