x <- '173'
mean(red_german3[,x])
sd(red_german3[,x])
mean(red_english3[,x])
sd(red_english3[,x])
median(red_english3[,x])
median(red_german3[,x])

Feature <- '459'
Featurename <- "SUBTLEX Word Frequency/Million (N Type)" 
BOXPLOT <- data.frame(y=c(red_german3_z[,Feature],red_english3_z[,Feature]),
                      x=c(rep("Deutsch",length(red_german3_z[,Feature])),
                          rep("Englisch",length(red_english3_z[,Feature]))))
with(BOXPLOT, boxplot(y~x,notch=TRUE,outline=FALSE,xlab="",ylab=Featurename,
                      xlim=c(0, 3)))

