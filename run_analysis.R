

# Download

if(!file.exists("./data")){dir.create("./Data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,  "./Data/20Dataset.zip", mode="wb") 


# Unzip the file

if(!file.exists("./Data/UCI HAR Dataset")){
  unzip("./Data/20Dataset.zip", files = NULL, exdir="./Data")
}



# Get the info
train_main_info <- read.table("./Data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
test_main_info <- read.table("./Data/UCI HAR Dataset/test/X_test.txt", header=FALSE)

main_info <-rbind(train_main_info, test_main_info)

train_activity_info <- read.table("./Data/UCI HAR Dataset/train/y_train.txt", header=FALSE)
test_activity_info <- read.table("./Data/UCI HAR Dataset/test/y_test.txt", header=FALSE)

activity_info <-rbind (train_activity_info,test_activity_info)


train_subject_info <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
test_subject_info <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
subject_info <-rbind (train_subject_info,test_subject_info)


activity_labels <- read.table("./Data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./Data/UCI HAR Dataset/features.txt")


# 1 Merges the training and the test sets to create one data set.
main_info <-rbind(train_main_info, test_main_info)
names(main_info) <- features[,2]

# 2 Extracts only the measurements on the mean and standard deviation for each measurement

# We get the indices of the features for mean and std. the description should include mean() or std() 
# We need to scape the "(" and ")" characters. 

selection <-grep("mean\\(\\)|std\\(\\)", features$V2)
# with the indices we select the right columns on the data.frame
mean_and_std<-main_info [,selection]



#  3 Uses descriptive activity names to name the activities in the data set
# we generate a new data.frame with the list of all the activities and their descriptions

activity_info_index <- cbind(activity_info, index(activity_info))
names(activity_info_index)[2]<-"IndexValue"
activity_info_and_descriptions<- merge( activity_labels, activity_info_index,by.x="V1", by.y="V1")
#we arrange the data.frame by IndexValue
activity_info_and_descriptions<- arrange(activity_info_and_descriptions, IndexValue)


# we add the descriptions to mean_and_std

meanstd_activities <- cbind(activity_info_and_descriptions$V2, mean_and_std) 
#we rename the column that contain the activity description
names(meanstd_activities) [1]<- "Activity"


# 4 Appropriately labels the data set with descriptive variable names.


names(meanstd_activities) <- sapply(colnames(meanstd_activities), function(x) {sub("\\(\\)","",x)})
names(meanstd_activities) <- sapply(colnames(meanstd_activities), function(x) {sub("^t","Time_",x)})
names(meanstd_activities) <- sapply(colnames(meanstd_activities), function(x) {sub("^f","Frecuency_",x)})
names(meanstd_activities) <- sapply(colnames(meanstd_activities), function(x) {sub("-mean","_Mean_value",x)})
names(meanstd_activities) <- sapply(colnames(meanstd_activities), function(x) {sub("-std","_Standard_deviation",x)})

# 5 From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable for each activity and each subject.

# we add the subject information to the dataset
meanstd_activities <- cbind(subject_info, meanstd_activities) 
names(meanstd_activities) [1]<- "Subject"

tidy_dataset = meanstd_activities %>%  group_by( Subject, Activity) %>% summarise_all(funs(mean))
write.table(tidy_dataset, "./Data/tidy_information.txt", sep = ",", row.names = FALSE)  




