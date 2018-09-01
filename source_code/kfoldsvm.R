######C4.5
library(e1071)
#data_pp = read.csv("E:\\yangyingxi\\E.coli Mal_new\\R\\data\\data_pp.csv",sep=",",header = F);
data1 = read.csv("CSV_str.csv",sep=",",header = F);
colnames(data1)[442]="label"
l <- nrow(data1)
da1<- sample(1:l,l);
data1=data1[da1,]
write.csv(da1,file="labels.csv")
write.csv(data1,file="multilabel.csv")


a1=c(1:2989)
trains1=data1[-a1,]
tests1=data1[a1,c(1:441)]
mods1<- svm(label~.,data=trains1)
pres1 <- predict(mods1,tests1)
pros1<-as.matrix(pres1)

a2=c(2990:5978)
trains2=data1[-a2,]
tests2=data1[a2,c(1:441)]
mods2<- svm(label~.,data=trains2)
pres2 <- predict(mods2,tests2)
pros2<-as.matrix(pres2)

a3=c(5979:8967)
trains3=data1[-a3,]
tests3=data1[a3,c(1:441)]
mods3<- svm(label~.,data=trains3)
pres3 <- predict(mods3,tests3)
pros3<-as.matrix(pres3)

a4=c(8968:11956)
trains4=data1[-a4,]
tests4=data1[a4,c(1:441)]
mods4<- svm(label~.,data=trains4)
pres4 <- predict(mods4,tests4)
pros4<-as.matrix(pres4)

a5=c(11957:14945)
trains5=data1[-a5,]
tests5=data1[a5,c(1:441)]
mods5<- svm(label~.,data=trains5)
pres5 <- predict(mods5,tests5)
pros5<-as.matrix(pres5)


a6=c(14946:17934)
trains6=data1[-a6,]
tests6=data1[a6,c(1:441)]
mods6<- svm(label~.,data=trains6)
pres6 <- predict(mods6,tests6)
pros6<-as.matrix(pres6)

a7=c(17935:20923)
trains7=data1[-a7,]
tests7=data1[a7,c(1:441)]
mods7<- svm(label~.,data=trains7)
pres7 <- predict(mods7,tests7)
pros7<-as.matrix(pres7)

a8=c(20924:23912)
trains8=data1[-a8,]
tests8=data1[a8,c(1:441)]
mods8<- svm(label~.,data=trains8)
pres8 <- predict(mods8,tests8)
pros8<-as.matrix(pres8)

a9=c(23913:26901)
trains9=data1[-a9,]
tests9=data1[a9,c(1:441)]
mods9<- svm(label~.,data=trains9)
pres9 <- predict(mods9,tests9)
pros9<-as.matrix(pres9)

a10=c(26902:29891)
trains10=data1[-a10,]
tests10=data1[a10,c(1:441)]
mods10<- svm(label~.,data=trains10)
pres10 <- predict(mods10,tests10)
pros10<-as.matrix(pres10)


probc=rbind(pros1,pros2,pros3,pros4,pros5,pros6,pros7,pros8,pros9,pros10)
write.csv(probc,file="pros.csv")
#probcc=rbind(prec11,prec22,prec33,prec44,prec55,prec66,prec77,prec88,prec99,prec1010)
