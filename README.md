# CleaningDataProject

Intro
-----
this project intends to solve the problem presented as the final exercise of the Coursera "getting and Cleannig data" course.

description
-----------

* Inpunt data:

it is hardcoded the working directory for this project

the input data is found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

after download it an unzip it, the analysis is ready to start.

Header description of xTrain and xTest measures shall be taken from "features.txt" file, 

Note: input data shall not be uploaded to GitHub, due to its size (only results will be uploaded)

* Analysis:

1) a new column, called "kindmeasures", will be added to the measures before merging the measures indicating if the measure corresponds to train or test. The possible values are TEST or TRAIN. 
Also "activityid shall be added, containing the id that is defined in "y_test.txt" and "ytrain.txt", and subjectid (available in "subjecttest.txt and subjecttrain.txt")

The merge shall be performed using UNION funtion, provided in the "dplyr" package.

2) in order to get columns of means and standar dev: look for "mean(" or "std(" description in headers - as "features_info.txt" defines. 
the result shall be managed by "stdmeaninfo" object.

3) upload the label descriptions defined in "activity_labels.txt" file, which contains activityid and activitylabel. A new column shall be added to the "merfedinfo" object containgin activitylabel information.
Then, "activitylabels" will be extended to "stdmeaninfo" object.

4)  following labels improvements are made:
* remove "-" characters
* all to lower case
* change Gyro to Gyroscope and acc to acceleration

5) add the subjectid, from mergedinfo, to the "stdmeaninfo" object. Then perform the average calculation (stored in "average" object). Melt() and Cast() functions, from the package "reshape", are used.
finale, the prefix "subject" is added to the variable description of columns of subjectid 

6) the variable average is written to "output.txt" file, in order to be uploaded as part of the project.






