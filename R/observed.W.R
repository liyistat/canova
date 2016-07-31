#' Calculate observed W statistic of CANOVA
#'
#' observed.W
#' @author Yi Li, \email{liyistat@@gmail.com}
#' @param x A vector containing values of a continuous variable (X).
#' @param y A vector containing values of a continuous variable (Y).
#' @param k the neighborhood structure or bin size of the dataset.
#' @param tie_shuffle the number of random shuffle times when there are ties in X.
#' @return observed_W  The value of observed W statistic of CANOVA with or without ties.
#' @export
#' @references Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.

observed.W<-function(x,y,k,tie_shuffle){
  #detect whether there are ties or not
  observed_W<-ifelse((length(which(duplicated(x)==T))==0),W.no.ties(x,y,k),W.ties(x,y,k,tie_shuffle))
  return(observed_W)
}
