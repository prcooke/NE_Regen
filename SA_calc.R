## I used imaris generate surfaces on the axons for the NE regeneration project. 
## Each data collection must be saved into an individual folder for each animal and labeled W__.csv
## The following function will take create a dataframe containing the week, the total SA,
## and the normalized SA of axons in each week. Missing weeks will be filled with NA values.
## Input is the path to the folder containing the csv files.

# Input file path to subject folder
SA_calc <- function(subject_folder) {
    # Get the list of all CSV files in the subject's folder
    csv_files <- list.files(subject_folder)
    
    # Create a sequence of week numbers
    week_numbers <- seq(-2, 24, by = 2)
    
    # Iterate over the week numbers and add the data to the subject's data frame
    for (week_number in week_numbers) {
        # Check if the CSV file for the week exists
        csv_file <- paste0("W", week_number, ".csv")
        if (file.exists(file.path(subject_folder, csv_file))) {
            # If the CSV file exists, load it
            weekly_data <- read.csv(file.path(subject_folder, csv_file), skip = 3)
            
            # Calculate the sum of the 'Area' column
            total_sa <- sum(weekly_data$Area)
            
        } else {
            # If the CSV file does not exist, fill in the total.sa value with NA
            total_sa <- NA
        }
        
        # Add the week and total.sa values to the subject's data frame
        subject_data <- rbind(subject_data, data.frame(week = week_number, total.sa = total_sa))
    }
    
    # Iterate over the week numbers and calculate the normalized surface area
    for (i in 1:14) {
        subject_data$norm.total.sa <- subject_data$total.sa / subject_data$total.sa[2]
    }
    
    # Return the subject's data frame
    return(subject_data)
}