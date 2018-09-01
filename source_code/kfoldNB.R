##Bayes
library(e1071)
library(ROCR)
l <- length(data_pp[,1])
datard<- sample(1:l,l);#sub
datanew=data_pp[datard,]
a1=c(1:270)
trainb1=datanew[-a1,]
testb1=datanew[a1,]
modb1<- naiveBayes(cla~.,trainb1)  
preb1 <- predict(modb1,testb1,type='raw')
#preb11<-predict(modb1,testb1,type='class')
prob1<-as.matrix(preb1[,2])

a2=c(271:540)
trainb2=datanew[-a2,]
testb2=datanew[a2,]
modb2<- naiveBayes(cla~.,trainb2)  
preb2 <- predict(modb2,testb2,type='raw')
#preb22<-predict(modb2,testb2,type='class')
prob2<-as.matrix(preb2[,2])

a3=c(541:810)
trainb3=datanew[-a3,]
testb3=datanew[a3,]
modb3<- naiveBayes(cla~.,trainb3)  
preb3 <- predict(modb3,testb3,type='raw')
#preb33<-predict(modb3,testb3,type='class')
prob3<-as.matrix(preb3[,2])

a4=c(811:1080)
trainb4=datanew[-a4,]
testb4=datanew[a4,]
modb4<- naiveBayes(cla~.,trainb4)  
preb4 <- predict(modb4,testb4,type='raw')
#preb44<-predict(modb4,testb4,type='class')
prob4<-as.matrix(preb4[,2])

a5=c(1081:1350)
trainb5=datanew[-a5,]
testb5=datanew[a5,]
modb5<- naiveBayes(cla~.,trainb5)  
preb5 <- predict(modb5,testb5,type='raw')
#preb55<-predict(modb5,testb5,type='class')
prob5<-as.matrix(preb5[,2])

a6=c(1351:1620)
trainb6=datanew[-a6,]
testb6=datanew[a6,]
modb6<- naiveBayes(cla~.,trainb6)  
preb6 <- predict(modb6,testb6,type='raw')
#preb66<-predict(modb6,testb6,type='class')
prob6<-as.matrix(preb6[,2])

a7=c(1621:1890)
trainb7=datanew[-a7,]
testb7=datanew[a7,]
modb7<- naiveBayes(cla~.,trainb7)  
preb7 <- predict(modb7,testb7,type='raw')
#preb77<-predict(modb7,testb7,type='class')
prob7<-as.matrix(preb7[,2])

a8=c(1891:2160)
trainb8=datanew[-a8,]
testb8=datanew[a8,]
modb8<- naiveBayes(cla~.,trainb8)  
preb8 <- predict(modb8,testb8,type='raw')
#preb88<-predict(modb8,testb8,type='class')
prob8<-as.matrix(preb8[,2])

a9=c(2161:2430)
trainb9=datanew[-a9,]
testb9=datanew[a9,]
modb9<- naiveBayes(cla~.,trainb9)  
preb9 <- predict(modb9,testb9,type='raw')
#preb99<-predict(modb9,testb9,type='class')
prob9<-as.matrix(preb9[,2])

a10=c(2431:2700)
trainb10=datanew[-a10,]
testb10=datanew[a10,]
modb10<- naiveBayes(cla~.,trainb10)  
preb10 <- predict(modb10,testb10,type='raw')
#preb1010<-predict(modb10,testb10,type='class')
prob10<-as.matrix(preb10[,2])

probb=rbind(prob1,prob2,prob3,prob4,prob5,prob6,prob7,prob8,prob9,prob10)
probb[which(probb>=0.4)]="pos"
probb[which(probb<0.4)]="neg"
probb[which(probb!="pos"&probb!="neg")]="neg"
probbb=probb
probb=rbind(prob1,prob2,prob3,prob4,prob5,prob6,prob7,prob8,prob9,prob10)
#probbb=rbind(preb11,preb22,preb33,preb44,preb55,preb66,preb77,preb88,preb99,preb1010)
testb=datanew[1:2700,]
predb <- prediction(probb,testb$cla)
performance(predb,'auc')@y.values
perfb <- performance(predb,'tpr','fpr')
fprb =perfb@x.values
tprb =perfb@y.values
write.table (fprb, file ="E:\\yangyingxi\\fprb.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)
write.table (tprb, file ="E:\\yangyingxi\\tprb.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)


p=length(which(testb$cla=="pos"))
tp=length(which(probbb=="pos"&testb$cla=="pos"))
fn=length(which(probbb=="neg"&testb$cla=="pos"))

n=length(which(testb$cla=="neg"))
tn=length(which(probbb=="neg"&testb$cla=="neg"))
fp=length(which(probbb=="pos"&testb$cla=="neg"))

accb=(tp+tn)/(p+n);accb #0.6682
speb=tn/n;speb#0.8746
senb=tp/p;senb #0.1185
mccb=(tp*tn-fp*fn)/sqrt((tp+fn)*(tp+fp)*(tn+fp)*(tn+fn));mccb   #-0.0093


# p=length(which(testb$cla=="pos"))
# tp=length(which(probbb==2&testb$cla=="pos"))
# fn=length(which(probbb==1&testb$cla=="pos"))
# 
# n=length(which(testb$cla=="neg"))
# tn=length(which(probbb==1&testb$cla=="neg"))
# fp=length(which(probbb==2&testb$cla=="neg"))
# 
# accb=(tp+tn)/(p+n);accb #0.6682
# speb=tn/n;speb#0.8746
# senb=tp/p;senb #0.1185
# mccb=(tp*tn-fp*fn)/sqrt((tp+fn)*(tp+fp)*(tn+fp)*(tn+fn));mccb   #-0.0093
