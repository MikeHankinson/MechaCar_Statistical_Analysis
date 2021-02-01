#=====================================================
# Module 15: Using R and Statistics
#=====================================================

#read/load csv file
#-----------------------------------------------------
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)


#read/load json data
#-----------------------------------------------------
library(jsonlite)
demo_table2 <- fromJSON("demo.json")



#selecting data
#-----------------------------------------------------
demo_table[3,3]
demo_table2$"Price"[3]
demo_table$"Vehicle_Class"[2]
demo_table2$"price"[3]

#filtering data
#-----------------------------------------------------
filter <- demo_table[demo_table$"Total_Miles" < 15000,]
filter <- demo_table[demo_table$Total_Miles < 15000,]


#sampling data
#-----------------------------------------------------
num_rows <- 1:nrow(demo_table)
demo_table[sample(1:nrow(demo_table), 3),]


#Transform data / pipe operator %>% (using dplyr library)
#-----------------------------------------------------
library(tidyverse)

data2<-data.frame(a=2:4, b=5:7) %>% mutate(c = a + b) #mutate example

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 
  #add columns to original data with mutate()


#Group Data / group_by() and summarize()
#-----------------------------------------------------
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),
    .groups = 'keep') #create summary table

summarize_demo <- demo_table2 %>% group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') 
  #create summary table with multiple columns



#Reshape Data / gather() and spread() (using tidyr library)
#-----------------------------------------------------
demo_table3 <- read.csv('demo2.csv', check.names = F, stringsAsFactors = F) #read in new file

library(tidyr)


#Build a Bar Plot Using ggplot() (Module 15.3.)
#-----------------------------------------------------
plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot  --> geom_bar()


mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) #import dataset into ggplot2
plt + geom_col() #plot a bar plot  --> geom_col()


#Add Formatting Functions (Module 15.3.3)
#-----------------------------------------------------
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") 
#plot bar plot with labels xlab() and ylab()


plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") +    
  theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees


#Line Plot / Scatter Plot (Module 15.3.4)
#-----------------------------------------------------
#Line
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels


#Scatter
plt <- ggplot(mpg,aes(x=displ,y=cty)) #import dataset into ggplot2
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") #add scatter plot with labels


#AES() customization on scatter - with 1 aesthetic (color=class)
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") #add scatter plot with labels


#AES() customization on scatter with 2 aesthetics (color=class, shape=drv)
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive") #add scatter plot with multiple aesthetics


#Box Plot (Module 15.3.5)
#-----------------------------------------------------
plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot
#for boxplots, must have a numeric vector as the y-value (hwy)


plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot and rotate x-axis labels 45 degrees


#Heat Map (Module 15.3.6)
#-----------------------------------------------------
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heatmap with labels


mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + #add heatmap with labels 
  theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #rotate x-axis labels 90 degrees
  

#Add Layers to Plots (Module 15.3.6)
#-----------------------------------------------------
#There are two types of plot layers:
  
#  1. Layering additional plots that use the same variables and input data as the original plot
#  2. Layering of additional plots that use different but complementary data to the original plot


#Cool --- overlays scatter plot ontop of boxplot!!
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
  theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
  geom_point() #overlay scatter plot on top


#scatter plot with error bars
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars



#Faceting (15.3.7)
  # Often when our data is in a long format, we want to avoid visualizing all data within a single plot. 
  # Rather, we want to plot all our measurements but keep each level (or category) of our grouping variable separate.   # This process of separating out plots for each level is known as faceting in ggplot2.

#1. convert wide to long format (combining city and highway columns into 1)
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) 
head(mpg_long)

#2.import dataset into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) 

#3. add boxplot with labels rotated 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) 


  #The produced boxplot is optimal for comparing the city versus highway fuel efficiency for each manufacturer, 
  #but it is more difficult to compare all of the city fuel efficiency across manufacturers. 
  #One solution would be to facet the different types of fuel efficiency within the visualization using 
  # the facet_wrap() function.

  #The facets argument expects a list of grouping variables to facet by using the vars() function.
  #to facet our previous example by the fuel-efficiency type....



#1. #import dataset into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) 

#2. #create multiple boxplots, one for each MPG type (facet wrap)
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + 
  
 #3. #rotate x-axis labels
 theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") 


#####Confusing as hell!!!#####


#Sample Versus Population Dataset (15.6.1)
#-----------------------------------------------------

population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot


#One Sample t-test(15.6.2)
#-----------------------------------------------------
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) 
#compare sample versus population means



#Two Sample t-test(15.6.3)
#-----------------------------------------------------

sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples


#Two Sample t-test to compare samples (15.6.4)  --pair t-test
#-----------------------------------------------------
#Compares two sample, each from a different population

mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008

t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples


#The ANOVA Test(15.6.6)  --  Analysis of Variance
#-----------------------------------------------------
# compares the means across more than two samples or groups
#a. A one-way ANOVA is used to test the means of a single dependent variable across a single 
# independent variable with multiple groups. (e.g., fuel efficiency of different cars based on vehicle class).
#b.wo-way ANOVA does the same thing, but for two different independent variables (e.g., vehicle braking 
# distance based on weather conditions and transmission type). 

mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

summary(aov(hp ~ cyl,data=mtcars_filt)) #compare means across multiple levels


#Correlation - r (15.7.1)  (Pearson coefficient)
#-----------------------------------------------------
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot

cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient



#Linear Regression (15.7.2)  
#-----------------------------------------------------

lm(qsec ~ hp,mtcars) #create linear model
#dataset = mtcars
#is qsec and function of hp


# apply a summary function to obtain additional information....
summary(lm(qsec~hp,mtcars)) #summarize linear model

# Now that we have slope and intercept, we can plot the linear model over our scatter plot:
model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] #determine y-axis values from linear model

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model
  

#Multi-Linear Regression (15.7.3)  
#-----------------------------------------------------

lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model

summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics


# Category Complexities (15.8.1)  Chi-Square
#-----------------------------------------------------



