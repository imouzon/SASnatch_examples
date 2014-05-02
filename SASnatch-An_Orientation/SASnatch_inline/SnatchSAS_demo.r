#--------------------------------------**--------------------------------------#
#  File Name: SnatchSAS_demo.r
#  Purpose: This code demonstrates the first of the two main SASnatch functions: 
#
#              snatchSAS()
#
#           snatchSAS takes as its input a character vector where the first
#           value is the names of the datasets to send from R to SAS
#           and the second value is the names of the datasets to return from
#           R to SAS. Any of the following are acceptable forms for this input:
#
#           dsn = c('d1','d2')
#           dsn = c('d1 d2 d3','d4, d2')
#           dsn = c('d1, d2 d3', 'd5  d1, d2')
#           
#           i.e., separation by commas or spaces it wont matter, snatchSAS() 
#           understands both.
#
#           The second input is a character string containing the code for 
#           SAS to exectue (no ODS statements, please).
#
#           The third input is a character value used to name the output created.
#
#           The function returns an object of class SASnatch.
#
#  Points of Interest: 
#      The SASnatch object contains all the information created during the SAS
#      session. It is an S4 object and has the following structure:
#
#      SASnatchObject
#       |
#       |____ results
#       |       |
#       |       |_____ R
#       |       |
#       |       |_____ TeX
#       |       |
#       |       |_____ rawTex
#       |       |
#       |       |_____ HTML
#       |       |
#       |       |_____ rawHTML
#       |
#       |
#       |____ code
#       |
#       |
#       |____ out
#       |       |
#       |       |_____ first dataset SAS returns
#       |       |
#       |       |_____ second dataset SAS returns
#       |       |
#       |       |_____ ...
#       |       |
#       |       |_____ nth dataset SAS returns
#       |
#       |
#       |____ log
#
#     
#       SAS output can be access directly by following the paths above
#       (i.e., SASnatchObject@results@R[[4]][[1]]) or by using the function
#         printSASnatch(<NAME OF SASnatch OBJECT>,type=<CHOICE>,items=<SELCTION>)
#       where the choice is one of R, TeX, HTML, rawTeX, and rawHTML
#
#      Datasets can be accessed through the path above.
#
#  Creation Date: 02-05-2014
#  Last Modified: Fri May  2 14:30:21 2014
#  Created By:
#
#--------------------------------------**--------------------------------------#
#
#  FORTRAN and C: 
#  source('~/R/shlib/C_FORTRAN.shlib.r')
#  .Fortran("subroutine name",as.integer(input1),as.double(input2), etc)
#
#load SASnatch package
library(SASnatch)

#set working directory
#setwd('U:/Desktop/presentation/SASnatch/')

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

#inspect output as an R table
pcs.snatch@results@R[[5]][[1]]

#inspect output as an HTML table
pcs.snatch@results@HTML[[5]][[1]]

#print all the R tables
printSASnatch(pcs.snatch,type='R')

#print just the first and fifth tables as latex
printSASnatch(pcs.snatch,type='TeX',items = c(1,5))

#check the output data
head(pcs.snatch@out@SAS2r$PCA1)
 
#create the plots using the output dataset
ggplot2:::qplot(Prin1,Prin2,data=pcs.snatch@out@SAS2R[[1]],facets=.~SEX)

#scree plot
rank = 1:nrow(pcs.snatch@results@R[[5]][[1]])
eigenval = as.numeric(as.character(pcs.snatch@results@R[[5]][[1]]$Eigenvalue))
qplot(rank,eigenval,geom='line')
