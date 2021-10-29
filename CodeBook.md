---
title: "CodeBook"
author: DLG
date: October 29, 2021
output: md_document
---


This work is dervied from the Human Activity Recognition Using
Smartphone Dataset (Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto,
David Anguita. November, 2012), available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The data consists of normalized, bounded (-1,1) measurements on 561
feature variables derived from smartphone-based monitoring of 30 subjects
performing each of 6 activities. There are multiple observations for each
subject and activity. The data are segregated into two groups, one for
training and the other testing. The training dataset contains 7352
observations on 21 subjects. The testing dataset contains 2947
observations on 9 subjects. 

Detailed information is available in the README file and codebook (features_info.txt) provided with the data.

The following datasets are used for this project:

  train/X_train.txt - main training dataset
  train/y_train.txt -  training Activity dataset 
  subject_train.txt - training Subject dataset
  test/X_test.tx -  main testing dataset
  test/y_test.txt -  testing Activity dataset
  subject_test.txt - testing Subject dataset
  features.txt - feature variable labels dataset
  activity_labels.txt - Activity coding dataset
  
For this project, 66 feature variables (of means and standard deviations)
were selected. 

NOTE: no transformations or cleanup of the data provided were required.