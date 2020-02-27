## write a function to find the worst hospital
worst <- function(state, outcome) {
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
        orders <- order(-in_state_dt[11], in_state_dt[2])
        in_state_dt$rank[orders] <- 1:nrow(in_state_dt)
        print(in_state_dt$Hospital.Name[in_state_dt$rank == 1])
      } else if (outcome == "heart failure") {
        orders <- order(-in_state_dt[17], in_state_dt[2])
        in_state_dt$rank[orders] <- 1:nrow(in_state_dt)
        print(in_state_dt$Hospital.Name[in_state_dt$rank == 1])
      } else {
        orders <- order(-in_state_dt[23], in_state_dt[2])
        in_state_dt$rank[orders] <- 1:nrow(in_state_dt)
        print(in_state_dt$Hospital.Name[in_state_dt$rank == 1])
      }
    } else {
      message("warning: choose outcome from 'heart attack','heart failure' or 'pneumonia' ")
    }
  } else {
    message("warning: state not in state_list")
  }
}