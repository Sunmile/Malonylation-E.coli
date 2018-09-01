######knn ROC
library(class)
data1 = read.csv("ACC2.csv",sep=",",header = F);
colnames(data1)[22]="label"
# colnames(binarybf)[442]="label"
# l <- nrow(binarybf)
# da1<- sample(1:l,l);
# databinarybf=binarybf[da1,]

a1=c(1:5306)
# a1=c(1:2989)
# a1=seq(1:278)
traink1=databinarybf[-a1,]
testk1=databinarybf[a1,]
modk1<- knn(traink1,testk1,traink1$label,k=4)
kt1=as.matrix(modk1)
#kt1 = as.numeric(modk1)-1
#prek11 = as.matrix(ifelse(kt1==0,-1,1))
#prek1 = attributes(modk1)$prob
#prok1 = as.matrix(prek11*prek1)###


a2=c(5307:10612)
# a2=seq(279:556)
traink2=databinarybf[-a2,]
testk2=databinarybf[a2,]
modk2<- knn(traink2,testk2,traink2$label,k=4)
kt2=as.matrix(modk2)
#kt2 = as.numeric(modk2)-1
#prek22 = as.matrix(ifelse(kt2==0,-1,1))
#prek2 = attributes(modk2)$prob
#prok2 = as.matrix(prek22*prek2)

a3=c(10613:15918)
# a3=seq(557:834)
traink3=databinarybf[-a3,]
testk3=databinarybf[a3,]
modk3<- knn(traink3,testk3,traink3$label,k=4)
kt3=as.matrix(modk3)
# kt3 = as.numeric(modk3)-1
# prek33 = as.matrix(ifelse(kt3==0,-1,1))
# prek3 = attributes(modk3)$prob
# prok3 = as.matrix(prek33*prek3)

a4=c(15919:21224)
# a4=seq(835:1112)
traink4=databinarybf[-a4,]
testk4=databinarybf[a4,]
modk4<- knn(traink4,testk4,traink4$label,k=4)
kt4=as.matrix(modk4)
# kt4 = as.numeric(modk4)-1
# prek44 = as.matrix(ifelse(kt4==0,-1,1))
# prek4 = attributes(modk4)$prob
# prok4 = as.matrix(prek44*prek4)

a5=c(21225:26530)
# a5=seq(1113:1390)
traink5=databinarybf[-a5,]
testk5=databinarybf[a5,]
modk5<- knn(traink5,testk5,traink5$label,k=4)
kt5=as.matrix(modk5)
# kt5 = as.numeric(modk5)-1
# prek55 = as.matrix(ifelse(kt5==0,-1,1))
# prek5 = attributes(modk5)$prob
# prok5 = as.matrix(prek55*prek5)

a6=c(26531:31836)
# a6=seq(1391:1668)
traink6=databinarybf[-a6,]
testk6=databinarybf[a6,]
modk6<- knn(traink6,testk6,traink6$label,k=4)
kt6=as.matrix(modk6)
# kt6 = as.numeric(modk6)-1
# prek66 = as.matrix(ifelse(kt6==0,-1,1))
# prek6 = attributes(modk6)$prob
# prok6 = as.matrix(prek66*prek6)

a7=c(31837:37142)
# a7=seq(1669:1946)
traink7=databinarybf[-a7,]
testk7=databinarybf[a7,]
modk7<- knn(traink7,testk7,traink7$label,k=4)
kt7=as.matrix(modk7)
# kt7 = as.numeric(modk7)-1
# prek77 = as.matrix(ifelse(kt7==0,-1,1))
# prek7 = attributes(modk7)$prob
# prok7 = as.matrix(prek77*prek7)

a8=c(37143:42448)
# a8=seq(1947:2224)
traink8=databinarybf[-a8,]
testk8=databinarybf[a8,]
modk8<- knn(traink8,testk8,traink8$label,k=4)
kt8=as.matrix(modk8)
# kt8 = as.numeric(modk8)-1
# prek88 = as.matrix(ifelse(kt8==0,-1,1))
# prek8 = attributes(modk8)$prob
# prok8 = as.matrix(prek88*prek8)

a9=c(42449:47754)
# a9=seq(2225:2502)
traink9=databinarybf[-a9,]
testk9=databinarybf[a9,]
modk9<- knn(traink9,testk9,traink9$label,k=4)
kt9=as.matrix(modk9)
# kt9 = as.numeric(modk9)-1
# prek99 = as.matrix(ifelse(kt9==0,-1,1))
# prek9 = attributes(modk9)$prob
# prok9 = as.matrix(prek99*prek9)

a10=c(47755:53063)
traink10=databinarybf[-a10,]
testk10=databinarybf[a10,]
modk10<- knn(traink10,testk10,traink10$label,k=4)
kt10=as.matrix(modk10)
# kt10 = as.numeric(modk10)-1
# prek1010 = as.matrix(ifelse(kt10==0,-1,1))
# prek10 = attributes(modk10)$prob
# prok10 = as.matrix(prek1010*prek10)

kt=rbind(kt1,kt2,kt3,kt4,kt5,kt6,kt7,kt8,kt9,kt10)
kt=as.numeric(kt)
write.table (kt, file ="G:\\yangyingxi\\result\\ktbf.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)
write.table (da1, file ="G:\\yangyingxi\\result\\da1.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)
#probk=rbind(prok1,prok2,prok3,prok4,prok5,prok6,prok7,prok8,prok9,prok10)
#probkk=rbind(prek11,prek22,prek33,prek44,prek55,prek66,prek77,prek88,prek99,prek1010)
testk=databinarybf[1:2700,]
predk <- prediction(probk,testk$label)
performance(predk,'auc')@y.values   #0.5188447
perfk <- performance(predk,'tpr','fpr')
fprk =perfk@x.values
tprk =perfk@y.values
write.table (fprk, file ="G:\\yangyingxi\\result\\fprk.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)
write.table (tprk, file ="E:\\yangyingxi\\tprk.csv", sep ="", row.names =FALSE, col.names =FALSE, quote =TRUE)

p=length(which(testk$label==1))
tp=length(which(probkk==1&testk$label==1))
fn=length(which(probkk==-1&testk$label==1))

n=length(which(testk$label==-1))
tn=length(which(probkk==-1&testk$label==-1))
fp=length(which(probkk==1&testk$label==-1))

acck=(tp+tn)/(p+n);acck #0.6523
spek=tn/n;spek #0.8171
senk=tp/p;senk #0.2133
mcck=(tp*tn-fp*fn)/sqrt((tp+fn)*(tp+fp)*(tn+fp)*(tn+fn));mcck   #-0.0093


