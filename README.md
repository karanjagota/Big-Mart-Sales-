# Big Mart Sales (Data Hack)
<b>Aim</b> : The aim of this competition is to build a predictive model based on training data and find out the sales of each product at particular store.</br></br>
<b>My Methodology </b>: Simple 4 step solution</br> 
1. Performing EDA</br>
2. Selecting Features </br>
3. Developing Algorithm and making predictions </br>
4. Validating Predictions</br><hr>
### Step 1 : EDA 
Loading required libraries ..
```r
library(ggplot2)
library(plyr)
```
Reading training data
```r
train<- read.csv("train.csv")
test<- read.csv("test.csv")
```
Plotting Some Interesting graphs
```r
ggplot(data=train,aes(x=train$Outlet_Location_Type))+
  geom_bar(stat = "count",color="black",fill="blue",alpha=.6)+
  ggtitle("Outlet Location Type")+
  xlab("Outlate location type")+
  ylab("count")
```  
![rplot05](https://cloud.githubusercontent.com/assets/7979139/23826209/95d3ab0a-064c-11e7-9fbf-0ca96aff7fdf.png)
```r
# pie chart ...
a<- table(train$Outlet_Location_Type)[1]
for(i in c(1:3))
{
  a[i]<- table(train$Outlet_Location_Type)[i]
}
pie(a,labels = levels(train$Outlet_Location_Type),radius = 1,main = " Pie Chart")
```
