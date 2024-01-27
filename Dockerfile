FROM rocker/r-ver:4.1.2

RUN apt-get update && apt-get install -y \
    libglpk-dev \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libxt-dev \
    unixodbc-dev \
    wget \
    pandoc


RUN R -e "install.packages('remotes')"

RUN R -e "remotes::install_github('rstudio/renv@0.16.0')"

RUN mkdir /home/inferinsur

RUN mkdir /home/inferinsur/pip_output

RUN mkdir /home/inferinsur/shared_folder

COPY renv.lock   /home/inferinsur/renv.lock

#COPY functions /home/LinReg/functions

COPY  Calculation.Rmd /home/inferinsur/Calculation.Rmd

COPY insurance.csv  /home/inferinsur/insurance.csv

# COPY _targets.R /home/housing/_targets.R

RUN R -e "setwd('/home/inferinsur');renv::init();renv::restore()"

RUN cd /home/inferinsur  && R -e "rmarkdown::render('/home/inferinsur/Calculation.Rmd', output_file = '/home/inferinsur/pip_output/Calculation.html')"

CMD mv  /home/inferinsur/pip_output/*  /home/inferinsur/shared_folder/
