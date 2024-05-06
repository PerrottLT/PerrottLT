#Source: https://datahub.io/sports-data/english-premier-league

df_EPL21 <- read.csv(".\\..\\data\\EPL_2021_22.csv")

df_EPL21$GameID <- seq_along(df_EPL21[,1])

summary()

#for (n in df_EPL21$GameID) {
#  
#  } 


