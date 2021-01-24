Parking_Violations_Issued_._Fiscal_Year_2014__August_2013___June_2014_ <- read.csv("~/Desktop/archive/Parking_Violations_Issued_-_Fiscal_Year_2014__August_2013___June_2014_.csv")

colnames(Parking_Violations_Issued_._Fiscal_Year_2014__August_2013___June_2014_)

Aug_2013_June_2014 <- Parking_Violations_Issued_._Fiscal_Year_2014__August_2013___June_2014_

colnames(Aug_2013_June_2014)


unique_precinct <- print(unique(Aug_2013_June_2014[c("Registration.State")]))


count_state <- Aug_2013_June_2014 %>% count(Registration.State)


#got rid of specific violation columns 
new_Aug2013June2014 <- Aug_2013_June_2014[-c(10:12,17:19,37:50)]
new_Aug2013June2014 <- new_Aug2013June2014[-c(31)]

