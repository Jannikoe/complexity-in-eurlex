#z-transform given dataframes
red_english3_z <- scale(red_english3)
red_german3_z <- scale(red_german3)

sds <- apply(red_english3, 2, sd)
View(sds)
apply(red_german3, 2, sd)

attach(mtcars)
par(mfrow=c(1,2))
hist(Unique_Words_de, ylim=c(0,60),xlim=c(0,200))
hist(Unique_Words_en, xlim=c(0,200))

plot(Unique_Words_de)
plot(Unique_Words_en)

boxplot(syntactic_de[,'101'],ylim=c(0,50),xlab="Deutsch",
        ylab="Sentences")
boxplot(syntactic_en[,'101'],ylim=c(0,50),xlab="Englisch",
        ylab="")

boxplot(lexical_de[,'854'],ylim=c(0,350),xlab="Deutsch",
        ylab="Unique Words")
boxplot(lexical_en[,'854'],ylim=c(0,350),xlab="Englisch",
        ylab="")

boxplot(syntactic_de[,'343'],ylim=c(0,50),xlab="Deutsch",
        ylab="Sentences?")
boxplot(syntactic_en[,'343'],ylim=c(0,50),xlab="Englisch",
        ylab="")

hist(processing_de[,'477'],xlab="Deutsch", main = "Total IC")
hist(processing_en[,'477'],xlab="Englisch", main = "Total IC")

boxplot(discourse_de[,'27'],ylim=c(0,5),xlab="Deutsch",
        ylab="Global Noun Overlap")
boxplot(discourse_en[,'27'],ylim=c(0,5),xlab="Englisch",
        ylab="")

boxplot(morphological_de[,'756'],ylim=c(0,5),xlab="Deutsch",
        ylab="MCI-5")
boxplot(morphological_en[,'756'],ylim=c(0,5),xlab="Englisch",
        ylab="")

boxplot(language_use_de[,'70'],ylim=c(0,200),xlab="Deutsch",
        ylab="Adjective Frequency per Million")
boxplot(language_use_en[,'70'],ylim=c(0,200),xlab="Englisch",
        ylab="")

NA_columns_en <- red_english1[,NA_indices$col]
NA_columns_de <- red_german1[,NA_indices$col]
NA_columns <- rbind(NA_columns_de,NA_columns_en)

NA_test <- subset(red_german1, select=c('229','493'))
NA_vars_de_test <- as.data.frame(which(is.na(NA_test), arr.ind=TRUE))
NA_indices_de_test <- unique(NA_vars_de_test[1])
NA_inspection_229_493 <- red_german1[NA_indices_de_test$row,]

NA_test2 <- subset(red_german1, select=c('59','61','145','245','358','397'))
NA_vars_de_test2 <- as.data.frame(which(is.na(NA_test2), arr.ind=TRUE))
NA_indices_de_test2 <- unique(NA_vars_de_test2[1])
NA_inspection_Edit_Distance <- red_german1[NA_indices_de_test2$row,]