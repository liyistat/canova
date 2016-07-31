#' Calculate observed W statistic of CANOVA without ties
#'
#' W.no.ties
#' @author Yi Li, \email{liyistat@@gmail.com}
#' @param x A vector containing values of a continuous variable (X).
#' @param y A vector containing values of a continuous variable (Y).
#' @param k the neighborhood structure or bin size of the dataset.
#' @return W  The value of observed W statistic of CANOVA without ties.
#' @export
#' @references Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.

W.no.ties<-function(x,y,k){
  if(k<2) {
    print("k should be a positive integer greater than or equal to 2!")
  }else{
    #k is a positive integer
    k<-round(k)
    d<-data.frame(x=x,y=y)
    #sort d
    new<-d[order(d$x),]
    #calculate W
    W=0
    for(i in 2:length(y)){
      for(j in (max((i-k+1),1):(i-1))){
        W<-(new$y[j]-new$y[i])^2+W
      }
    }
    return(W)
  }
}
