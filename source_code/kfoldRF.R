###RF的十折
library(randomForest)
l <- length(data_pp[,1])
datard<- sample(1:l,l);#sub
datanew2=data_pp[datard,]
a1=c(1:270)
trainr1=datanew2[-a1,]
testr1=datanew2[a1,]
modr1<- randomForest(cla~.,trainr1,importance = T) 
prer1 <- predict(modr1,testr1,type = 'prob')
prer11=predict(modr1,testr1,type = 'class')
pror1=as.matrix(prer1[,2])
# prer1[which(prer1<0)]=-1
# prer1[which(prer1>=0)]=1
# prer11=as.matrix(prer1)
# pror1 <- as.matrix(predict(modr1,testr1))
# #pror1[which(prer1<0)]=1+pror1[which(prer1<0)]


a2=c(271:540)
trainr2=datanew2[-a2,]
testr2=datanew2[a2,]
modr2<- randomForest(cla~.,trainr2,importance = T)  
prer2 <- predict(modr2,testr2,type = 'prob')
prer22=predict(modr2,testr2,type = 'class')
pror2=as.matrix(prer2[,2])

a3=c(541:810)
trainr3=datanew2[-a3,]
testr3=datanew2[a3,]
modr3<- randomForest(cla~.,trainr3,importance = T)  
prer3 <- predict(modr3,testr3,type = 'prob')
prer33=predict(modr3,testr3,type = 'class')
pror3=as.matrix(prer3[,2])

a4=c(811:1080)
trainr4=datanew2[-a4,]
testr4=datanew2[a4,]
modr4<- randomForest(cla~.,trainr4,importance = T)  
prer4 <- predict(modr4,testr4,type = 'prob')
prer44=predict(modr4,testr4,type = 'class')
pror4=as.matrix(prer4[,2])

a5=c(1081:1350)
trainr5=datanew2[-a5,]
testr5=datanew2[a5,]
modr5<- randomForest(cla~.,trainr5,importance = T)  
prer5 <- predict(modr5,testr5,type = 'prob')
prer55=predict(modr5,testr5,type = 'class')
pror5=as.matrix(prer5[,2])

a6=c(1351:1620)
trainr6=datanew2[-a6,]
testr6=datanew2[a6,]
modr6<- randomForest(cla~.,trainr6,importance = T)  
prer6 <- predict(modr6,testr6,type = 'prob')
prer66=predict(modr6,testr6,type = 'class')
pror6=as.matrix(prer6[,2])

a7=c(1621:1890)
trainr7=datanew2[-a7,]
testr7=datanew2[a7,]
modr7<- randomForest(cla~.,trainr7,importance = T)  
prer7 <- predict(modr7,testr7,type = 'prob')
prer77=predict(modr7,testr7,type = 'class')
pror7=as.matrix(prer7[,2])

a8=c(1891:2160)
trainr8=datanew2[-a8,]
testr8=datanew2[a8,]
modr8<- randomForest(cla~.,trainr8,importance = T)  
prer8 <- predict(modr8,testr8,type = 'prob')
prer88=predict(modr8,testr8,type = 'class')
pror8=as.matrix(prer8[,2])

a9=c(2161:2430)
trainr9=datanew2[-a9,]
testr9=datanew2[a9,]
modr9<- randomForest(cla~.,trainr9,importance = T)  
prer9 <- predict(modr9,testr9,type = 'prob')
prer99=predict(modr9,testr9,type = 'class')
pror9=as.matrix(prer9[,2])

a10=c(2431:2700)
trainr10=datanew2[-a10,]
testr10=datanew2[a10,]
modr10<- randomForest(cla~.,trainr10,importance = T)  
prer10 <- predict(modr10,testr10,type = 'prob')
prer1010=predict(modr10,testr10,type = 'class')
pror10=as.matrix(prer10[,2])

probr=rbind(pror1,pror2,pror3,pror4,pror5,pror6,pror7,pror8,pror9,pror10)
# probr[which(probr<0.4)]="pos"
# probr[which(probr>=0.4)]="neg"
# probr[which(probr!="pos"&probr!="neg")]="neg"
# probrr=probr
# probr=rbind(pror1,pror2,pror3,pror4,pror5,pror6,pror7,pror8,pror9,pror10)
probrr=rbind(prer11,prer22,prer33,prer44,prer55,prer66,prer77,prer88,prer99,prer1010)
testr=datanew[1:2700,]
predr <- prediction(probr,testr$cla)
performance(predr,'auc')@y.values #0.5308
perfr <- performance(predr,'tpr','fpr')
fprr =perfr@x.values
tprr =perfr@y.values
write.table (fprr, file ="E:\\yangyingxi\\fprr.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)
write.table (tprr, file ="E:\\yangyingxi\\tprr.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)

p=length(which(testr$cla=="pos"))
tp=length(which(probrr==2&testr$cla=="pos"))
fn=length(which(probrr==1&testr$cla=="pos"))

n=length(which(testr$cla=="neg"))
tn=length(which(probrr==1&testr$cla=="neg"))
fp=length(which(probrr==2&testr$cla=="neg"))

accr=(tp+tn)/(p+n);accr #0.715
sper=tn/n;sper #0.9721
senr=tp/p;senr #0.0301
mccr=(tp*tn-fp*fn)/sqrt((tp+fn)*(tp+fp)*(tn+fp)*(tn+fn));mccr   #0.0060

