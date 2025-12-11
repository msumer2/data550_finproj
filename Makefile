############# REPORT RULES #############
.PHONY: install clean report docker_image

report: report/final_report.html

install: 
	Rscript -e "renv::restore()"

report/final_report.html: code/render_report.R final_report.Rmd \
	output/figure1.rds output/table1.rds
	Rscript code/render_report.R
	
output/table1.rds: code/table_one.R code/data.csv
	Rscript code/table_one.R
	
output/figure1.rds: code/figure_one.R code/data.csv
	Rscript code/figure_one.R
	
clean:
	rm -f output/*.rds && rm -f report/final_report.html
	
############# DOCKER RULES #############
	# uses IMAGE = <custom_image_name> for local build example 
IMAGE ?= msumer2/final_image:latest 
docker_image: 
	mkdir -p report
	docker run -v "$$(pwd)/report":/project/report $(IMAGE)
	
