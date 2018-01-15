
# Set the working directory and file paths
setwd("C:/Users/Sunshine/Desktop/3. Getting and Cleaning Data/Project/")
wd <- getwd()
path0 <- paste0(wd,"/UCI HAR Dataset")
path1 <- paste0(wd,"/UCI HAR Dataset/train")
path2 <- paste0(wd,"/UCI HAR Dataset/test")

# Read the variable labels
feature <- read.table(file=file.path(path0, "features.txt"),as.is=TRUE)

# Read the activity labels
actlabel <- read.table(file=file.path(path0, "activity_labels.txt"),as.is=TRUE)
colnames(actlabel) <- c("ID","ActivityLabel")

# Read the training and test sets
trainset <- read.table(file=file.path(path1, "X_train.txt"))
testset <- read.table(file=file.path(path2, "X_test.txt"))

# Read the training and test activity class
trainact <- read.table(file=file.path(path1, "y_train.txt"))
testact <- read.table(file=file.path(path2, "y_test.txt"))

# Read the training and test subject ID
trainsub <- read.table(file=file.path(path1, "subject_train.txt"))
testsub <- read.table(file=file.path(path2, "subject_test.txt"))

# Merge the training and the test sets to create one data set
totalset <- rbind(trainset,testset)

# Merge the training and test activity classes
act <- rbind(trainact,testact)

# Merge the training and test subject ID
sub <- rbind(trainsub,testsub)

# Attach subject ID, activity class to the merged dataset
total <- cbind(sub, act, totalset)

# Appropriately label the data set with descriptive variable names.
colnames(total) <- c("SubjectID", "ActivityID",feature$V2)


# Extract only the measurements on the mean and standard deviation for each measurement.

meancol <- grep("mean()", colnames(total))
stdcol <- grep("std()", colnames(total))
sindex <- sort(c(1,2,meancol,stdcol))

selectset <- total[,sindex]

# Use descriptive activity names to name the activities in the data set
select <- merge(selectset, actlabel, by.x="ActivityID",by.y="ID")

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
grouped <- group_by(select, ActivityID,ActivityLabel,SubjectID)
select2 <- grouped %>% summarise_each(funs(mean))

# Rename the mean value of variables
names1 <- colnames(select2)
names2 <- paste("MEAN", names1[-(1:3)], sep = "_")
names <- c(names1[1:3],names2)
colnames(select2) <- names
# Output the data set into working directory
write.table(select2, file="Clean Dataset.txt",row.name=FALSE,sep="\t")

