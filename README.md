# Getting and Cleaning data Course Project

There are three main files for the project:
* run_analysis.R. The R script to generate the tidy data set.
* README.md. Information about the project.
* CodeBook.md. Describes variales, the data, and transormations to clean up the data.
 project  in a single R script file called "run_analysis.R"

## run_analysis.R Instructions
The script defines the function run_analysis().
This function creates a csv file "tidydata.csv" in the working directory with a tidy data set with the average of each *mean and standard deviation* variable for each *activity* and each *subject*.
The function also returns the dataset.

The function needs the Samsung data (folder "UCI HAR Dataset") to be in the working directory to work.


