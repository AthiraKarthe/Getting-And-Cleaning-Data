library('dplyr')

features <- read.table("D:/assignment/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("D:/assignment/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("D:/assignment/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("D:/assignment/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("D:/assignment/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("D:/assignment/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("D:/assignment/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("D:/assignment/UCI HAR Dataset/train/y_train.txt", col.names = "code")

X <- rbind(x_test,x_train)
Y <- rbind(y_test,y_train)
Subject <- rbind(subject_test,subject_train)
Merged_Data <- cbind(Subject,X)
Merged_Data <- cbind(Merged_Data,Y)
TidyData=Merged_Data %>% select(contains("subject"),contains("code"),contains("mean"), contains("std"))

names(Merged_Data)
names(TidyData)

TidyData$code<-activities[TidyData$code,2]


names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

names(TidyData)

FinalData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
FinalData
