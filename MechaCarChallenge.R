#=====================================================
# Module 15 Challenge: Using R and Statistics
#=====================================================

# Deliverable 1
#-----------------------------------------------------
#Load dplyr
library(tidyverse)

#read/load csv file
MechaCar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Linear Regression and Summary 
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df)) #generate summary statistics


# Deliverable 2
#-----------------------------------------------------
#read/load csv file
Suspension_df <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Create SUmmary DF of Central Tendency
Total_summary <- Suspension_df%>%summarize(mean(PSI),median(PSI), var(PSI), sd(PSI), .groups = 'keep') 

# Create SUmmary DF of Central Tendency by Lot
Lot_summary <- Suspension_df%>%group_by(Manufacturing_Lot)%>%summarize(mean(PSI),median(PSI), var(PSI), sd(PSI), .groups = 'keep') 


# Deliverable 3
#-----------------------------------------------------
# 1. determine if the PSI across all manufacturing lots is statistically different from the population 
#    mean of 1,500 pounds per square inch

sample_PSI <- Suspension_df %>% sample_n(50) #Obtain random sample of PSI across all lots (50 of 150 data points)

t.test(sample_PSI$PSI,mu=mean(Suspension_df$PSI))  #compare sample versus population means



# 2. Write 3 scripts using ttest() and subset() to
#    determine determine if PSI for each lot is statistically different from the population 
#    mean of 1,500 pounds per square inch

# Lot 1:  compare sample versus population means
t.test(subset(sample_PSI, Manufacturing_Lot == "Lot1")$PSI,mu=mean(Suspension_df$PSI))


# Lot 2:  compare sample versus population means
t.test(subset(sample_PSI, Manufacturing_Lot == "Lot2")$PSI,mu=mean(Suspension_df$PSI))#compare sample versus population means

# Lot 3:  compare sample versus population means
t.test(subset(sample_PSI, Manufacturing_Lot == "Lot3")$PSI,mu=mean(Suspension_df$PSI))#compare sample versus population means
