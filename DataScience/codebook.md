# Codebook for tidy samsung gear data

## Dataset

The data obtained using smartphone's accelerometer and gyroscope 

## Variables

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

Prefix of 't' represents time, while 'f' represents frequency. Suffix of 'XYZ' represents the three coordinate axes, while 'Mag' represents magnitude. 'Acc' represents the accelerometer, while 'Gyro' represents the gyroscope.

They are separated as mean, std, max, min, and so on.

## Transformation

Load 'tidyverse' which includes many packages
Load data which would be used
Name columns. If data are not loaded as wanted, make them as wanted using separate or other funtions
Bind them
Extract ids of subjects, numbers that show features, columns which show mean or standard deviation of something
Tidy column names
Summarise using mean function grouped by features and subjects
