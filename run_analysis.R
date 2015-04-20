# Source of data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script does the following:

# 1.) Merge the training and the test sets to form one data set.

Xtrain <- read.table("train/X_train.txt")
Xtest <- read.table("test/X_test.txt")
X <- rbind(Xtrain, Xtest)

Ytrain <- read.table("train/y_train.txt")
Ytest <- read.table("test/y_test.txt")
Y <- rbind(Ytrain, Ytest)

Strain <- read.table("train/subject_train.txt")
Stest <- read.table("test/subject_test.txt")
S <- rbind(Strain, Stest) 

# 2.) Identify the mean and standard deviation for each measurement.

features <- read.table("features.txt")
mean_and_std_indeces <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, mean_and_std_indeces]
names(X) <- features[mean_and_std_indeces, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3.) Label with descriptive activity names. 

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4.) Label the data set with activity names.

names(S) <- "subject"
labeled <- cbind(S, Y, X)
write.table(labeled, "Step4_merged_labeled.txt")

# 5.) Create a 2nd independent tidy data set with the average of each variable for each activity and each subject.

uniqueSub = unique(S)[,1]
numSub = length(unique(S)[,1])
numAct = length(activities[,1])
numCol = dim(labeled)[2]
final = labeled[1:(numSub*numAct), ]

row = 1
for (n in 1:numSub) {
    for (a in 1:numAct) {
        final[row, 1] = uniqueSub[n]
        final[row, 2] = activities[a, 2]
        tmp <- labeled[labeled$subject==n & labeled$activity==activities[a, 2], ]
        final[row, 3:numCol] <- colMeans(tmp[, 3:numCol])
        row = row+1
    }
}
write.table(final, "Step5_avg_data_set.txt")



