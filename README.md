---
title: "README"
author: DLG
date: October 29, 2021
output: md_document
---


This is the README file submitted for the course project
for the "Getting and Cleaning Data" class.


The GitHub repository "Getting-and-Cleaning-Data-submission" contains the following files:

README.md
CodeBook.md
run_analysis.R (script)
tidy_summary.csv 


There are two steps in this project. First, assemble a dataset of 10299
observations of 30 Subjects doing 6 Activities for which 66 feature
variables (of means and standard deviations) are recorded. This work is
produced by Sections 1 through 6 of the "run_analysis" script file. 

Second, a dataset is created containing the average (mean) for each of
the 66 feature variables by Subject and Activity. This work is
produced by Section 7 of the "run_analysis" script file.


This work is based on the Human Activity Recognition Using Smartphones
Dataset (Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, David
Anguita. November, 2012). The following datasets are used:

  For Section 1 of the script 
    train/X_train.txt - main training dataset
    train/y_train.txt -  training Activity dataset 
    subject_train.txt - training Subject dataset
  
  For Section 2 of the script 
    test/X_test.tx -  main testing dataset
    test/y_test.txt -  testing Activity dataset
    subject_test.txt - testing Subject dataset

  For Section 4 of the script
    features.txt - feature variable labels dataset

  For Section 6 of the script
    activity_labels.txt - Activity coding dataset