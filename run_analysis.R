##set the working directory to subfolder 'UCI HAR Dataset'
setwd(".\\UCI HAR Dataset")

## read the (meta)data into R(activity labels and features)
##add appropriate column names
activity_label <- read.table("activity_labels.txt",stringsAsFactors=FALSE,col.names=c("Activity_Code","Activity_Label"))
features <- read.table("features.txt",stringsAsFactors=FALSE)

##extract names of features (helps to name the feature vector columns in train_X and test_X)
features_name <- features[,2]

##import the train data and add names to the columns
library(data.table)
train_subj <- read.table(".\\train\\subject_train.txt",col.names=c("Subject"))
train_X <- read.table(".\\train\\X_train.txt")
train_y <- read.table(".\\train\\y_train.txt",col.names=c("Activity"))
colnames(train_X) <- features_name

##find the indices of the columns which contain mean() or std()
features_mean <- grep("mean()",features_name, fixed=TRUE)
features_std <- grep("std()",features_name, fixed=TRUE)

##subset the feature dataset train_X: keep only the mean() and std() variables
train_X <- train_X[,c(features_mean,features_std)]

##have a look at the information in the data frames
str(train_subj);summary(train_subj)
str(train_y);summary(train_y)
str(train_X)
summary(train_X)

##combine the three data frames
train_data <- cbind(train_subj,train_y,train_X)
##check for missing values in train data
all(colSums(is.na(train_data))==0)

##import the test data and add names to the columns
test_subj <- read.table(".\\test\\subject_test.txt",col.names=c("Subject"))
test_X <- read.table(".\\test\\X_test.txt")
test_y <- read.table(".\\test\\y_test.txt",col.names=c("Activity"))
colnames(test_X) <- features_name

##have a look at the information in the data frames
str(test_subj);summary(test_subj)
str(test_y);summary(test_y)

##subset the feature dataset test_X: keep only the mean() and std() variables
test_X <- test_X[,c(features_mean,features_std)]

##combine the three data frames
test_data <- cbind(test_subj,test_y,test_X)
##Do check for missing values in train data
all(colSums(is.na(test_data))==0)

##Merge the test and train data into one data set
total_data <- merge(train_data,test_data,all=TRUE)
names(total_data)

##define the integer variable 'Activity' as factor and assign labels
total_data$Activity <-as.factor(total_data$Activity)
levels(total_data$Activity) <- c(activity_label[,2])
##make all variables lowercase
names(total_data) <- tolower(names(total_data))

##melt the dataset (each row is a unique combination of subject, activity, feature and value)
library(reshape2)
total_data_melt <- melt(total_data,id=c("subject","activity"))
##calculate the mean of each feature for every combination of subject/activity
total_tidy <- dcast(total_data_melt, subject + activity ~ variable, mean)
head(total_tidy,n=3)
tail(total_tidy,n=3)

##set working directory one level higher (Assessment folder)
setwd("..")
##output total_tidy data frame as a text tab delimited file
write.table(total_tidy,"total_tidy.txt",sep = "\t",row.names= FALSE)
