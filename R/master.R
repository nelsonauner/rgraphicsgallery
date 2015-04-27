#!/usr/bin/R
makeGraphic <- function(code,graph_width=400,graph_height=400,graph_res=45) {
  # input: code (right now, path to file) that produces a graph
  # output: none
  # effect: print a file to name.png
  png(file=paste0("../img/thumb/",code,".png"),width = graph_width,height=graph_height,res=graph_res)
  #consider using:
  par(mar=c(5,3,2,2)+0.1)
  setwd("./YourCodeHere/") #you have to do this so that the scripts can access local assets... 
  source(code)
  #TODO: we'll use this later: 
  #scriptContents <- readChar(currentScript, file.info(currentScript)$size)
  #print(scriptContents)
  setwd("..")
  dev.off()
  #file.copy(from=currentScript,to=paste0("./processedCode/",scripts[i]))
  #file.remove(currentScript)
  #no need to remove
}

getDate <- function(codeText) {
  # http://www.regexr.com/3ast2
  # input: a character vector of an entire code file
  # ideally 'codeText' object from makePost
  # output: the jekyll-friendly object corresponding to the string #date: 
  isDate <- Vectorize(
    function(string) grepl(pattern =".*?[#][ ]*?(?i)date(?-i):[ ]*?[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}",string)
  )
  #if matches more than one string, return error
  #if matches no string, return error
  return(
    gsub("[^0-9-]", "", codeText[isDate(codeText)])
  )
}

makePost <- function(code) {
# input: code (right now, path to file) that produces a graph
# output: none
# effect: print a file to name.png
  setwd("./YourCodeHere/")
codeText <- readLines(code, file.info(code)$size)
publish_date <- getDate(codeText)
setwd("..")
# we literally have to produce the rgraph .markdown post here
# starting working directory should be 
print("writing to:")
(post_file <-   paste0("../_posts/",publish_date,"-",code,".markdown"))
  fileConn<-file(post_file)#open file connection
writeLines(c(
            "---",
            "layout: post",
            paste0("thumbnail: img/thumb/",code,".png"),
            "---",
            "{% highlight R linenos %}",
            codeText,
            "{% endhighlight %}"
),fileConn)
close(fileConn)
}


#MAIN=======================
# should point to R/

parseCodeFiles <- function() {
  setwd("C:/Users/n_auner/tech/rgraphicsgallery/R")
  baseDir <- getwd()
  # find names of scripts placed in YourCodeHere
  substrRight <- function(x, n=2){substr(x, nchar(x)-n+1, nchar(x))}
  scripts <- dir("./YourCodeHere/")
  print(scripts)
  # scripts should be executed under the following conditions:
  #     - must end in ".R"
  #     - must not have same name as another, already processed script
  alreadyPosted <- strsplit(dir("../img/thumb/"),".png",fixed=TRUE)
  # todo: 
  #     - throw an error if alreadyPosted
  #     - throw a warning for all non-R files (they won't be run)

  scripts <-  scripts[sapply(scripts,
                             FUN=function(x) {
                               substrRight(x)==".R" && 
                                 !(strsplit(x,".R") %in% alreadyPosted)
                             })]
  print(scripts)
  # iterate over all valid scripts and produce graphics
  for (i in 1:length(scripts)) {
    currentScript <- paste0("./YourCodeHere/",scripts[i])
    print("processing")
    makeGraphic(scripts[i])
    makePost(scripts[i])
  }
}

parseCodeFiles()
