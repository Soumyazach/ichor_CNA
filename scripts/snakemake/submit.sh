#!/bin/bash
#
#SBATCH --job-name=ichorCNA
#SBATCH --output=out.ichoCNA.txt
#
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=short
#SBATCH --mem=8G
#SBATCH -t 8:00:00

srun snakemake -s ichorCNA.snakefile -j 100 -pr --rerun-incomplete --latency-wait 60 --cluster-config cluster.json --cluster "sbatch -p {cluster.partition} --mem={cluster.mem} -t {cluster.time} -c {threads}"
