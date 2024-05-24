#z-transform given dataframes
red_english3_z <- scale(red_english3)
red_german3_z <- scale(red_german3)

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

subgerman
subenglish
red_english3[50,c(20), drop=FALSE]
red_german3[50,20]
red_german3["de_49.txt","80"]
Unique_Words_de[]
View(Unique_Words_de)

NA_columns_en <- red_english1[,NA_indices$col]
NA_columns_de <- red_german1[,NA_indices$col]
NA_columns <- rbind(NA_columns_de,NA_columns_en)

hist(syntactic_de_z[,"101"])

#red_comp <- rbind(red_german3,red_english3)
