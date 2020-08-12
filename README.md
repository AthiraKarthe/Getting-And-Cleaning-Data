# Getting-And-Cleaning-Data
After downloading the zip file and extracting it, the following steps were carried out:

1. Each File wasa read in separate variables x_train, x_test, y_train, y_test, subject_train, subject_test, activities, features. All these data were put together into a single dataframe called Merged_Data.

2. Inorder to select only the mean and standard deviation measures along with the subject and activities code, a select query was framed and a subset was returned to TidyData variable.

3. For the descriptive activity names instead of activity codes, the activity table is used and replaced accordingly.

4. For better understandable and readable column names, the abbreviations were replaced.

5. The dataset from the previous steps were grouped by subject and activity and stored in a separate dataframe-"FinalData" with their average.
