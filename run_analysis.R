#Set wd to dataset
setwd("./UCI HAR Dataset")

#Reading in necessary data sets:

#Features
features <- fread(file = "features.txt")

#Activity Labels
activity_labels <- fread(file = "activity_labels.txt")

#Train
x_test <- fread(file = "./train/X_train.txt")
y_test <- fread(file = "./train/y_train.txt")
subject_test <- fread(file = "./train/subject_train.txt")

#Test
x_train <- fread(file = "./test/X_test.txt")
y_train <- fread(file = "./test/y_test.txt")
subject_train <- fread(file = "./test/subject_test.txt")


#Create function to clean individual Train / Test sets:
clean <- function(x,y,subject,n = features, activity = activity_labels){
        #Change y variable to activity:
        y <- mapvalues(y[[1]], activity[[1]] , activity[[2]])
        
        #Bind columns together
        dataset <- cbind(x,y,subject)
        
        #Name the columns
        names(dataset) <- c(n[[2]], "activity", "subject")
        columns <- c(grep("mean\\(\\)|std()", names(dataset), value = TRUE),"activity", "subject")
        
        #Store mean and std date in subset and return
        dataset <- subset(dataset, select = columns)
}

#Creates Clean Data

clean_train <- clean(x_test, y_test, subject_test)
clean_test <- clean(x_train, y_train, subject_train)

#Generates the final tidy dataframe
data <- rbind(clean_train, clean_test)

#Generates data frame for the average of each variable for each activity and each subject
activity_subject_data <- summarise_all(group_by(data, activity, subject), mean)

#Tidy the data
activity_subject_data <- pivot_longer(activity_subject_data,cols=3:length(names(activity_subject_data)), names_to = "measurement", values_to = "mean value")

#Set wd to previous directory
setwd("../")

#Writes Table for the average of each variable for each activity and each subject
write.table(activity_subject_data,"data.txt",col.names = T, row.name = F)