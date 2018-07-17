I just tried to follow the steps that the project proposed

At first, I tried to merge them by directory orders using list.files(~, recursive = TRUE) but it felt that it would be long way

So I changed plan, simply get them manually and try to find their commonness. That's all. Thank you for good project!


# Getting and Cleaning Data Course Project
## Data Source
For project:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Project Goals
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Project Results
1. README.md, an overview of the projects and files
2. codebook.md, a codebook that describes variables, codes used for tidying data
3. final_set.txt, final result after tidying process
4. run_analysis.R, script used for the analysis
