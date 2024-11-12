install.packages("abjData")
library(abjData)

# The abjData package includes several datasets, such as:
abjData::pnud_min

glimpse(abjData::pnud_min)

readr::write_csv2(abjData::pnud_min, "data/pnud_min.csv")
