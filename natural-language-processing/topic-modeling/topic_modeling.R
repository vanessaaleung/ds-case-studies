library(glmnet)
library(Matrix)
library(textir)
library(maptpx)
library(dplyr)
library(tidyr)
library(wordcloud)
library(rddtools)

load("congress.RData")

######
# Q1 #
######
# Fit K-means to the speech text of the members, comprising of the 1000 phrases, 
# for K in 5,10,15,20,25

fs <- scale(as.matrix(congress109Counts/rowSums(congress109Counts)))
kmfs5 <- kmeans(fs,5)        
kmfs10 <- kmeans(fs,10)  
kmfs15 <- kmeans(fs,15)  
kmfs20 <- kmeans(fs,20)
kmfs25 <- kmeans(fs,25)

######
# Q2 #
######
# Use BIC to choose the K and interpret the selected model.
# Also use the elbow curve method to identify the most optimal value of K. 
# Compare the two values of K that you obtained. Are they equal?
kcluster = list(kmeans(fs,1),kmeans(fs,2),kmeans(fs,3),kmeans(fs,4),
                kmfs5, kmfs10, kmfs15, kmfs20, kmfs25)
# BIC
#kmeansBIC = function(fit){
#  m = ncol(fit$centers)
#  n = length(fit$cluster)
#  k = nrow(fit$centers)
#  D = fit$tot.withinss
#  return (D + log(n)*m*k)
#}
##(D + log(n)*df)
##df <- length(fit$centers) # K*dim
##n <- sum(fit$size)

# AICc
kmeansAICc = function(fit){
  df = length(fit$cluster)
  n <- sum(fit$size)
  D = fit$tot.withinss
  return (D + 2*df*n/(n-df-1))
}

aicc= sapply(kcluster, kmeansAICc)
plot(c(1:4,5*(1:5)), aicc, 
     xlab="Number of clusters K",
     ylab="AICc")
##k==25

# Elbow curve
set.seed(123)
wss <- lapply(1:25, 
              function(k){kmeans(fs, k)$tot.withinss})
plot(1:25, wss,
     type="b",
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

##k==25

######
# Q3 #
######
# Fit a topic model for the speech counts.  
# Use Bayes factors to choose the number of topics andinterpret your chosen model.
x <- as.simple_triplet_matrix(congress109Counts)
tpcs <- topics(x, K=5*(1:5), verb=10)  # it chooses 10 topics 
# prints the top `n' words for each topic
summary(tpcs, n=5)
tpcs$theta
rownames(tpcs$theta)[order(tpcs$theta[,1], decreasing=TRUE)[1:10]]
par(mfrow=c(1,2))
wordcloud(row.names(tpcs$theta), 
          freq=tpcs$theta[,1], min.freq=0.004, col="maroon")
wordcloud(row.names(tpcs$theta), 
          freq=tpcs$theta[,2], min.freq=0.004, col="navy")

######
# Q4 #
######
# Connect the unsupervised clusters to partisanship. 
# Tabulate party membership by K-means cluster.  
# Are there any non-partisan topics? 
# Fit topic regressions for each of party and repshare.  
# Compare to regression onto phrase percentages: x <- 100 * congress109Counts / rowSums(congress109Counts) 
cg_std <- scale(as.matrix(congress109Counts/rowSums(congress109Counts) ))

##################### party membership as dependent variable ##############
cg <- as.simple_triplet_matrix(congress109Counts)
tpcs <- topics(cg, K=5*(1:5), verb=10)

party <- data.frame(congress109Ideology[,"party"])
rownames(party) <- rownames(congress109Ideology)

# # of observations in each party
# Too few observations of level "I"
table(party)

# omega returns the possibility of each legislator's remarks falling into each cluster
p_cluster<-as.matrix(tpcs$omega)
party_p_cluster<-merge(party,p_cluster, by = "row.names")
rownames(party_p_cluster)<-party_p_cluster$Row.names
party_p_cluster<-party_p_cluster[,-1]
#drop level "I"
party_p_cluster_drop_i<-party_p_cluster[which(party_p_cluster$congress109Ideology....party..!="I"),]
x_topic<-as.matrix(party_p_cluster_drop_i[,-1])
y_topic<-as.matrix(party_p_cluster_drop_i[,1])
# run a cv lasso model: dependent variable is categorical variable party
#                       independent variable is omega matrix(possibility of each observations falling in each of ten clusters)
regtopics.cv <- cv.glmnet(x_topic,y_topic, family="binomial")

# repeat the process above again, this time independent variable is the frequency of each phrase occuring in each legislator's remarks
p_phrase <- data.frame(cg_std)
party_p_phrase<-merge(party,p_phrase,by="row.names")
rownames(party_p_phrase)<-party_p_phrase$Row.names
party_p_phrase<-party_p_phrase[,-1]
party_p_phrase_drop_i<-party_p_phrase[which(party_p_phrase$congress109Ideology....party..!="I"),]
x_word <-as.matrix(party_p_phrase_drop_i[,-1])
y_word <-as.matrix((party_p_phrase_drop_i[,1]))
regwords.cv <- cv.glmnet(x_word,y_word, family="binomial")

# compare topic regression and phrase regression
par(mfrow=c(1,2))
plot(regtopics.cv)
mtext("topic regression", font=2, line=2)
plot(regwords.cv)
mtext("phrase regression", font=2, line=2)
# max OOS R^2s
max(1-regtopics.cv$cvm/regtopics.cv$cvm[1])
max(1-regwords.cv$cvm/regwords.cv$cvm[1])

######################### repshare as dependent variable #####################
#dividing omega matrix for democrats and republicans
Party_omega_D <-Party_omega [which(Party_omega$congress109Ideology....party.. =="D"),]
Party_omega_R <-Party_omega [which(Party_omega$congress109Ideology....party.. =="R"),]
repshare_D <- congress109Ideology[which(congress109Ideology$party =="D"),"repshare"]
repshare_R <- congress109Ideology[which(congress109Ideology$party =="R"),"repshare"]
#fitting regressions for
tpcreg_repshare_D <- gamlr(Party_omega_D[,3:12], repshare_D)
tpcreg_repshare_R <- gamlr(Party_omega_R[,3:12], repshare_R)
plot(tpcreg_repshare_D)
plot(tpcreg_repshare_R)

###################### Tabulate party membership by K-means cluster. ########### 
kmfs_25 <- kmeans(cg_std,25)
x<-data.frame(as.factor(kmfs_25$cluster))
party_x<-merge(x,party,by="row.names")%>%
  group_by(as.factor.kmfs_25.cluster.,congress109Ideology....party..)%>%
  summarise(n())
party_x




















# # Tabulate party membership by K-means cluster.  
# leg_par_clu<-gather(party_p_cluster,2:11,key="cluster",value="possibility")%>%
#   group_by(congress109Ideology....party..,cluster)%>%
#   summarise(mean(possibility))
# display_d<-data.frame(leg_par_clu[which(leg_par_clu$congress109Ideology....party..=="D"),])
# display_i<-data.frame(leg_par_clu[which(leg_par_clu$congress109Ideology....party..=="I"),])
# display_r<-data.frame(leg_par_clu[which(leg_par_clu$congress109Ideology....party..=="R"),])
# print(display_d)
# print(display_i)
# print(display_r)
