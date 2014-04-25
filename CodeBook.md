#Codebook project MOOC Getting and Cleaning data - UCI HAR dataset

===========================================================================================================
##Study design
Data for this analysis is a ZIP file obtained from a Machine Learning Repository website of UCI experiments.
Data origin is Smartlab (www.smartlab.ws) who carried out the Human Activity Recognition (using Smartphones) experiments.
By running the Download_Extract_Zip.R file the data will be downloaded (see README.md for more details)

The README.txt file in the downloaded UCI HAR Dataset folder provides us with useful info. These are the key findings and assumptions for this analysis:
*The files in the folder 'initial signals' are ignored. For the purpose of this analysis we work with the by Smartlab calculated and transformed variables.
*The data is split into a test and a train set, both consisting of three files which contain the calculated and transformed variables.
*There are six activities and the labels can be found in activity_labels.txt
*The 561-feature vector is defined in features.txt (these are the labels of the features)

============================================================================================================

##Data process

###Collecting meta data
At first we read the (meta)data containing the activity and feature labels into R (from the UCI HAR Dataset folder) with appropriate column names.
We extract a vector with the feature labels out of the features data frame(this is a help vector to name the feature vector columns in train_X and test_X)

###Read and transform train data
* The three 'train' datafiles are read into R. All three 'train' data frames have 7352 observations.
* Columns are labeled
train_subj has one column with the subject number (column labeled as 'Subject'), train_y has one column with the activity (column labeled as 'Activity') and the 561 features are in train_X
The labels for these columns are the feature labels which we have read into R in the first step (Collecting meta data).
We create two integer vectors 'features_mean' and 'features_std' which contain the indices of the mean and std features, given by mean() or std() in their feature name.
The train_X is subsetted on these 2 vectors: only the mean() and std() columns are kept.  

We merge these three files together; the resulting data frame is 'train_data'. We check this data frame for missing values, there are no missing values.

###Read and transform test data
The same method is applied to the three 'test' datafiles. All these three 'test' datafiles have 2947 observations.
The resulting data frame is 'test_data', also without missing values.


Features are normalized and bounded within [-1,1], so mean and std calculations can be done right away.

The broad advice, as someone who has already done it, is to document your assumptions in code comments and the md file describing the script.


If you are wanting to know the way most people shaped their output, 
it was column for subject, a column for activity, and columns for each summary variable 
(so 6*30 as each row represents a unique combination of subject and activity)


##Code book

description of variables and its units

Subject 1
Region code
1 .Northeast
2 .Midwest
3 .South
4 .West
9 .Puerto Rico
