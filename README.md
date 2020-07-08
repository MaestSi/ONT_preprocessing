# ONT_preprocessing
**ONT_preprocessing** is a preprocessing pipeline for ONT data.

## Getting started

**Prerequisites**

* Miniconda3.
Tested with conda 4.8.3.
```which conda``` should return the path to the executable.
If you don't have Miniconda3 installed, you could download and install it with:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod 755 Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
```

Then, after completing _ONT_preprocessing_ installation, set the _MINICONDA_DIR_ variable in **config_ONT_preprocessing.R** to the full path to miniconda3 directory.

* Guppy, the software for basecalling and demultiplexing provided by ONT. Tested with Guppy v4.0.
If you don't have [Guppy](https://community.nanoporetech.com/downloads) installed, choose an appropriate version and install it.
For example, you could download and unpack the archive with:
```
wget /path/to/ont-guppy-cpu_version_of_interest.tar.gz
tar -xf ont-guppy-cpu_version_of_interest.tar.gz
```
A directory _ont-guppy-cpu_ should have been created in your current directory.
Then, after completing _ONT_preprocessing_ installation, set the _BASECALLER_DIR_ variable in **config_ONT_preprocessing.R** to the full path to _ont-guppy-cpu/bin_ directory.

**Installation**

```
git clone https://github.com/MaestSi/ONT_preprocessing.git
cd ONT_preprocessing
chmod 755 *
./install.sh
```

A conda environment named _ONT_preprocessing\_env_ is created, where seqtk, NanoFilt, pycoQC, Porechop and R with package Biostrings are installed.
Then, you can open the **config_ONT_pipeline.R** file with a text editor and set the variables _PIPELINE_DIR_ and _MINICONDA_DIR_ to the value suggested by the installation step.

## Usage
**Launch_ONT_preprocessing.sh**

Usage:
Launch_ONT_preprocessing.sh \<fast5_dir\>

Note: modify **config_ONT_preprocessing.R** before running; the script runs the preprocessing pipeline from raw fast5 files to filtered reads.

Input
* \<fast5_dir\>: directory containing raw fast5 files

Outputs (saved in \<fast5_dir\>\_analysis/analysis):

* \<"sample_name".fastq\>: filtered reads in fastq format
* \<"sample_name".fasta\>: filtered reads in fasta format
* logfile.txt: logfile tracking the options used and the number of filtered reads

Outputs (saved in \<fast5_dir\>\_analysis/qc):
* Read length distributions and pycoQC report

Outputs (saved in \<fast5_dir\>\_analysis/basecalling):
* Temporary files for basecalling

Outputs (saved in \<fast5_dir\>\_analysis/preprocessing):
* Temporary files for demultiplexing, filtering based on read length and quality and adapters trimming

## Citation

If this tool is useful for your work, please consider citing our [manuscript](https://www.mdpi.com/2073-4425/10/6/468).

Maestri S, Cosentino E, Paterno M, Freitag H, Garces JM, Marcolungo L, Alfano M, Njunjić I, Schilthuizen M, Slik F, Menegon M, Rossato M, Delledonne M. A Rapid and Accurate MinION-Based Workflow for Tracking Species Biodiversity in the Field. Genes. 2019; 10(6):468.
