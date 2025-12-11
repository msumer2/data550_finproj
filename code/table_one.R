library(knitr)
library(dplyr)
library(here)

here::i_am(
  "code/table_one.R"
)

data <- read.csv(here::here("code/data.csv"), sep = ";")

table1 <-  data |>
  group_by(Target) |>
  summarise(
    N = n(),
    'Age (mean)' = round(mean(Age.at.enrollment, na.rm = T), 1),
    'Male (%)' = round(mean(Gender == 1, na.rm = T) * 100,1),
    'International (%)' = round(mean(International == 1, na.rm = T) * 100, 1),
    'Scholarship (%)' = round(mean(Scholarship.holder == 1, na.rm = T) * 100, 1),
    'Educational Special Needs (%)' = round(mean(Educational.special.needs == 1, na.rm = T) * 100, 1),
    'Admission Grade (mean)' = round(mean(Admission.grade, na.rm = T) / 2, 1),
    'First Semester Grade (mean)' = round(mean(Curricular.units.1st.sem..grade., na.rm = T) / 20 * 100, 1),
    'Second Semester Grade (mean)' = round(mean(Curricular.units.2nd.sem..grade., na.rm = T) / 20 * 100, 1)
  )

table1_new <- as.data.frame(t(table1[,-1]))
colnames(table1_new) <- table1$Target

saveRDS(table1_new, file = here::here("output/table1.rds"))

