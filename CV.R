##
###
##
## rm(list=ls())

library(yaml)
library(magrittr)

enumerate <- function(x, and = " & ") {
  if(length(x) == 1L) {
    x
  } else {
    y <- rep("", length(x))
    y[length(y) - 1L] <- and
    if(length(y) > 2L) y[1L:(length(y)-2L)] <- ", "
    paste(paste(x,y,sep=""),collapse="")
  }
}

lang <- "en"

"./CVcontents.yml" %>%
  yaml.load_file -> contents

contents$achievement$prja %>%
  lapply(function(x) x$authors[1L]) %>%
  unlist -> fauth

sum(fauth == "Guénard, G.")

contents$achievement$prja %>%
  lapply(function(x) x$authors) %>%
  unlist %>% unique %>% sort -> alist

contents$achievement$prja %>%
  lapply(function(x) x$outlet) %>%
  unlist %>% unique %>% sort -> jlist

jlist %>% enumerate(and = ", and ")

contents$achievement$presentation  %>%
  lapply(function(x) x$event) %>%
  unlist %>% unique %>% sort -> plist

contents$achievement$presentation %>%
  lapply(function(x) x$authors[1L]) %>%
  unlist -> fpauth

sum(fpauth == "Guénard, G.")

contents$achievement$presentation %>%
  lapply(function(x) x$authors) %>%
  unlist %>% unique %>% sort -> aplist

length(contents$achievement$report)

contents$achievement$report  %>%
  lapply(function(x, lang) x$series[[lang]], lang=lang) %>%
  unlist %>% unique %>% sort -> prlist

length(contents$achievement$software)

contents$achievement$software  %>%
  lapply(function(x) x$name) %>% unlist -> pkgname
contents$achievement$software  %>%
  lapply(function(x) x$maintainer) %>% unlist -> pkgmain

sum(pkgmain)

enumerate(pkgname[pkgmain], and = ", and ")
