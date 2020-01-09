# CodeBook

Source information

The data used is on that file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the information:

We are working with information from an experiment that includes:

* 30 subjects 
* 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* 561 features (see features.txt and features_information.txt)

The information has been clasified on test and train so we get separate files for this two options 

Files description

 * General information
	* activity_labels.txt: codes and names for the 6 activities
	* features.txt: codes and names for the 561 features
	* features_info.txt: technical description of the features and how the values has been mesured and collected
 * Test information
	* x_test.txt: 2947 measures for 561 features
	* y_test.txt: 2947 activities id related to the mesures on x_test.txt
	* subject_test.txt: 2947 subjects id related to the measures on the file x_test.txt
 * Train information
	* x_train.txt: 7352 measures for 561 features
	* y_train.txt: 7352 activities id related to the mesures on x_train.txt
	* subject_train.txt: 7352 subjects id related to the measures on the file x_train.txt


Getting and processing information

* train_main_info: data.frame with information from x_train.txt
	* test_main_info:  data.frame with information from x_test.txt
	* main_info: bind of the two main info files

	* train_activity_info: data.frame with the information from y_train.txt
	* test_activity_info: data.frame with the information from y_test.txt
	* activity_info: bind of the two activity data frames

	* train_subject_info: data.frame with the information from subject_train.txt 
	* test_subject_info: data.frame with the information from subject_test.txt
	* subject_info: bind of the two subject data frames

	* activity_labels: data.frame with the information from activity_labels.txt
	* features:  data.frame with the information from features_info.txt

Required actions:

1 Merges the training and the test sets to create one data set
  - main_info will contain the data set with test and trainining information

2 Extracts only the measurements on the mean and standard deviation for each measurement
  - mean_and_std will contain the information for mean and standard deviation

3 Uses descriptive activity names to name the activities in the data set
  - meanstd_activities will contain the information for mean and standar deviation plus a new column on the begining
  with the descripton of related the activity

4 Appropriately labels the data set with descriptive variable names
  - meanstd_activities will contain the same information as in step 3 but the colnames will be more descriptives

5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

- The file tidy_information.txt will be generated on the working directory containing the mean of each variable  group by subject and activity
