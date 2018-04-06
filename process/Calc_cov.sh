#! /bin/bash
# Separate the loci in different files
awk '/GOLDEN_GENE1/' raw_coverages_by_base.txv.txt > Locus_GG1.txt
awk '/UNWANTED_REGION1/' raw_coverages_by_base.tsv.txt > Locus_UR1.txt
awk '/GOLDEN_GENE2/' raw_coverages_by_base.tsv.txt > Locus_GG2.txt
awk '/UNWANTED_REGION2/' raw_coverages_by_base.tsv.txt > Locus_UR2.txt
awk '/GOLDEN_GENE3/' raw_coverages_by_base.tsv.txt > Locus_GG3.txt

#Create a list of the last files.
ls Locus* > Lista_loci.txt

#Calculate covb (Number of bases in the genomic region covered by at last one sequencing read)
for i in $(cat Lista_loci.txt); do awk '$6>1 {print $6}' "$i" | wc -l; done > covb.txt
#Send the file covb.txt to the directory of projecto in R
cp /home/Carlos_Rios/WinterGenomics/covb.txt /mnt/c/Users/carlo/Documents/R/WinterGenomics

#Calculate  regl (Lenght of the genomic region, in bases) 
for i in $(cat Lista_loci.txt); do awk '$6>=0 {print $6}' "$i" | wc -l; done > regl.txt
#Send the file regl.txt to directory of project in R
cp /home/Carlos_Rios/WinterGenomics/regl.txt /mnt/c/Users/carlo/Documents/R/WinterGenomics

#Calculate seqb (Sum of depth by base from every covered base)
for i in $(cat Lista_loci.txt); do awk '{total  += $6} END {print total}' "$i"; done > seqb.txt
#Send the file seqb.txt to directory of project in R
cp /home/Carlos_Rios/WinterGenomics/seqb.txt /mnt/c/Users/carlo/Documents/R/WinterGenomics

#Create a table with the information of the loci
for i in $(cat Lista_loci.txt); do awk '{if ($5 == 1) {print $1, $2, $3, $4}}' "$i"; done > datos_loci.txt
#Send the file datos_loci.txt to directory of project in R
cp /home/Carlos_Rios/WinterGenomics/datos_loci.txt /mnt/c/Users/carlo/Documents/R/WinterGenomics
