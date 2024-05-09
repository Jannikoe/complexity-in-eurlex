install.packages("stringr")
library(stringr)

#load datasets
german <- read.csv("results_de_100.csv", stringsAsFactors = FALSE)
english <- read.csv("results_en_100.csv", stringsAsFactors = FALSE)

# Split name column into individual feature clumns (\t-separated)
german[c('Text_id', 'Tags', 'Text_Title', 'Feature_id', 'Feature_Name', 'Value')] <- str_split_fixed(german$"Text_id.Tags.Text_Title.Feature_id.Feature_Name.Value", '\t', 6)
english[c('Text_id', 'Tags', 'Text_Title', 'Feature_id', 'Feature_Name', 'Value')] <- str_split_fixed(english$"Text_id.Tags.Text_Title.Feature_id.Feature_Name.Value", '\t', 6)

# Rearrange columns and remove original name column
german <- german[c('Text_id', 'Tags', 'Text_Title', 'Feature_id', 'Feature_Name', 'Value')]
english <- english[c('Text_id', 'Tags', 'Text_Title', 'Feature_id', 'Feature_Name', 'Value')]

# exclude NaN Values
german_no_NaN <- german[german$Value != "NaN",]
english_no_NaN <- english[english$Value != "NaN",]

# convert characters into numbers for 'Value' and 'Feature_id'
german_no_NaN$Value <- as.numeric(as.character(german_no_NaN$Value))
english_no_NaN$Value <- as.numeric(as.character(english_no_NaN$Value))
german_no_NaN$Feature_id <- as.numeric(as.character(german_no_NaN$Feature_id))
english_no_NaN$Feature_id <- as.numeric(as.character(english_no_NaN$Feature_id))

#find the common features in the analysis
red_english_no_NaN <- semi_join(english_no_NaN, german_no_NaN, by="Feature_id")
red_german_no_NaN <- semi_join(german_no_NaN,english_no_NaN, by="Feature_id")

#sort by Feature_id
sorted_en <- red_english_no_NaN[order(red_english_no_NaN$Feature_id),]
sorted_de <- red_german_no_NaN[order(red_german_no_NaN$Feature_id),]

#create a subset for Feature with respective ID
subgerman <- sorted_de[sorted_de$Feature_id < 35, ]
subenglish <- sorted_en[sorted_en$Feature_id < 35,]

summary(subenglish)
boxplot(Value~Feature_id, data=subenglish)
plot(red_english_no_NaN$Feature_id, red_english_no_NaN$Value)
subgerman$Feature_Name
hist(subgerman$Value)
