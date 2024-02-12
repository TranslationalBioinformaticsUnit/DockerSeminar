# USE AN OFFICIAL PUBLIC R IMAGE
FROM r-base:4.2.2

# SET WORK DIR
WORKDIR /app

# COPY FILES -> DIRECTORY APP IN THE IMAGE
COPY dockerExercise1.R /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev


# INSTALL R PACKAGES
RUN R -e "install.packages('BiocManager', repos='http://cran.r-project.org')"
RUN R -e "BiocManager::install('limma')"
RUN R -e "BiocManager::install('GEOquery')"
RUN R -e "BiocManager::install('edgeR')"

# COMMAND TO RUN THE R SCRIPT
CMD Rscript dockerExercise1.R
