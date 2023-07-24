#
# Copyright 2020 Simone Maestri. All rights reserved.
# Simone Maestri <simone.maestri@univr.it>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

####################################################################################################
##Note: rows starting with '#' are notes for the user, and are ignored by the software
#if do_subsampling_flag <- 1, subsampling of num_fast5_files fast5 files is performed; otherwise set do_subsampling_flag <- 0
do_subsampling_flag <- 0
#num_fast5_files is the number of fast5 files to be subsampled/analysed (if do_subsampling_flag <- 1)
num_fast5_files <- 10
#barcodes from BC01 to BC96
BC_int <- sprintf("%s%02d", "BC", 01:96)
#uncomment the following line if you want to restrict the list of barcodes of interest
#BC_int <- c("BC01", "BC02", "BC03", "BC04", "BC05", "BC06", "BC07", "BC08", "BC09", "BC10", "BC11", "BC12")
#kit
kit <- "SQK-LSK114"
#flowcell chemistry
flowcell <- "FLO-MIN114"
#barcode_kits
barcode_kits <- "EXP-NBD104"
#conf_basecalling_flag <- 1 if you want to specify a configuration file for base-calling (and additional parameters) instead of choosing the default (hac) by specifying kit and flowcell
conf_basecalling_flag <- 0
#conf_par_basecalling is the name of the config file (and additional parameters, such as the device for GPU-accelerated basecalling) in case config_basecalling_flag <- 1
conf_par_basecalling <- " -c dna_r10.4.1_e8.2_400bps_hac --device 'auto' "
#set the maximum number of threads to be used
num_threads <- 8
#trim extra_ends_trimming_length bp from both ends of reads
extra_ends_trimming_length <- 0
#if skip_demultiplexing_flag <- 1 demultiplexing is skipped; otherwise set skip_demultiplexing_flag <- 0
skip_demultiplexing_flag <- 0
#require_two_barcodes_flag <- 1 if you want to keep only reads with a barcode (tag) at both ends of the read; otherwise set require_two_barcodes_flag <- 0
require_two_barcodes_flag <- 1
#min read quality value
min_qual <- 9
#min_seq_length is the minimum sequence length (bp) to be retained
min_seq_length <- 200
#max_seq_length is the maximum sequence length (bp) to be retained
max_seq_length <- 10000000
########################################################################################################
PIPELINE_DIR <- "/path/to/ONT_preprocessing"
#MINICONDA DIR
MINICONDA_DIR <- "/path/to/miniconda3"
#basecaller_dir
BASECALLER_DIR <- "/path/to/ont-guppy-cpu/bin/"
########### End of user editable region #################################################################
#load BioStrings package
suppressMessages(library(Biostrings))
#load stats package
suppressMessages(library(stats))
#path to subsample fast5
subsample_fast5 <- paste0(PIPELINE_DIR, "/subsample_fast5.sh")
#########################################################################################################
#SEQTK
SEQTK <- paste0(MINICONDA_DIR, "/envs/ONT_preprocessing_env/bin/seqtk")
#PYCOQC
PYCOQC <- paste0(MINICONDA_DIR, "/envs/ONT_preprocessing_env/bin/pycoQC")
#NANOFILT
NANOFILT <- paste0(MINICONDA_DIR, "/envs/ONT_preprocessing_env/bin/NanoFilt")
#PORECHOP
PORECHOP <- paste0(MINICONDA_DIR, "/envs/ONT_preprocessing_env/bin/porechop")
