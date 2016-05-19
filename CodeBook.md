This information is about the "Getting and cleaning data" project of the coursera course.

The project start by downloading information from the given URL, to be used for the further analysis. The file is unzipped in a previously created directory "data".
Note:it is hardcoded the working directory for this project ("f:/Data Science/Curso/cleaning_data/project/CleaningDataProject"")

Then, the following information is loaded:

* y_train.txt -> it contains information about activity as trainning performed (only identifier)
* x_train.txt -> measures of trainning events 
* subject_test.txt -> contains subject identifier of test events
subject_train.txt -> contains subject identifier of training events
* X_test.txt -> measures of test events
* y_test.txt ->  it contains information about activity as test performed (only identifier)

header information is taken from features.txt file, and added to each set of measures (trainning and test)

to complete task #1, both data set are merged using UNION funtion (from dplyr package)

task #2: in order to get columns of means and standar dev: look for "mean(" or "std(" description in headers - as "features_info.txt" defines. 
the result shall be managed by "stdmeaninfo" object.

task #3: upload the label descriptions defined in "activity_labels.txt" file, which contains activityid and activitylabel. A new column shall be added to the "merfedinfo" object containgin activitylabel information.
Then, "activitylabels" will be extended to "stdmeaninfo" object.

task #4  following labels improvements are made to "stdmeaninfo" object :
* remove "-" characters
* all to lower case
* change gyro to gyroscope and acc to acceleration

task #5 subjectid is added, from mergedinfo, to the "stdmeaninfo" object. Then perform the average calculation (stored in "average" object). 
Melt() and Cast() functions, from the package "reshape", are used.
finally, the prefix "subject" is added to the variable description of columns of subjectid 


the average calculation is stored in "output.txt" file



