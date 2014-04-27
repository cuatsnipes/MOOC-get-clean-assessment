# Project description MOOC Getting and Cleaning data - UCI HAR dataset

===========================================================================================================
## Study design
Data for this analysis is a ZIP file obtained from a Machine Learning Repository website of UCI experiments.
Data origin is Smartlab (www.smartlab.ws) who carried out the Human Activity Recognition (using Smartphones) experiments.
By running the Download_Extract_Zip.R file the data will be downloaded (see README.md for more details)

The README.txt file in the downloaded UCI HAR Dataset folder provides these insights: 
*The data is split into a test and a train set, both consisting of three files which contain calculated and transformed variables.
*There are six activities and the labels can be found in activity_labels.txt
*The 561-feature vector is defined in features.txt (these are the labels of the features)

The following assumption is done for this analysis:
*The files in the folder 'initial signals' are ignored. For the purpose of this analysis we work with the by Smartlab calculated and transformed variables.

============================================================================================================

## Data process

### Collecting meta data
At first (meta)data is read into R, containing the activity and feature labels (from the UCI HAR Dataset folder). Column names are added.
A vector with the feature labels is created out of the features data frame(help vector to name the feature vector columns in train_X and test_X)

### Read and transform TRAIN data
* The three TRAIN datafiles are read into R. All three TRAIN data frames have 7352 observations.
* Columns are labeled:
** Subject number in 'train_subj' labeled as 'Subject'
** Activity in 'train_y' labeled as 'Activity'
** 561 features in 'train_X' labeled with the feature labels from meta data
* Integer vectors 'features_mean' and 'features_std' are created. They contain indices of the mean and std features, given by mean() or std() in their name
* Feature data frame 'train_X' is subsetted on these 2 vectors  
* The three data frames 'train_subj','train_y' and 'train_X' are merged; the resulting data frame is 'train_data'
* 'train_data' is checked for missing values; there are no missing values

### Read and transform TEST data
The same method as for the TRAIN data is applied to TEST data. All three TEST datafiles have 2947 observations.
The resulting data frame is 'test_data', also without missing values.

### Make tidy dataset
* The test and train data is merged into one data frame ('total_data')
* Integer 'Activity' is set to a factor variable with its labels from the meta data
* All variables set to lower case
* Data is melted to get a unique combination of subject, activity, feature and value
* Data is transformed to final 'total_tidy' data frame: The average of each mean and std feature is calculated for every subject/activity combination (30*6)
* Because features are normalized and bounded within [-1,1] no further actions were necessary

============================================================================================================

## Code book
total_tidy.txt is a tab delimited text file containing the following variables:

subject
	Subject (volunteer) number
	1..30  - integer number of subject
activity
	Daily activity performed by subject
	Factor variable, 6 factors:
	"WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"
		
The following 66 columns are all numeric [-1,1] bounded variables. The columns contain averages of 33 mean and 33 standard deviation values of feature signals.
tbodyacc-mean()-x
	Average of mean body acceleration in X direction
tbodyacc-mean()-y
	Average of mean body acceleration in Y direction
tbodyacc-mean()-z
	Average of mean body acceleration in Z direction
tgravityacc-mean()-x
	Average of mean gravity acceleration in X direction
tgravityacc-mean()-y
	Average of mean gravity acceleration in Y direction
tgravityacc-mean()-z
	Average of mean gravity acceleration in Z direction
tbodyaccjerk-mean()-x
	Average of mean body acceleration Jerk signal in X direction
tbodyaccjerk-mean()-y
	Average of mean body acceleration Jerk signal in Y direction
tbodyaccjerk-mean()-z
	Average of mean body acceleration Jerk signal in Z direction
tbodygyro-mean()-x
	Average of mean body gyroscope signal in X direction
tbodygyro-mean()-y
	Average of mean body gyroscope signal in Y direction
tbodygyro-mean()-z
	Average of mean body gyroscope signal in Z direction
tbodygyrojerk-mean()-x
	Average of mean body gyroscope Jerk signal in X direction
tbodygyrojerk-mean()-y
	Average of mean body gyroscope Jerk signal in Y direction
tbodygyrojerk-mean()-z
	Average of mean body gyroscope Jerk signal in Z direction
tbodyaccmag-mean()
	Average of mean body acceleration magnitude
tgravityaccmag-mean()
	Average of mean gravity acceleration magnitude
tbodyaccjerkmag-mean()
	Average of mean body acceleration Jerk magnitude
