##create the required subfolder
if(!file.exists(".\\Coursera_C3")){
  dir.create(".\\Coursera_C3")
}
if(!file.exists(".\\Coursera_C3\\Assessment")){
   dir.create(".\\Coursera_C3\\Assessment")
}

##download zip file into subfolder
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipURL, ".\\Coursera_C3\\Assessment\\HAR.zip")

##extract files from zip file
unzip(".\\Coursera_C3\\Assessment\\HAR.zip",exdir=".\\Coursera_C3\\Assessment")
