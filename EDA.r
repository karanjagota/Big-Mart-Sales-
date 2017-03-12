
# loading libraries ...
library(ggplot2)
library(plyr)
library(corrplot)

# reading files in dataframe ... 
train<- read.csv("train.csv")
test<- read.csv("test.csv")

# View / Initial look at variables ... 
str(train) # ignoring the ID , 6 factor variables wheareas 5 numerical variables .. 
View(train) 
summary(train)

# getting number of rows and coloumn ... 
nrow(train) #8523
ncol(train) # 12

# ---------Basic EDA ----------------

#Outlet Location Type .. 
table(train$Outlet_Location_Type)

# Bar Graph ...
ggplot(data=train,aes(x=train$Outlet_Location_Type))+
  geom_bar(stat = "count",color="black",fill="blue",alpha=.6)+
  ggtitle("Outlet Location Type")+
  xlab("Outlate location type")+
  ylab("count")


# pie chart ...
a<- table(train$Outlet_Location_Type)[1]
for(i in c(1:3))
{
  a[i]<- table(train$Outlet_Location_Type)[i]
}
pie(a,labels = levels(train$Outlet_Location_Type),radius = 1,main = " Pie Chart")


# Item Visibility
summary(train$Item_Visibility)

ggplot(data=train,aes(x= train$Item_Visibility,y=train$Item_Outlet_Sales))+
  geom_point(aes(colour=train$Item_Type))+
  ggtitle("Item Visibility Vs Outlet Sales(Item Type)")+
  xlab("Item Visibility")+
  ylab("Outlet Sales")

# Item Type Vs Item Fat Content ...
table(train$Item_Type,train$Item_Fat_Content)

ggplot(data = train,aes(x= train$Item_Type))+
  geom_bar(stat = "count",aes(fill=Item_Fat_Content))+
  ggtitle("Item Type Vs Item Fat Content")+
  xlab("Item Type")+
  theme(axis.text.x = element_text(angle = 75,hjust = 1))

# Item Weight ... 
summary(train$Item_Weight)
sum(is.na(train$Item_Weight))# 1463 missing values

ggplot(data=train,aes(x= train$Item_Weight,y = train$Item_Outlet_Sales))+
  geom_point(color="blue",alpha=.4)+
  ggtitle("Item Weight Vs Outlet Sales Vs Item Type")+
  xlab("Item Weight")+
  ylab("Outlet sales")+
  facet_wrap(~train$Item_Type)

# boxplot ... 
ggplot(data=train,aes(train$Item_Type,train$Item_Weight))+
  geom_boxplot(color="black",fill="green",alpha=.6)+
  ggtitle("BoxPlot: Item Type vs Item Weight")+
  labs(x="Item Type",y="Item Weight")+
  theme(axis.text = element_text(angle = 75,hjust=1))

# corelation matrix of numeric Variables ...
corelation_test<- train[,c(2,4,6,12)]
colnames(corelation_test)<- c("IW","IV","IMRP","IOS")
get_cor<-cor(na.omit(corelation_test))
corrplot(get_cor,method = "number")
