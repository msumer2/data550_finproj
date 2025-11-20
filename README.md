# DATA 550 Final Project

## Project Description
This project analyzes the __"Predict Students' Dropout and Academic Success"__ dataset from the UC Irvine Machine Learning Repository. The analysis explores factors associated with student dropout and academic success among 4,242 Portuguese higher education students, examining demographic patterns, academic performance trends, and socio-economic influences on student outcomes.

## Repository Contents
- `data.csv` - contains the student records
- `report/` - contains the R Markdown file (`final_proj2.Rmd`) for the final report, the figure one and table one code, and the code to render the report
- `output/` - contains the .rds files (`figure1.rds` and `table1.rds`) referenced in the R Markdown file
- `Makefile` - contains rules for building the final report
- `README.md` - this document

## Generating Final Report
To generate the final report, run the following command from the terminal:
```bash
make
```
## Report Contents Description

The final report includes:

- Introduction to the data set and research objectives
- Descriptive statistics of student characteristics by academic outcome (dropout, enrolled, graduate)
- Analysis of demographic patterns and academic performance
- Visualization of academic performance trajectories over time
- Key findings on factors associated with student dropout and success

## Required Table
To generate table one:

- Code is located in `report/table_one.R`
- Referenced in chunk titled `table-one` in `report/final_proj2.Rmd`

## Required Figure
To generate figure one:

- Code is located in `report/figure_one.R`
- Referenced in chunk titled `figure-one` in `report/final_proj2.Rmd`

## Package Management

This project uses `renv` for package management. 

- To restore packages: `make install` or `renv::restore()` in R.
- To update packages: `renv::snapshot()` in R after updating packages.

