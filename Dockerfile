# Use the Rocker RStudio 4.4.2 base image
FROM rocker/rstudio:4.4.2

# Set working directory inside the container
WORKDIR /home/rstudio

# Switch to root user to install system dependencies
USER root

# Install R package manager {renv}
RUN R -e "install.packages('renv')"

# Switch back to rstudio user
USER rstudio

# Copy renv files from your local project into the container
COPY renv.lock renv/ .Renviron ./

# Restore R packages based on renv.lock
RUN R -e "renv::restore(prompt = FALSE)"

# Copy the R script into the container
COPY script.R /home/rstudio/

# Expose the RStudio Server port
EXPOSE 8787

# Set an environment variable for RStudio password (optional)
ENV PASSWORD="rstudio"

# Start RStudio Server
CMD ["/init"]
