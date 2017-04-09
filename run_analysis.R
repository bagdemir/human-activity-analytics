library(dplyr)

# Read activity labels.
activityLabels <- read.csv("activity_labels.txt", sep = "", header = FALSE, col.names = c("id","activity.type"))
# Read features.
features <- read.csv("features.txt", sep = "", header = FALSE)

# Read training set subjects.
trainingSetSubjects <- read.csv("train\\subject_train.txt", sep = "", header = FALSE, col.names = c("subject.id"))

# Read training set.
trainingSet <- read.csv("train\\X_train.txt", sep = "", header = FALSE)
# Append the features to the training set as column names.
names(trainingSet) <- features[, 2]

# Read training set labels.
trainingSetLabels <- read.csv("train\\y_train.txt", sep = "", header = FALSE, col.names = c("activity.id"))

# Put training set and training set labels together.
training <- cbind(trainingSetLabels, trainingSetSubjects, trainingSet)

# Read test set subjects.
testSetSubjects <- read.csv("test\\subject_test.txt", sep = "", header = FALSE, col.names = c("subject.id"))

# Read test set.
testSet <- read.csv("test\\X_test.txt", sep = "", header = FALSE)
# Append the features to the test set as column names.
names(testSet) <- features[, 2]

# Read test set labels.
testSetLabels <- read.csv("test\\y_test.txt", sep = "", header = FALSE, col.names = c("activity.id"))
# Put test set, labels and subjects together.
test <- cbind(testSetLabels, testSetSubjects, testSet)

# [1] Merges the training and the test sets to create one data set.
dataSet <- rbind(test, training)

# [2] Extracts only the measurements on the mean and standard deviation for each measurement.
dataSet <- dataSet[, grep("(.*mean.*)|(.*std.*)|(^activity\\.id$)|(^subject\\.id$)", names(dataSet))]

# [3] Uses descriptive activity names to name the activities in the data set
dataSet <- merge(dataSet, activityLabels, by.x ="activity.id", by.y ="id", all = TRUE)

# [4] Appropriately labels the data set with descriptive variable names.

# Remove paranthesis. 
names(dataSet) <- tolower(gsub("\\(\\)", "", names(dataSet)))
# Replace dashes with dots
names(dataSet) <- gsub("\\-", ".", names(dataSet))

# [5] From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Ensure that we create a copy set of the data while excluding the activity.id - we do have activity.type now.
independentCopy <- cbind(dataSet[, -1]) 

# Summarise the copy by grouping by subject.id and activity.type on mean
y <- summarise_each(group_by(independentCopy, subject.id, activity.type), funs(mean))

write.table(y, file="result.csv",  row.name=FALSE)
