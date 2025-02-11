# Use the Rocker RStudio 4.4.2 base image
FROM rocker/rstudio:4.4.2

# Set the working directory inside the container
WORKDIR /home/rstudio

# Install additional R packages (optional)
RUN install2.r --error tidyverse

# Expose the default RStudio Server port
EXPOSE 8787

# Command to start RStudio Server
CMD ["/init"]