tbodygyromag-mean()
	Average of mean body gyroscope magnitude
tbodygyrojerkmag-mean()
	Average of mean body gyroscope Jerk magnitude
fbodyacc-mean()-x
	Average of mean body acceleration frequency in X direction
fbodyacc-mean()-y
	Average of mean body acceleration frequency in Y direction
fbodyacc-mean()-z
	Average of mean body acceleration frequency in Z direction
fbodyaccjerk-mean()-x
	Average of mean body acceleration Jerk frequency in X direction
fbodyaccjerk-mean()-y
	Average of mean body acceleration Jerk frequency in Y direction
fbodyaccjerk-mean()-z
	Average of mean body acceleration Jerk frequency in Z direction
fbodygyro-mean()-x
	Average of mean body gyroscope frequency signal in X direction
fbodygyro-mean()-y
	Average of mean body gyroscope frequency signal in Y direction
fbodygyro-mean()-z
	Average of mean body gyroscope frequency signal in Z direction
fbodyaccmag-mean()
	Average of mean body acceleration frequency magnitude
fbodybodyaccjerkmag-mean()
	Average of mean body acceleration Jerk frequency magnitude
fbodybodygyromag-mean()
	Average of mean body gyroscope frequency magnitude
fbodybodygyrojerkmag-mean()
	Average of mean body gyroscope Jerk frequency magnitude
tbodyacc-std()-x
	Average of standard deviation of body acceleration in X direction
tbodyacc-std()-y
	Average of standard deviation of body acceleration in Y direction
tbodyacc-std()-z
	Average of standard deviation of body acceleration in Z direction
tgravityacc-std()-x
	Average of standard deviation of gravity acceleration in X direction
tgravityacc-std()-y
	Average of standard deviation of gravity acceleration in Y direction
tgravityacc-std()-z
	Average of standard deviation of gravity acceleration in Z direction
tbodyaccjerk-std()-x
	Average of standard deviation of body acceleration Jerk signal in X direction
tbodyaccjerk-std()-y
	Average of standard deviation of body acceleration Jerk signal in Y direction
tbodyaccjerk-std()-z
	Average of standard deviation of body acceleration Jerk signal in Z direction
tbodygyro-std()-x
	Average of standard deviation of body gyroscope signal in X direction
tbodygyro-std()-y
	Average of standard deviation of body gyroscope signal in Y direction
tbodygyro-std()-z
	Average of standard deviation of body gyroscope signal in Z direction
tbodygyrojerk-std()-x
	Average of standard deviation of body gyroscope Jerk signal in X direction
tbodygyrojerk-std()-y
	Average of standard deviation of body gyroscope Jerk signal in Y direction
tbodygyrojerk-std()-z
	Average of standard deviation of body gyroscope Jerk signal in Z direction
tbodyaccmag-std()
	Average of standard deviation of body acceleration magnitude
tgravityaccmag-std()
	Average of standard deviation of gravity acceleration magnitude
tbodyaccjerkmag-std()
	Average of standard deviation of body acceleration Jerk magnitude
tbodygyromag-std()
	Average of standard deviation of body gyroscope magnitude
tbodygyrojerkmag-std()
	Average of standard deviation of body gyroscope Jerk magnitude
fbodyacc-std()-x
	Average of standard deviation of body acceleration frequency in X direction
fbodyacc-std()-y
	Average of standard deviation of body acceleration frequency in Y direction
fbodyacc-std()-z
	Average of standard deviation of body acceleration frequency in Z direction
fbodyaccjerk-std()-x
	Average of standard deviation of body acceleration Jerk frequency in X direction
fbodyaccjerk-std()-y
	Average of standard deviation of body acceleration Jerk frequency in Y direction
fbodyaccjerk-std()-z
	Average of standard deviation of body acceleration Jerk frequency in Z direction
fbodygyro-std()-x
	Average of standard deviation of body gyroscope frequency signal in X direction
fbodygyro-std()-y
	Average of standard deviation of body gyroscope frequency signal in Y direction
fbodygyro-std()-z
	Average of standard deviation of body gyroscope frequency signal in Z direction
fbodyaccmag-std()
	Average of standard deviation of body acceleration frequency magnitude
fbodybodyaccjerkmag-std()
	Average of standard deviation of body acceleration Jerk frequency magnitude
fbodybodygyromag-std()
	Average of standard deviation of body gyroscope frequency magnitude
fbodybodygyrojerkmag-std()
	Average of standard deviation of body gyroscope Jerk frequency magnitude