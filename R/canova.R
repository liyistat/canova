#' CANOVA (continuous analysis of variance)
#'
#' CANOVA: Efficient test for nonlinear dependence of two continuous variables.
#' Testing dependence/correlation of two variables is one of the fundamental tasks in statistics.
#' In this work,we proposed a new way of testing nonlinear dependence between two continuous variables (X and Y).
#' We addressed this research question by using CANOVA and developed its R package 'canova'.
#' In the CANOVA framework, we first defined a neighborhood for each data point related to its X value, and then
#' calculated the variance of the Y value within the neighborhood. Finally, we performed permutations
#' to evaluate the significance of the observed values within the neighborhood variance.
#' @author Yi Li, \email{liyistat@@gmail.com}
#' @param x A vector containing values of a continuous variable (X).
#' @param y A vector containing values of a continuous variable (Y).
#' @param k the neighborhood structure or bin size of the dataset.
#' @param perm the number of permutations to calculate permutation pvalues.
#' @param tie_shuffle the number of random shuffle times when there are ties in X.
#' @param clusters the number of "SOCK" cluster type slave nodes to implement parallel computing on the local machine.
#' @return result   A list of CANOVA pvalue, Parameter K and Number of Permutations.
#' @export
#' @references Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.
#' @examples
#' #Example1
#' #Generate random variables X and Y
#' x<-rnorm(1000)
#' y<-rnorm(1000)
#' #Test whether X and Y are independent or not using canova function
#' #Load the canova package
#' library(canova)
#' #Set the parameters: k=2, perm=1000, tie_shuffle=100, clusters=8
#' t1<- Sys.time()
#' canova(x,y,k=2,perm=1000,tie_shuffle=100,clusters=8)
#' t2<- Sys.time()
#' #Output calculation time of canova
#' t2-t1
#'
#' #Example2
#' #Generate random variables X and Y with sin function
#' x<-runif(1000)
#' noise<-rnorm(1000)
#' y<-sin(x)+noise
#' #Test whether X and Y are independent or not using canova function
#'library(canova)
#' t1<- Sys.time()
#' #Set the parameters: k=2, perm=10000, tie_shuffle=100, clusters=8
#' canova(x,y,k=2,perm=10000,tie_shuffle=100,clusters=8)
#' t2<- Sys.time()
#' #Output calculation time of canova
#' t2-t1
canova<-function(x,y,k=2,perm=1000,tie_shuffle=100,clusters=8){
observed_W<-observed.W(x,y,k,tie_shuffle)
permutations<-permutation.W(x,y,k,perm,clusters)
pvalue<-length(which(permutations<=observed_W))/perm
result<-cbind(pvalue,k,perm)
colnames(result)<-c("CANOVA_Pvalue","Parameter_K","Number_of_Permutations")
return(result)
}


