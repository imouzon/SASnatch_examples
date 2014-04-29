#--------------------------------------**--------------------------------------#
#  File Name: test.SASnatch.r
#  Purpose:
#
#  Creation Date: 14-04-2014
#  Last Modified: Tue Apr 29 10:55:14 2014
#  Created By:
#
#--------------------------------------**--------------------------------------#
#
#  FORTRAN and C: 
#  source('~/R/shlib/C_FORTRAN.shlib.r')
#  .Fortran("subroutine name",as.integer(input1),as.double(input2), etc)
#

#load the SASnatch package
library(SASnatch)

#does the hello message work?
helloSnatch('... hopefully')

#We can create a SASnatch object by hand to better understand
#how it is structured and why
rawhtml.output <- list('Raw HTML output is output coming directly from SAS', 
                        'These files contain titles and html code that may not be desirable and are stored in the rawHTML slot of the results slot')
rawtex.output <- list('Raw TeX output is output coming directly from SAS', 
                       'These files contain titles and latex code that may not be desirable and are stored in the rawTeX slot of the results slot')
r.output <- list('Using the XML package we can get the tables out of the raw HTML',
                 'the slot R in the results slot contains the tables read this way')
tex.output <- list('Using the xtable package we can write more knitr friendly TeX tables',
                   'the TeX slot in the results slot contains the tables written using the xtable packages')
html.output <- list('Using the xtable package we can write more knitr friendly HTML tables',
                   'the HTML slot in the results slot contains the tables written using the xtable packages')

#put the results into results S4 object
results <- new('snatchResults', 
               rawHTML = rawhtml.output, 
               HTML = html.output, 
               rawTeX = rawtex.output,
               TeX = tex.output,
               R = r.output)

#code is an object
code.file = 'code as it is run in SAS'

#results in a dataset
d1 <- data.frame(x=1:10,y=1:10)
d2 <- data.frame(fish=c(rep('bass',5),rep('trout',5)),wts=rexp(10))
d3 <- data.frame(fish=c(rep('bass',5),rep('trout',5)),wts=rexp(10))

#output is a list of data sets produced by SAS
output2R <- new('snatchOutput',SAS2R=list(d1,d2))

#results from log
log.file <- 'this is erros and stuff'

#and this is the final SAS output
snatch.Chunk <- new('SASnatch',code = code.file, results = results, out = output2R, log = log.file)

snatch.Chunk@results@HTML[[2]]
snatch.Chunk@results@TeX[[2]]
snatch.Chunk@results@rawTeX[[2]]
snatch.Chunk@results@R[[1]]
snatch.Chunk@code
snatch.Chunk@out
snatch.Chunk@log
snatch.Chunk

#and we can print any of the results we would like 
#using the printSASnatch function

#print the R tables
printSASnatch(snatch.Chunk)

#print the html tables
printSASnatch(snatch.Chunk,type = 'HTML')
