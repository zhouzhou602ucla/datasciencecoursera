rankall <- function(outcome, num = "best") {
  data <-
    read.csv(
      "/Users/Fangzhu/coursera/datasciencecoursera/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv",
      colClasses = "character"
    ) ## read outcome data
  state_full_list <- unique(data$State)
  # df <- data.frame(s = character(),
  #                  h = character())
  for (i in 1:length(state_full_list)) {
    state_dt <- rankhospital(state_full_list[i], outcome, num)
    s <- rbind(s,state_full_list[i])
    h <- rbind(h,state_dt)
  }
  dt <- as.data.frame(dt)
  colnames(dt) <- c("state","hospital")
  dt <- dt[order(dt["state"]),]
  dt
}