report.html: report/final_proj2.Rmd report/figure_one.R output/table1.rds output/figure1.rds
	Rscript report/render_report.R
	
output/table1.rds: report/table_one.R data.csv
	Rscript report/table_one.R
	
output/figure1rds: report/figure_one.R data.csv
	Rscript report/figure_one.R
	
.PHONE: clean
clean:
	rm -f output/*.rds && rm -f report.html