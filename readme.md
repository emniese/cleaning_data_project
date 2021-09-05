---
title: "Readme for run_analysis.R"
output: html_document
---


Given the test and train data, the following sequence of steps was followed to convert the data into a tidy data set. 

The script reads each of the files: X_train.txt, X_test.txt, Y_train.txt, Y_test.txt,subject_train.txt, and subject_test.txt into dataframes titled trainx, testx, trainy, testy, sub_train, and sub_test respectively.

The column heading of the trainy and testy dataframes are changed to "Activity" since this data encodes each activity.  The column heading of the sub_train and sub_test dataframes are changed to "Subject".  

The command rbind was used to combine the training and testing data for each set described.  These were nested inside a cbind command to combine the subject, activity and X data into a single data frame.  

To convert the numerical activity data to descriptive entries, the activity.txt was downloaded and the mutate() command was used to transform the Activity column entries to descriptive text.  

Column names for the data set were the result of reading the features.txt file and using the feature names for each column from the X data set.  

A data frame containing just the feature columns ending with mean() or std() was created using the select command. 

Finally, a tidy data set computing the mean of each feature measurement for each activity for each subject was created using the group_by(subject,activity) command and then the summarize_all command.  

The tidy data set is output to a .txt file called tidydata.txt.

