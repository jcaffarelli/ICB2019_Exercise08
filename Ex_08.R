#setting working directory for Exercise 08
setwd("C:/Users/jcaff/Documents/Notre Dame/Senior/fall_19/Biocomputing/R/Tutorial/Ex_08/ICB2019_Exercise08")

#clear global environment
rm(list = ls())

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


