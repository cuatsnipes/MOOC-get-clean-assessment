MOOC-get-clean-assessment
=========================

Repo for the assessment for Coursera MOOC Course Getting and Cleaning data
There are three files in this repo:
* Download_Extract_Zip.R
* run_analysis.R
* CodeBook.md
The two .R files have to be run in the order listed above.

###Download_Extract_Zip.R
The Download_Extract_Zip.R file:
* creates a subfolder ..\Coursera_C3\Assessment
* downloads the ZIP file into this folder
* extracts all the files of the ZIP file into folder UCI HAR Dataset

###run_analysis.R
The run_analysis.R file:
* merges the test and training data into 1 dataset
* extracts only the measurements on the mean and standard deviation for each measurement
* gives descriptive names to the activities and the measurement columns
* creates a second, independent tidy dataset with the average of each measurement for every combination of subject/activity (30*6)

###CodeBook.md
CodeBook.md contains information on:
* the data collection (source and process)
* observations about the data
* the actions undertaken to tidy up the raw data
* description of the variables and labels of the output dataset (dataset created by running the two R scripts)
