# MechaCar_Statistical_Analysis
----------------------------------------------------------------------------------

## Overview of the Statistical Analysis 
Citi Bike is a privately owned public bicycle sharing system serving the New York City boroughs of the Bronx, Brooklyn, Manhattan, and Queens, as well as Jersey City, New Jersey. The intent of this analysis is to study the NYC ride sharing service to determine the feasibility of a similar program in Des Moines.  

## Data Sources
Data for analysis was obtained from the Citi Bike website. Slight data manipulation was performed using [python code](NYC_CitiBike_Challenge.ipynb) in Juptyer Notebook.  

## Data Sources
[Online Tableau Story](https://public.tableau.com/profile/mike.hankinson#!/vizhome/Module14_Challenge_Deliverable2/StoryCitiBike?publish=yes)


## Results


![Fig_1](Pictures/6Map.PNG)
<br>
<br>
Although not the only bicycle sharing business in the area, as shown above, Citi Bike is ubiquitous within the New York City boroughs.  Citi Bike began operations in the spring of 2013 with over 300 bike stations.  The service has experienced tremendous growth over its first 8 years now operating with over 1,000 stations, 17,000 bicycles and a daily ridership of nearly 50,000 people.  
<br>
<br>
<br>
![Fig_2](Pictures/7PieGender.PNG)
<br>
<br>
In August of 2019, Citi Bike facilitated over 2.3 million rides. Surveys of nearly 2/3 of the riders indicate a ridership of both men and women.  
<br>
<br>
<br>
![Fig_3](Pictures/1CheckoutTimeAllRiders.PNG)
<br>
<br>
Citi Bike offers a number of rider plans including annual, weekday, daily and single-ride passes. Note that the day-pass allows for 24-hour rental.  The graph above shows rentals can last from less than an hour to the 24-hour limit, with most typical rides lasting 4-6 hours.     
<br>
<br>
<br>
![Fig_4](Pictures/2CheckoutTimeGender.PNG)
<br>
<br>
The above graph breaks out checkout time by gender and produces the same rental time trend across gender.  However, the number of bikes allocated to males is 3:1 at peak trip duration of 4-6 hours.  
<br>
<br>
<br>
![Fig_5](Pictures/3TripsByWeekdayPerHour.PNG)
<br>
<br>
The heat map shows during weekdays, rentals are concentrated during rush hours (6:00am - 9:00am and 4:00pm-8:00pm) as customers travel to and from work.  

Weekend customers tend to checkout bikes throughout the day, concentrated fairly evenly between 9:00am - 8:00pm.
<br>
<br>
<br>
![Fig_6](Pictures/4TripsByWeekdayPerGender.PNG)
<br>
<br>
Rental time trends continue across genders for both weekday and weekend riders.
<br>
<br>
<br>
![Fig_](Pictures/5TripsByGenderByWeekday.PNG)
<br>
<br>
The volume of Annual Membership riders is significantly greater than that for Day Pass riders weeklong.  

The volume of both male and female Subscribers stays fairly consistent throughout the week.  

Although male riders are predominant, female riders are common as well.   
<br>
<br>
## Summary
This analysis presents the following in visualization form

* Length of time that bikes are checked out for all riders and genders
* Number of bike trips for all riders and genders for each hour of each day of the week
* Number of bike trips for each type of user and gender for each day of the week.

Further analysis is needed to glean success factors from the data.  Once identified, use them to evaluate potential in Des Moines.  

Additional information needed includes
* Asset Utilization:  What percentage of bikes are rented at any given time? Determine how to balance inventory across stations.  
* Customer Age: Complete and age analysis similar to the one completed for gender.  Along with demographic data, this will enable marketing efforts.  
