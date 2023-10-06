FROM condaforge/mambaforge:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8  
ENV LC_ALL C.UTF-8

# Update and create base image
RUN apt-get --allow-releaseinfo-change update &&\
    apt-get update -y &&\
    apt-get install -y gcc g++ make libz-dev &&\
    apt-get clean

# Add yml file for conda environment
ADD envs/spoc.yml /temp/install/

# install packages
RUN mamba env update -n base --f /temp/install/spoc.yml &&\
    mamba list > software_versions_conda.txt

# clean up install

RUN rm -rf /temp/install

CMD ["/bin/bash"]