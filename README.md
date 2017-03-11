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
a<- table(train$Outlet_Location_Type)[1]
for(i in c(1:3))
{
  a[i]<- table(train$Outlet_Location_Type)[i]
}
pie(a,labels = levels(train$Outlet_Location_Type),radius = 1,main = " Pie Chart")
```
![rplot06](https://cloud.githubusercontent.com/assets/7979139/23826303/ac295218-064e-11e7-916f-3d64e67c737e.png)

<b>Item Visibility Vs Item Outlet Sales </b>
```r
ggplot(data=train,aes(x= train$Item_Visibility,y=train$Item_Outlet_Sales))+
  geom_point(aes(colour=train$Item_Type))+
  ggtitle("Item Visibility Vs Outlet Sales(Item Type)")+
  xlab("Item Visibility")+
  ylab("Outlet Sales")
```
![rplot07](https://cloud.githubusercontent.com/assets/7979139/23826311/ccd08856-064e-11e7-8893-748f1df5c7b3.png)

<b>Item Type Vs Item Fat Content </b>

```r 
ggplot(data = train,aes(x= train$Item_Type))+
  geom_bar(stat = "count",aes(fill=Item_Fat_Content))+
  ggtitle("Item Type Vs Item Fat Content")+
  xlab("Item Type")+
  theme(axis.text.x = element_text(angle = 75,hjust = 1))
```  
![rplot08](https://cloud.githubusercontent.com/assets/7979139/23826314/f00f6936-064e-11e7-967c-2ab99725022e.png)

<b>Item Weight Vs Item Outlet Sales Vs Item Type</b>
```r
ggplot(data=train,aes(x= train$Item_Weight,y = train$Item_Outlet_Sales))+
  geom_point(color="blue",alpha=.4)+
  ggtitle("Item Weight Vs Outlet Sales Vs Item Type")+
  xlab("Item Weight")+
  ylab("Outlet sales")+
  facet_wrap(~train$Item_Type)
```
![rplot09](https://cloud.githubusercontent.com/assets/7979139/23826315/057e98be-064f-11e7-89e7-d3e2e4d1b4ae.png)

<b>Item Type Vs Item Weight </b>

```r
ggplot(data=train,aes(train$Item_Type,train$Item_Weight))+
  geom_boxplot(color="black",fill="green",alpha=.6)+
  ggtitle("BoxPlot: Item Type vs Item Weight")+
  labs(x="Item Type",y="Item Weight")+
  theme(axis.text = element_text(angle = 75,hjust=1))
```
![rplot10](https://cloud.githubusercontent.com/assets/7979139/23826323/1cbdd954-064f-11e7-9e72-31b6e7c7fec6.png)

<b>Correlation Matrix Between Numeric Variables </b>
```r
corelation_test<- train[,c(2,4,6,12)]
colnames(corelation_test)<- c("IW","IV","IMRP","IOS")
get_cor<-cor(na.omit(corelation_test))
corrplot(get_cor,method = "number")
```
![rplot11](https://cloud.githubusercontent.com/assets/7979139/23826328/3e545282-064f-11e7-9565-9a4960a2f8d9.png)
