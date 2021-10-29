## This is the script "run_analysis" submitted for the course project
## for the "Getting and Cleaning Data" class. There are 7 sections of code.


## Section 1 - Read the training dataset, and associated Activity and
## Subject data. Combine the 3 datasets into a dataframe, naming the 
## variables for Subject and Activity.
X_train <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
subject_train <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
y_train <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
train1 <- cbind(y_train, X_train)
names(train1)[1] <- "Activity"
train2 <- cbind(subject_train, train1)
names(train2)[1] <- "Subject"
train <- train2
rm(train1, train2, subject_train, y_train, X_train)

## Section 2 - Read the testing dataset, and associated Activity and
## Subject data. Combine the 3 datasets into a dataframe, naming the 
## variables for Subject and Activity.
X_test <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
subject_test <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
y_test <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
test1 <- cbind(y_test, X_test)
names(test1)[1] <- "Activity"
test2 <- cbind(subject_test, test1)
names(test2)[1] <- "Subject"
test <- test2
rm(test1, test2, subject_test, y_test, X_test)

## Section 3 - Combine the training and testing dataframes.
complete1 <- rbind(train, test)
rm(train, test)

## Section 4 - Name the features variables.
features <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(complete1)[3:563] <- features$V2
rm(features)

## Section 5 - Select the feature variables for mean and standard deviation.
## Note: "meanFreq" variables excluded.
complete2 <- complete1[, grep("Subject|Activity|mean()|std()", names(complete1))]
complete3 <- complete2[,!str_detect(names(complete2),"meanFreq")]
rm(complete1, complete2)

## Section 6 - Read the dataset with the named values for Activity, and
## replace the numeric codes with the name values in the dataframe "complete".
library(dplyr)
activity_labels <- read.table("~/RStudio/GaCDproj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
names(activity_labels)[1] <- "Activity"
complete4 <- inner_join(complete3, activity_labels, by = "Activity")
complete5 <- relocate(complete4, V2, .after = Subject)
complete6 <- complete5[, -3]
names(complete6)[2] <- "Activity"
complete <- complete6
rm(complete3, complete4, complete5, complete6, activity_labels)

## Section 7 - Create the dataframe "tidy_summary" containing the average
## (mean) values for the 66 selected feature variables, by Subject and
## Activity. Save it as a CSV dataset.
tidy_summary <- complete %>% group_by(Subject, Activity) %>%
  summarize(across(.fns = mean))
write.table(tidy_summary, "~/RStudio/GaCDproj/Submission/tidy_summary.csv", row.names = FALSE)
