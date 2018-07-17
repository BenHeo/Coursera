################## First I tried to do it like these
# input file names in variable
#trainfiles <- list.files('./train', recursive = TRUE)
#trainfiles
#
#testfiles <- list.files('./test', recursive = TRUE)
#testfiles

# use for loop to merge
#for(i in 1:12){
#  #cat(trainfiles[i], testfiles[i])
#  mergedfilename <- gsub('_train.txt','',trainfiles[i])   #for new filename which is common for both files
#  
#  }
################## And realized that it's not what the data means
################## So changed

library(tidyverse)
# load basic infos & train data
activelabel <- read_table('./activity_labels.txt', col_names = FALSE)
features <- read_table('./features.txt', col_names = FALSE)
sub_train <- read_table('./train/subject_train.txt', col_names = FALSE)
x_train <- read_table('./train/x_train.txt', col_names = FALSE)
y_train <- read_table('./train/y_train.txt', col_names = FALSE)

# It was 561 X 1, so split it
features <- separate(features, X1, c('featureNum', 'featmeasure'), ' ')
unique(y_train) # found that it is same as activeNum of activelabel by checking dimensions

colnames(activelabel) <- c('activeNum', 'activeType')
colnames(sub_train) <- 'subId'
colnames(x_train) <- as.matrix(features[,2])  # it didn't work when it is tibble
colnames(y_train) <- 'activeNum'

train_set <- bind_cols(y_train, sub_train, x_train)

# load test data same as train data
sub_test <- read_table('./test/subject_test.txt', col_names = FALSE)
x_test <- read_table('./test/x_test.txt', col_names = FALSE)
y_test <- read_table('./test/y_test.txt', col_names = FALSE)
colnames(sub_test) <- 'subId'
colnames(x_test) <- as.matrix(features[,2])
colnames(y_test) <- 'activeNum'

test_set <- bind_cols(y_test, sub_test, x_test)
total_set <- bind_rows(train_set, test_set)
namesave <- colnames(total_set) # if something goes wrong, i will use this
avgstd_set <- total_set[,grepl('mean|std|subId|activeNum', colnames(total_set))]
colnames(avgstd_set)

avgstd_set <- inner_join(avgstd_set, activelabel)
avgstd_set <- avgstd_set[, c(1, 82, 2:81)] # change order of columns
colnames(avgstd_set) <- gsub('\\(|\\)','',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('\\-','_',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('^t','Time',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('^f','Freq',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('Acc','Accelerate',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('Mag','Magnitude',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('BodyBody','Body',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('mean','Mean',colnames(avgstd_set))
colnames(avgstd_set) <- gsub('std','Std',colnames(avgstd_set)); colnames(avgstd_set)

final_set <- avgstd_set %>% group_by(activeNum, activeType, subId) %>% summarise_all(mean) # summarise_all should be used, not summarise
final_set
write.table(final_set, 'final_set.txt', row.names = FALSE)
