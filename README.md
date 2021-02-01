# MechaCar_Statistical_Analysis
----------------------------------------------------------------------------------

## Overview of the Statistical Analysis 
Perform retrospective analysis on historical data, analytical verification of current automotive specifications and study desgin of future auto testing.  

## Data Sources and Coding File
Data for analysis was provided in two csv files ([MPG](MechaCar_mpg.csv) and [Suspension](Suspension_Coil.csv)).  

Statistical analysis was performed in R and is [attached](MechaCarChallenge.R).  

## Linear Regression to Predict MPG

![Fig_1](MechaCar_Statistical_Analysis/Screenshots/Linear_Regression_MPG.PNG)

Performed a multiple linear regression to determine the effect of the following 5 measured varialbles on fuel efficiency (measured in mpg): vehicle length, vehicle weight, spoiler angle, ground clearance and drive train (AWD or not).  

The best-fit model is described by the following:  MPG = 6.267*vehicle_length + 0.001245*vehicle_weight +0.06887*spoiler_angle 3.546*ground_clearance - 3.411*AWD - 104.

Analyzing the model's coefficients (inputs), we find that vehicle length and ground clearance have a statistically significant impact on fuel economy (MPG).  Therefore, with this knowledge, we know the slope of the model is not zero because the individual contributors to the model's slope (6.267*vehicle_length and 3.546*ground_clearance) are significant and non-zero.  

Although, the analysis with 5 predictors does model fuel economy fairly well (r-squared = 0.7149), it appears the model is not complete.  It is likely that other unmeasured predictors (variables) contribute to fuel economy as well.  

## Summary Statistics on Suspension Coils

![Fig_2](MechaCar_Statistical_Analysis/Screenshots/Suspension_central_tendancy.PNG)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 psi. The above analysis demonstrates that, with a variance of 62.29 psi, the aggregate falls within design specification.  


![Fig_3](MechaCar_Statistical_Analysis/Screenshots/Suspension_by_Lot.PNG)

Both Lot 1 and 2 meet design specification.  However, Lot 3 is well outside suspension coil specification with a variance of 170.29 psi (> 100 psi).  

## T-Tests on Suspension Coils

![Fig_4](MechaCar_Statistical_Analysis/Screenshots/ttest_PSI_allLots.PNG)

A random subset sample of 50 data points (150 full population) were obtained (Using sample_n function) to determine if there is a statistical difference between the sample mean PSI and that of the population across all manufacturing lots.  Using a one sample t-test, we obtained a p-value = 0.8831.  Assuming a significance level is the common 0.05%, the p-value (0.8831) is above the significance level.  Therefore, there is not sufficient evidence to reject the null hypothesis and there is no statistical difference between the observed sample mean and the presumed population mean.  

The same analysis was performed (below) for each individual lot as well.  

![Fig_5](MechaCar_Statistical_Analysis/Screenshots/ttest_PSI_Lot1.PNG)

Lot 1:  Assuming a significance level is the common 0.05%, the p-value (0.0004297)  is below the significance level.  Therefore, there is sufficient evidence to reject the null hypothesis. There is a statistical difference between the observed sample mean and the presumed population mean of Lot 1.  


![Fig_6](MechaCar_Statistical_Analysis/Screenshots/ttest_PSI_Lot2.PNG)

Lot 2:  Assuming a significance level is the common 0.05%, the p-value (0.08261) is above the significance level.  Therefore, there is not sufficient evidence to reject the null hypothesis.  There is no statistical difference between the observed sample mean and the presumed population mean in Lot 2.  


![Fig_7](MechaCar_Statistical_Analysis/Screenshots/ttest_PSI_Lot3.PNG)

Lot 3:  Assuming a significance level is the common 0.05%, the p-value (0.8442) is above the significance level.  Therefore, there is not sufficient evidence to reject the null hypothesis.  There is no statistical difference between the observed sample mean and the presumed population mean in Lot 3.  

## Study Design: MechaCar vs Competition
briefly summarize your interpretation and findings for the t-test results. Include screenshots of the t-test to support your summary.
