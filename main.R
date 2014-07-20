df<-read.csv("activity.csv")
df1<-df
df$interval<-formatC(df$interval, width = 4, format = "d", flag = "0")
df$steps<-as.numeric(df$steps)
#df$date<-strptime(df$date,"%Y-%m-%d")
df_complete<-na.omit(df)
y<-df$date
x<-strptime(y,"%Y-%m-%d")


df_sum<-aggregate(df_complete$steps, by=list(date=df_complete$date), FUN=sum)
df_mean_day<-aggregate(df_complete$steps, by=list(date=df_complete$date), FUN=mean)
df_median_day<-aggregate(df_complete$steps, by=list(date=df_complete$date), FUN=median)

df_mean_interval<-aggregate(df_complete$steps, by=list(interval=df_complete$interval), FUN=mean)
df_median_interval<-aggregate(df_complete$steps, by=list(date=df_complete$interval), FUN=median)
png(filename="figures/plot1.png",width = 480, height = 480)
hist(df_sum$x)
dev.off()
mean(df_sum$x)
median(df_sum$x)
#df_sum<-aggregate(df_complete$steps, by=list(interval=df_complete$date), FUN=sum)
x1<-df_complete
#summary(x1)
#x2<-by(x1$steps,x1$date,sum)
png(filename="figures/plot2.png",width = 480, height = 480)
plot(df_mean_interval$interval,df_mean_interval$x,type="l")
dev.off()
df_mean_interval_sorted<-df_mean_interval[with(df_mean_interval,order(-x)),]
maximum_interval<-df_mean_interval_sorted[1,1]
len_df<-length(df$date)
len_df_complete<-length(df_complete$date)
na_count<-len_df-len_df_complete
#df$date<-x
#summary(y)
#summary(x)
#df1<-df[complete.cases(df),]

#df1<-na.omit(df)
#df1<-nan.omit(df)
#sums<-by(df[,c(1,3)],date,sum)
