rm(list=ls())

library(foreach)
library(doParallel)
numCores <- detectCores()###detect the cores no
numCores

registerDoParallel(numCores)  # use multicore, set to the number of our cores

x <- iris[which(iris[,5] != "setosa"), c(1,5)]
trials <- 10000

##parallel order  %dopar%
system.time({
  r <- foreach(1:10000, .combine=rbind) %dopar% {
    ind <- sample(100, 100, replace=TRUE)
    result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
    coefficients(result1)
  }
})

##########seriral calculction %do%
system.time({
  r <- foreach(1:10000, .combine=rbind) %do% {
    ind <- sample(100, 100, replace=TRUE)
    result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
    coefficients(result1)
  }
})
###stop paralleling calcualtion
stopImplicitCluster()
