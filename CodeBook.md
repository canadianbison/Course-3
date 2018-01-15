Data Source
-----------

The clean dataset is derived from a dataset that is collected from the
accelerometers from the Samsung Galaxy S smartphone.

A full description of the original dataset is available here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Data Variables
--------------

The clean dataset contains the following 82 variables:

-   ActivityID: "Identifier of activity class"
-   ActivityLabel: "Description of activity" Six activities (WALKING,
    WALKING-UPSTAIRS, WALKING-DOWNSTAIRS, SITTING, STANDING, LAYING)
    performed by participants wearing a smartphone (Samsung Galaxy S II)
    on the waist.

-   SubjectID: "Identifier of the participant"

All other variables with prefix MEAN are mean values of the selected
feature variables grouped by ActivityID and SubjectID for the combined
train and test dataset.

Only the variables of the mean and standard deviation measurement of the
feature vector are selected, i.e. feature variable with a name that
contains 'mean()' and 'std()'.

Please refer to the features-info.txt in the original dataset for
detailed definitions of the 561-feature vector with time and frequency
domain variables.
