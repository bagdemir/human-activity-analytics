# Human Activity Analytics According to Smartphone Tracking Data

Tidy Data R Script for 
 `Human Activity Recognition Using Smartphones Dataset`

Version  1.0
Author   Erhan Bagdemir <erhan@bagdemir.com>

## Usage

Use the script "run_analysis.R" to clean up data "Human Activity 
Recognition Using Smartphones Dataset". The original resource can 
be located: [Download - ZIP](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

After extracting the data into your workspace, to run the script, 
make a copy of it in your workspace and source it:
	source('run_analysis.R')

which produces the output result.csv.

## The Output

The output comprises independent tidy data set with the average of 
each variable for each activity and each subject.

A code book can be found on the Git repository: [Download -PDF](https://github.com/bagdemir/human-activity-analytics/blob/master/code-book.pdf) which explains the features in results.

The data is an example of the tidy data in regards with:
* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table.

