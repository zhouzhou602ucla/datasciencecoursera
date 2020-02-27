source("best.R")
source("notBest.R")
source("worst.R")

rankhospital <- function(state, outcome, num = "best"){
  if(num == "best"){
    best(state,outcome)
  } else if (num == "worst"){
    worst(state,outcome)
  } else {
    notBest(state,outcome,num)
  }
}