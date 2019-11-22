#setting working directory for Exercise 08
setwd("C:/Users/jcaff/Documents/Notre Dame/Senior/fall_19/Biocomputing/R/Tutorial/Ex_08/ICB2019_Exercise08")

#clear global environment
rm(list = ls())

###  QUESTION 1  ###

#loading Score Data
scoreUWMSU<-read.table("UWvMSU_1-22-13.txt",header = TRUE,sep = "")

#separate scores by team into separate data tables
scoreUW<-scoreUWMSU[scoreUWMSU$team=="UW",]
scoreMSU<-scoreUWMSU[scoreUWMSU$team=="MSU",]

#check final (sum) of scores as a check for later!
sum(scoreMSU$score)#49
sum(scoreUW$score)#47
#close game!

#Need to create for-loops for each team that take cumulative score at each time point
#set initial scores to 0
cumScoreUW=0
cumScoreMSU=0

#UW for-loop to generate cumulative score
for (i in 1:nrow(scoreUW)){
  cumScoreUW<-cumScoreUW+scoreUW$score[i] #this line generates cumulative sum
  scoreUW$score[i]=cumScoreUW #replaces scores with cumulative score
}
#final UW score is orrect at 47

#MSU for-loop to generate cumulative score
for (i in 1:nrow(scoreMSU)){
  cumScoreMSU<-cumScoreMSU+scoreMSU$score[i]
  scoreMSU$score[i]=cumScoreMSU
}
#final MSU score is correct at 49

#generating graph!
#setting axes
x=scoreUW$time
y=scoreUW$score
#creating graph with UW Data
plot(x,y,"l",col="red",xlab = "Time",ylab = "Score",main = "UW-MSU ScoreTracker")
#adding MSU Data
x2=scoreMSU$time
y2=scoreMSU$score
#adding line for MSU
lines(x2,y2,col="dark green")
