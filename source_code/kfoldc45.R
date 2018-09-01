######C4.5
library(RWeka)
library("party")

l <- length(data_pp[,1])
datard<- sample(1:l,l);#sub
datanew=data_pp[datard,]
a1=c(1:270)
trainc1=datanew[-a1,]
testc1=datanew[a1,]
modc1<- J48(cla~.,data=trainc1)
prec1 <- predict(modc1,testc1,type='probability')
prec11<-predict(modc1,testc1,type='class')
proc1<-as.matrix(prec1[,2])

a2=c(271:540)
trainc2=datanew[-a2,]
testc2=datanew[a2,]
modc2<- J48(cla~.,data=trainc2)  
prec2 <- predict(modc2,testc2,type='probability')
prec22<-predict(modc2,testc2,type='class')
proc2<-as.matrix(prec2[,2])

a3=c(541:810)
trainc3=datanew[-a3,]
testc3=datanew[a3,]
modc3<- J48(cla~.,data=trainc3)
prec3 <- predict(modc3,testc3,type='probability')
prec33<-predict(modc3,testc3,type='class')
proc3<-as.matrix(prec3[,2])

a4=c(811:1080)
trainc4=datanew[-a4,]
testc4=datanew[a4,]
modc4<- J48(cla~.,data=trainc4)  
prec4 <- predict(modc4,testc4,type='probability')
prec44<-predict(modc4,testc4,type='class')
proc4<-as.matrix(prec4[,2])

a5=c(1081:1350)
trainc5=datanew[-a5,]
testc5=datanew[a5,]
modc5<- J48(cla~.,data=trainc5)  
prec5 <- predict(modc5,testc5,type='probability')
prec55<-predict(modc5,testc5,type='class')
proc5<-as.matrix(prec5[,2])

a6=c(1351:1620)
trainc6=datanew[-a6,]
testc6=datanew[a6,]
modc6<- J48(cla~.,data=trainc6)  
prec6 <- predict(modc6,testc6,type='probability')
prec66<-predict(modc6,testc6,type='class')
proc6<-as.matrix(prec6[,2])

a7=c(1621:1890)
trainc7=datanew[-a7,]
testc7=datanew[a7,]
modc7<- J48(cla~.,data=trainc7)  
prec7 <- predict(modc7,testc7,type='probability')
prec77<-predict(modc7,testc7,type='class')
proc7<-as.matrix(prec7[,2])

a8=c(1891:2160)
trainc8=datanew[-a8,]
testc8=datanew[a8,]
modc8<- J48(cla~.,data=trainc8) 
prec8 <- predict(modc8,testc8,type='probability')
prec88<-predict(modc8,testc8,type='class')
proc8<-as.matrix(prec8[,2])

a9=c(2161:2430)
trainc9=datanew[-a9,]
testc9=datanew[a9,]
modc9<- J48(cla~.,data=trainc9)  
prec9 <- predict(modc9,testc9,type='probability')
prec99<-predict(modc9,testc9,type='class')
proc9<-as.matrix(prec9[,2])

a10=c(2431:2700)
trainc10=datanew[-a10,]
testc10=datanew[a10,]
modc10<- J48(cla~.,data=trainc10)  
prec10 <- predict(modc10,testc10,type='probability')
prec1010<-predict(modc10,testc10,type='class')
proc10<-as.matrix(prec10[,2])

probc=rbind(proc1,proc2,proc3,proc4,proc5,proc6,proc7,proc8,proc9,proc10)
#probcc=rbind(prec11,prec22,prec33,prec44,prec55,prec66,prec77,prec88,prec99,prec1010)
probc[which(probc>=0.4)]="pos"
probc[which(probc<0.4)]="neg"
probc[which(probc!="pos"&probc!="neg")]="neg"
probcc=probc
probc=rbind(proc1,proc2,proc3,proc4,proc5,proc6,proc7,proc8,proc9,proc10)
testc=datanew[1:2700,]
predc <- prediction(probc,testc$cla)
performance(predc,'auc')@y.values #0.527114
perfc <- performance(predc,'tpr','fpr')
fprc =perfc@x.values
tprc =perfc@y.values
write.table (fprc, file ="E:\\yangyingxi\\fprc.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)
write.table (tprc, file ="E:\\yangyingxi\\tprc.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)

performance(predc,'auc')@y.values #0.527114
p=length(which(testc$cla=="pos"))
tp=length(which(probcc=="pos"&testc$cla=="pos"))
fn=length(which(probcc=="neg"&testc$cla=="pos"))

n=length(which(testc$cla=="neg"))
tn=length(which(probcc=="neg"&testc$cla=="neg"))
fp=length(which(probcc=="pos"&testc$cla=="neg"))

accb=(tp+tn)/(p+n);accb #0.6682
speb=tn/n;speb#0.8746
senb=tp/p;senb #0.1185
mccb=(tp*tn-fp*fn)/sqrt((tp+fn)*(tp+fp)*(tn+fp)*(tn+fn));mccb   #-0.0093

# p=length(which(testc$cla=="pos"))
# tp=length(which(probcc==2&testc$cla=="pos"))
# fn=length(which(probcc==1&testc$cla=="pos"))
# 
# n=length(which(testc$cla=="neg"))
# tn=length(which(probcc==1&testc$cla=="neg"))
# fp=length(which(probcc==2&testc$cla=="neg"))
# 
# accc=(tp+tn)/(p+n);accc#0.6076
# spec=tn/n;spec #0.7398867
# senc=tp/p;senc #0.255387
# mccc=(tp*tn-fp*fn)/sqrt((tp+fn)*(tp+fp)*(tn+fp)*(tn+fn));mccc   #0.0060
