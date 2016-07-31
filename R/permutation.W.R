#' Parallel computing permutations of W statistic of CANOVA
#'
#' permutation.W
#' @author Yi Li, \email{liyistat@@gmail.com}
#' @param x A vector containing values of a continuous variable (X).
#' @param y A vector containing values of a continuous variable (Y).
#' @param k the neighborhood structure or bin size of the dataset.
#' @param perm the number of permutations to calculate permutation pvalues.
#' @param clusters the number of "SOCK" cluster type slave nodes to implement parallel computing on the local machine.
#' @return permutations The permutations of observed W statistic of CANOVA.
#' @export
#' @references Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.

permutation.W<-function(x,y,k,perm,clusters){
  cl <- snow::makeCluster(clusters)
  snow::clusterEvalQ(cl, random.W<-function(x,y,k){
    if(k<2) {
      print("k should be a positive integer greater than or equal to 2!")
    }else{
      #k is a positive integer
      k<-round(k)
      d<-data.frame(x=x,y=y)
      y<-d$y
      y<-sample(y)
      #calculate W
      random_W=0
      for(i in 2:length(y)){
        for(j in (max((i-k+1),1):(i-1))){
          random_W<-(y[j]-y[i])^2+random_W
        }
      }
      return(random_W)
    }
  }
  )
  num<-c(1:perm)
  permutations<-snow::parSapply(cl,num,function(num) random.W(x,y,k))
  snow::stopCluster(cl)
  return(permutations)
}
