library(dplyr)
library(ggplot2)
library(tidyr)
library(here)

here::i_am(
  "code/figure_one.R"
)


data <- read.csv(here::here("code/data.csv"), sep = ";")

outcome_data <- data.frame(
  outcome = c("Dropout", "Enrolled", "Graduate"),
  N = c(1421, 794, 2209),
  admission_grade = c(62.5, 62.8, 64.4),
  first_sem = c(36.3, 55.6, 63.2),
  second_sem = c(29.5, 55.6, 63.5)
)

grade_trajectory <- outcome_data %>%
  select(outcome, admission_grade, first_sem, second_sem) %>%
  pivot_longer(
    cols = c(admission_grade, first_sem, second_sem),
    names_to = "Time",
    values_to = "Grade") %>%
  mutate(Time = factor(Time,
                       levels = c("admission_grade", "first_sem", "second_sem"),
                       labels = c("Admission", "Semester 1", "Semester 2")))

figure1 <- ggplot(grade_trajectory, aes(x= Time, y = Grade, 
                                        group = outcome, color = outcome)) +
  geom_line() +
  geom_point() +
  labs(title = "Figure 1. Academic Perfomance Trajectory by Outcome",
       x = "Time Point",
       y = "Average Grade (%)",
       color = "Outcome Category") +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 15),
        legend.position = "right") +
  ylim(0, 100)

saveRDS(figure1, file = here::here("output/figure1.rds"))