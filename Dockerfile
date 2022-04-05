FROM continuumio/miniconda3

########### set variables
ENV DEBIAN_FRONTEND noninteractive

########## generate working directories
RUN mkdir /home/tools

######### dependencies
RUN apt-get update -qq \
    && apt-get install -y \
    build-essential \
    wget \
    unzip \
    bzip2 \
    git \
    libidn11* \
    nano \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

############################################################ install ONT_preprocessing
WORKDIR /home/tools/

RUN git clone https://github.com/MaestSi/ONT_preprocessing.git
WORKDIR /home/tools/ONT_preprocessing
RUN chmod 755 *

RUN sed -i 's/PIPELINE_DIR <- .*/PIPELINE_DIR <- \"\/home\/tools\/ONT_preprocessing\/\"/' config_ONT_preprocessing.R
RUN sed -i 's/MINICONDA_DIR <- .*/MINICONDA_DIR <- \"\/opt\/conda\/\"/' config_ONT_preprocessing.R

RUN conda config --add channels r && \
conda config --add channels anaconda && \
conda config --add channels conda-forge && \
conda config --add channels bioconda

RUN conda create -n ONT_preprocessing_env bioconductor-biostrings
RUN conda install -n ONT_preprocessing_env seqtk NanoFilt porechop
RUN /opt/conda/envs/ONT_preprocessing_env/bin/python -m pip install pycoQC

WORKDIR /home/
