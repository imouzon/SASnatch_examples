#load SASnatch package
library(SASnatch)

#set working directory
setwd('U:/Desktop/presentation/SASnatch/')

#where is SAS on this computer
path_to_SAS.EXE = "\"C:/Program Files/SASHome/SASFoundation/9.3/sas.exe\""

#read in the turtle data
turtle = read.table('../SASalone//turtles.txt')
names(turtle) <- c('LENGTH', 'WIDTH', 'HEIGHT', 'SEX')

#What is the SAS code
SAScode = 'PROC PRINCOMP data = turtle COV OUT=PCA1; VAR LENGTH WIDTH HEIGHT; run;'

#datasets: c('input','output')
dsn = c('turtle','PCA1')

#run the SAS code
pcs.snatch = snatchSAS(dsn,SAScode,S4name='pcs')

#what is pcs.snatch
class(pcs.snatch)

#what features are available?
slotNames(pcs.snatch)

#inspect output
pcs.snatch@results@R[[5]][[1]]

pcs.snatch@results@HTML[[5]][[1]]

#print all the R tables
printSASnatch(pcs.snatch,type='R')

#print just the first and fifth tables as latex
printSASnatch(pcs.snatch,type='TeX',items = c(1,5))

#check the output data
head(pcs.snatch@out@SAS2r$PCA1)
 
#create the plots
ggplot2:::qplot(Prin1,Prin2,data=pcs.snatch@out@SAS2R[[1]],facets=.~SEX)

#scree plot
rank = 1:nrow(pcs.snatch@results@R[[5]][[1]])
eigenval = as.numeric(as.character(pcs.snatch@results@R[[5]][[1]]$Eigenvalue))
qplot(rank,eigenval,geom='line')
