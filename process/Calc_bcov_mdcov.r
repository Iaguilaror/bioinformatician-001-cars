#To assign the values of covb to an object
covb <- read.table("covb.txt", header = FALSE)
#To assign the values of regl to an object
regl <- read.table("regl.txt", header= FALSE)
#Perform the arithmetic operation for the calculation of bcov
bcov <- covb / regl * 100
#Change the name of the variable to bcov
names(bcov) = c("bcov")
#To assign the values of seqb to an object
seqb <- read.table("seqb.txt", header = FALSE)
#Perform the arithmetic operation for the calculation of mdcov
mdcov <- seqb / covb
#Change the name of the variable to mdcov
names(mdcov) = c("mdcov")
#Make a table with the information of the loci
datos_loci <- read.table("datos_loci_enc.txt", header = TRUE)
#Join columns
Results <- cbind(datos_loci,bcov,mdcov)
#Export results to csv file
write.csv(Results, file = "Results_bcov_mdcov.csv")