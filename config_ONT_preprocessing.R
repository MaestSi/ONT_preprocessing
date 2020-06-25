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
#BC_int <- c("BC01", "BC02", "BC03", "BC04", "BC05", "BC06", "BC07", "BC08", "BC09", "BC10", "BC11", "BC12")
BC_int <- c("BC01", "BC02", "BC03", "BC04", "BC05", "BC06", "BC07", "BC08", "BC09", "BC10", "BC11", "BC12")
#kit (1D/1D^2 reads/rapid 16S)
kit <- "SQK-LSK109"
#flowcell chemistry (R9.4/R9.5/R10 chemistry)
flowcell <- "FLO-MIN106"
#barcode_kits <- c("EXP-NBD103", "EXP-NBD104", "EXP-NBD114", "EXP-PBC001", "EXP-PBC096", "SQK-16S024", "SQK-LWB001", "SQK-PBK004", "SQK-PCB109", "SQK-RAB201", "SQK-RAB204", "SQK-RBK001", "SQK-RBK004", "SQK-RLB001", "SQK-RPB004", "VSK-VMK001", "VSK-VMK002")
barcode_kits <- "EXP-NBD104"
#gpu_basecalling_flag <- 1 if you want to perform GPU-accelerated basecalling
gpu_basecalling_flag <- 0
#conf_par_gpu is the name of the config file and the device for GPU-accelerated basecalling in case gpu_basecalling_flag <- 1
conf_par_gpu <- " -c dna_r9.4.1_450bps_hac.cfg --device 'auto' "
#fast_basecalling_flag_cpu <- 1 if you want to use the fast basecalling algorithm for R9.4 flow-cell; otherwise set fast_basecalling_flag_cpu <- 0 if you want to use the accurate but slow one
fast_basecalling_flag_cpu <- 1
#pair_strands_flag_cpu <- 1 if, in case a 1d2 kit and FLO-MIN107 flow-cell have been used, you want to perform 1d2 basecalling; otherwise set pair_strands_flag_cpu <- 0
pair_strands_flag_cpu <- 0
#set the maximum number of threads to be used
num_threads <- 32
#set length [bp] of PCR primers to be trimmed at both sides; if no primers were used set primers_length <- 0
primers_length <- 0
#if skip_demultiplexing_flag <- 1 demultiplexing is skipped; otherwise set skip_demultiplexing_flag <- 0
skip_demultiplexing_flag <- 0
#require_two_barcodes_flag <- 1 if you want to keep only reads with a barcode (tag) at both ends of the read; otherwise set require_two_barcodes_flag <- 0
require_two_barcodes_flag <- 0
#min read quality value
min_qual <- 7
#min_seq_length is the minimum sequence length to be retained
min_seq_length <- 200
#max_seq_length is the maximum sequence length to be retained
max_seq_length <- 10000000
########################################################################################################
PIPELINE_DIR <- "/path/to/ONT_preprocessing_pipeline"
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
