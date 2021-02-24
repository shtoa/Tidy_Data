# run_analysis.R

This project uses a script  called "run_analysis.R" in order to Tidy a dataset of Samsung S gyroscopic data.


Input files (from cwd): 

TEST (loc = "./UCI HAR Dataset/test"):

- "./train/X_train.txt"
- "./train/y_train.txt"
- "./train/subject_train.txt"

TRAIN (loc = "./UCI HAR Dataset/train"):

- "./test/X_test.txt"
- "./test/y_test.txt"
- "./test/subject_test.txt"


FEATURES (loc = "./UCI HAR Dataset"):

- "features.txt": features of the dataset

ACTIVITY LABELS (loc = "./UCI HAR Dataset):

- "activity_labels.txt": labels for the activities (y-classifier)

Output files: Generates data frame for the average of each variable for each activity and each subject

Methodology: First the files are read. Then a defined function clean() is called that maps the activity label classifier to y, binds the columns of x,y and the subject as well as subseting the columns that contain mean or std measurements. The function is preformed on the testing and training datasets which are then merged to form one complete dataset. Then this dataset is grouped by activity and subject to give the final dataset for the averages for each column written to a table in the local directory under the name "data.txt".


# Nota Bene

The script requires the following packages in order to function:

- tidyverse
- data.table

The data should be placed under the current workin directory in order for the script to run.
