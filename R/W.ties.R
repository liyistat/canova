#' Calculate observed W statistic of CANOVA with ties
#' W.ties
#' @author Yi Li, \email{liyistat@@gmail.com}
#' @param x A vector containing values of a continuous variable (X).
#' @param y A vector containing values of a continuous variable (Y).
#' @param k the neighborhood structure or bin size of the dataset.
#' @param tie_shuffle the number of random shuffle times when there are ties in X.
#' @return W  The value of observed W statistic of CANOVA with ties.
#' @export
#' @references Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.


W.ties<-function(x,y,k,tie_shuffle){
  if(k<2){
    print("k should be a positive integer greater than or equal to 2!")
  }else{
    #k is a positive integer
    k<-round(k)
    d<-data.frame(x=x,y=y)
    W<-rep(0,tie_shuffle)
    for(m in 1:tie_shuffle){
    #sort d
    new<-d[order(rank(d$x,ties.method="random")),]
    #calculate W
    W[m]=0
    for(i in 2:length(y)){
      for(j in (max((i-k+1),1):(i-1))){
        W[m]<-(new$y[j]-new$y[i])^2+ W[m]
      }
    }
    }
    return(mean(W))
  }
}
