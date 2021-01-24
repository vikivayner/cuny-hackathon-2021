Parking_Violations_Issued_._Fiscal_Year_2014__August_2013___June_2014_ <- read.csv("~/Desktop/archive/Parking_Violations_Issued_-_Fiscal_Year_2014__August_2013___June_2014_.csv")

colnames(Parking_Violations_Issued_._Fiscal_Year_2014__August_2013___June_2014_)

Aug_2013_June_2014 <- Parking_Violations_Issued_._Fiscal_Year_2014__August_2013___June_2014_

colnames(Aug_2013_June_2014)


unique_precinct <- print(unique(Aug_2013_June_2014[c("Registration.State")]))


count_state <- Aug_2013_June_2014 %>% count(Registration.State)


#got rid of specific violation columns 
new_Aug2013June2014 <- Aug_2013_June_2014[-c(10:12,17:19,37:50)]
new_Aug2013June2014 <- new_Aug2013June2014[-c(31)]

#checking for na

colSums(is.na(new_Aug2013June2014))




#fixed names in violation.county
fix_vio_Aug2013Aug2014 <- new_Aug2013June2014 %>% mutate(Violation.County= case_when(Violation.County == "BX" ~ "BRONX",
                                                                                     Violation.County == "K" ~ "KINGS", 
                                                                                     Violation.County == "Q" ~ "QUEENS", 
                                                                                     Violation.County == "QUEEN" ~ "QUEENS", 
                                                                                     Violation.County == "RC" ~ "RICHMOND",
                                                                                     Violation.County == "RICH" ~ "RICHMOND", 
                                                                                     Violation.County == "R" ~ "RICHMOND",
                                                                                     TRUE ~ Violation.County))
        
                                                                                     
 #looking over violation.county for unique values                                                                                                         
unique_county <- print(unique(fix_vio_Aug2013Aug2014[c("Violation.County")]))
#looking at unique precincts 
unique_precinct<- print(unique(fix_vio_Aug2013Aug2014[c("Violation.Precinct")]))


write.csv(fix_vio_Aug2013Aug2014, file = "CUNY Hackathon Aug2013June2014.csv")


pct_zip_codes <- read.csv("~/Downloads/pct_zip_codes.csv")

fiscal_2017 <- read.csv("~/Desktop/CUNY_Hackathon Year_2017.csv")

colnames(fiscal_2017)

names(fiscal_2017)[13] <- "pct"

after_merge2017 <- merge(x = pct_zip_codes, y = fiscal_2017, by = "pct" , all.y = TRUE)

colnames(after_merge2017)
library(tidyverse)

glimpse(after_merge2017)

summary(after_merge2017)