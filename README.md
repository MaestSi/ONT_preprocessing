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

* Guppy, the software for basecalling and demultiplexing provided by ONT. Tested with Guppy v6.0.
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

Otherwise, you can download a docker image with:

```
docker pull maestsi/ont_preprocessing:latest
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

If this tool is useful for your work, please consider citing our [ma](https://www.mdpi.com/1422-0067/21/23/9177)[nu](https://www.mdpi.com/2076-0817/11/2/199)[scripts](https://www.mdpi.com/2223-7747/11/6/779).

Maestri, S.; Maturo, M.G.; Cosentino, E.; Marcolungo, L.; Iadarola, B.; Fortunati, E.; Rossato, M.; Delledonne, M. A Long-Read Sequencing Approach for Direct Haplotype Phasing in Clinical Settings. Int. J. Mol. Sci. 2020, 21, 9177.

Marcolungo L, Passera A, Maestri S, Segala E, Alfano M, Gaffuri F, Marturano G, Casati P, Bianco PA, Delledonne M. Real-Time On-Site Diagnosis of Quarantine Pathogens in Plant Tissues by Nanopore-Based Sequencing. Pathogens. 2022 Feb 2;11(2):199.

Tarquini, G.; Martini, M.; Maestri, S.; Firrao, G.; Ermacora, P. The Virome of ‘Lamon Bean’: Application of MinION Sequencing to Investigate the Virus Population Associated with Symptomatic Beans in the Lamon Area, Italy. Plants 2022, 11, 779.
