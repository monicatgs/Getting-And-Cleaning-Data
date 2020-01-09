# Getting-And-Cleaning-Data

This proyect takes information from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The proyect include. 

* Script file run_analysis.R  that preforms the next steps:
	* Download the information in the working directory if not exist. 
	* Unzip the file downloaded
	* Get the information required from the files to local variables
	* Collect the information from training and test together 
	* Filter the information to get only the data of mean and standard deviation for each measurement
	* Names the activities with descriptive names
	* Names the features (column names) more descriptively
	* Create a tidy dataset with the mean for each feature by subject and activity
	* Write the information on the tidy dataset to the file tidy_information.txt, on the working directory 

* File CodeBook.md describing variables, data and transformations done. 
* File tidy_information.txt with the tidy information: mean for each feature by subject and activity
