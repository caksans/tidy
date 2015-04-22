# tidy data course project
This documents an approach for analyzing human activity recognition using smartphone data.  It is in response to the course project in the "Getting and Cleaning Data" course offered by Coursera/Johns Hopkins University.

Overview:
run_analysis.R will combine the test and training data, clean up the data, and put it in a format that is more readily readable.
1.) Merges the training and the test sets to create one data set.
2.) Extracts only the measurements on the mean and standard deviation for each measurement.
3.) Uses descriptive activity names to name the activities in the data set.
4.) Appropriately labels the data set with descriptive variable names.
5.) From this data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Codebook:

Xtrain: tmp variable, representes X_train.txt

Xtest: tmp variable, represents X_test.txt

X: X dataset, combined test and train data

Ytrain: tmp variable, represents Y_train.txt

Ytest: tmp variable, represents T_test.txt

Y: Y dataset, combined test and train data

Strain: tmp variable, represents S_train.txt

Stest: tmp variable, represents S_test.txt

S: S dataset, combined test and train data

features: tmp variable, represents features.txt

mean_and_std_indeces: variable to track the indeces of the mean and standard deviation measurements.

activities: a holder variable for named activities

labeled: a combined data set of S, X, and Y data

uniqueSub: represents unique value of the S data set

numSub: represents the length of uniqueSub

numAct: represents the length of the activities variable

numCol: the length of the labled variable

final: the final cleaned, merged, labeled, tidy data set.

row: a row-counting variable

n: a counting variable for traversing the matrix

a: a counting variable for cycling through the activities variable

