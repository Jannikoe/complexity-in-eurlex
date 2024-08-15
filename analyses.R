#z-transform given dataframes
red_english3_z <- scale(red_english3)
red_german3_z <- scale(red_german3)

sds <- apply(red_english3, 2, sd)
View(sds)
apply(red_german3, 2, sd)

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

x <- '521'
mean(red_german3[,x])
sd(red_german3[,x])
mean(red_english3[,x])
sd(red_english3[,x])

Feature <- '18'
Featurename <- ""
BOXPLOT <- data.frame(y=c(red_german3_z[,Feature],red_english3_z[,Feature]),
                      x=c(rep("Deutsch",length(red_german3_z[,Feature])),
                          rep("Englisch",length(red_english3_z[,Feature]))))
with(BOXPLOT, boxplot(y~x,notch=TRUE,outline=FALSE,xlab="",ylab=Featurename))
