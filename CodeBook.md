# run_analysis CodeBook

The run_analysis.R script generates a tidy data set with the identifiers:
1. "activity" a factor describing the activity the subject is performing. 
       It can be laying, sitting, standing, walking, walking_downstairs and walking_upstairs.
2. "subject", person whose activity was sampled.

The variables in the tidy data set are the average value among all the samples collected for the selected activity and subject. 

## Information about the variables/features

The features selected for this data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerk_xyz and tbodygyrojerk_xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc_xyz, fbodyaccjerk_xyz, fbodygyro_xyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

'_xyz' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

* mean: Mean value

* std: Standard deviation
