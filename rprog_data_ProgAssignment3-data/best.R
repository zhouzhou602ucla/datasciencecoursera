## Part I: plot the 30-day mortality rates for heart attack
outcome <-
  read.csv(
    "/Users/Fangzhu/coursera/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv",
    colClasses = "character"
  )
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11]) ## generate the histogram of the 30-day death rate of heart attack


## Part II: find the best hospital in a state
## write a function to find the best hospital
best <- function(state, outcome) {
  data <-
    read.csv(
      "/Users/Fangzhu/coursera/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv",
      colClasses = "character"
    ) ## read outcome data
  state_list <- unique(data$State)
  outcome_list <- c("heart attack", "heart failure", "pneumonia")
  if (state %in% state_list) {
    if (outcome %in% outcome_list) {
      in_state_dt <- subset(data, State == state)
      in_state_dt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <-
        as.numeric(in_state_dt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
      in_state_dt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <-
        as.numeric(in_state_dt$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
      in_state_dt$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <-
        as.numeric(in_state_dt$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
      if (outcome == "heart attack") {
        in_state_dt_order_by_death_rate <-
          in_state_dt[order(in_state_dt[11], in_state_dt[2]), ]
        print(in_state_dt_order_by_death_rate$Hospital.Name[1])
      } else if (outcome == "heart failure") {
        in_state_dt_order_by_death_rate <-
          in_state_dt[order(in_state_dt[17], in_state_dt[2]), ]
        print(in_state_dt_order_by_death_rate$Hospital.Name[1])
      } else {
        in_state_dt_order_by_death_rate <-
          in_state_dt[order(in_state_dt[23], in_state_dt[2]), ]
        print(in_state_dt_order_by_death_rate$Hospital.Name[1])
      }
    } else {
      message("warning: choose outcome from 'heart attack','heart failure' or 'pneumonia' ")
    }
  } else {
    message("warning: state not in state_list")
  }
}