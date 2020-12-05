##### includes #####

library(reticulate)
library(rjson)
library(tidyverse)
library(lubridate)

##### import #####

months_json <- fromJSON(file = "dmonth.json") 
nums_jSON <- fromJSON(file = "dnum.json")
days_json <- fromJSON(file = "dweek.json")
flags_json <- fromJSON(file = "dflags.json")

now <- "2020-11-27T2:30"

in_csv <- data.frame(read.csv("submission_input.csv", encoding="UTF-8"))
in_csv$Expected <- "2020-11-27T2:30"

##### function to clean the string #####

# here we remove all commas
clean <- function(input)
{
  while (str_detect(input, ",") || str_detect(input, "\\.")){
  input <- str_replace(str_trim(input), ",", " ")
  input <- gsub("\\s+", " ", str_trim(input))
  input <- str_replace(str_trim(input), "\\.", " ")
  input <- gsub("\\s+", " ", str_trim(input))
  }
  return(input)
}

##### INPUT HERE #####

input <- "10.05.21"

##### extract year, month and day #####

find_year <- function(split){
  year = '2020'
  year <- split[which(str_detect(split, "[:digit:][:digit:][:digit:][:digit:]"))]
  return(year)
}

find_month <- function(split){
  month = '11'
  mon_names = names(months_json)
  month <- 11;
  for (i in 1:length(split)){
    for (j in 1:length(mon_names)) {
      if (split[i] == mon_names[j]) {
        month <- as.character(months_json[which(mon_names == mon_names[j])])
      }
    }
  }
  return(month)
}

find_day <- function(split){
  day = "27"
  
  "the code will be added"
  
  return (day)
}

##### function for standard input #####

std_input <- function(input)
{
  write(input, "input.txt")
  # calls the python script, that reads from the txt file 
  # gives the resulted string in res
  source_python("dnums_v0.4.py")
  
  split <- unlist(strsplit(res, ' '))
  
  year <- find_year(split)[1]
  year <- str_remove_all(year, "\\D")
  month <- find_month(split)[1]
  day <- find_day(split)[1]
  
  result <- glue::glue(year, month, day, .sep = '-', na.rm = TRUE)
  
  if (str_detect(input, "—")){
    return (input)
  } else if (length(result) == 0){
  return(now)
  } else {
    return(result)
  }
}

std_input(input)

##### writing to csv #####

c = list()
in_csv$Expected <- "0"
for(i in 1:388){
  c = as.character(unlist(as.character(in_csv$Id[i]), ' '))
  in_csv$Expected[i] <- as.character(std_input(c))
}

write.csv(in_csv, 'submission.csv', row.names=FALSE, fileEncoding="UTF-8")

