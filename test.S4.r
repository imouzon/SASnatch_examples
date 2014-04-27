#--------------------------------------**--------------------------------------#
#  File Name:
#  Purpose:
#
#  Creation Date: 26-04-2014
#  Last Modified: Sun Apr 27 03:16:18 2014
#  Created By:
#
#--------------------------------------**--------------------------------------#
#
#  FORTRAN and C: 
#  source('~/R/shlib/C_FORTRAN.shlib.r')
#  .Fortran("subroutine name",as.integer(input1),as.double(input2), etc)
#

fake.proj.folder <- '~/courses/stat585/SASnatch_examples/fake_project3/out/SAScache/'
fake.proj.chunk.name <- 'untitled-SAS-chunk1-'

   files.cache <- list.files(path=fake.proj.folder)
   files <- unique(files.cache[grepl(fake.proj.chunk.name,files.cache)])
   log.files <- files[grepl('.log',files)]
   length(log.files) == 0
      log.files <- paste(fake.proj.folder,files[grepl('.log',files)],sep='/')
      log.file <- paste(scan(file=log.files,sep='\n',what='character',quiet=TRUE),sep='\n')
      o

      methods(xtable)
      ?readHTMLTable
   if(use.XMLpackage == TRUE)}
      #get the SAScache.directory
      if(SASresults.path == ''){
         SAScache.directory = makeSAScache()
      }else{
         SAScache.directory = SASresults.path
      }

      #now that the file structure exists read the output
      files <- list.files(path=SAScache.directory)
      files <- unique(files[grepl(chunk.name,files)])

      #"true results are results that output a table
      html.files <- paste(SAScache.directory,files[grepl('.html',files)],sep='/')
      r.results <- lapply(1:length(html.files),function(i) readHTMLTable(html.results[[i]]))
      true.results <- sapply(1:length(html.files), function(i) length(r.results))

      #get only the .html files that have tables in them (the "true" results)
      html.files <- html.files[true.results]
      r.results <- lapply(1:length(html.files),function(i) readHTMLTable(html.results[[i]]))

      #get .tex files using the corresponding "true" html files
      tex.results <- lapply(1:length(true.results), function(i) print(xtable(r.results[[i]])))

      #get .tex files using the corresponding "true" html files
      html.results <- lapply(1:length(true.results), function(i) print(xtable(r.results[[i]],type='html')))
