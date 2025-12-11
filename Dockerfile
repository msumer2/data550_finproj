FROM rocker/tidyverse:4.5.1 

  # system dependencies
RUN apt-get update && apt-get install -y \
    libnode-dev \
    && rm -rf /var/lib/apt/lists/*
    
  # to build report with r markdown
RUN apt-get update && apt-get install -y pandoc

  # set up project directory & set working directory
RUN mkdir /project
WORKDIR /project

  # copy relevant contents
RUN mkdir code
RUN mkdir output
COPY code code
COPY Makefile .
COPY final_report.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

  # package management
RUN Rscript -e "renv::restore(prompt = FALSE)"

################ MOUNTING DIRECTORY ################ 
RUN mkdir report && chown -R rstudio:rstudio /project/report

CMD ["make", "report/final_report.html"]