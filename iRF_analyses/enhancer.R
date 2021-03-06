library(iRF)
n.cores <- 24
set.seed(1)
load('./enhancer.Rdata')

rit.params <- list(depth=5, nchild=2, ntree=500, class.id=1, class.cut=NULL)
fit <-  iRF(x=X[train.id,], 
           y=as.factor(Y[train.id]), 
           xtest=X[test.id,], 
           ytest=as.factor(Y[test.id]), 
           n.iter=1,
           interactions.return=c(1), 
           rit.params=rit.params,
           varnames.grp=varnames.all$Predictor_collapsed, 
           n.core=n.cores, 
           n.bootstrap=1,
           rit.param=rit.params
          )
save(file='results_enhancer.Rdata', fit)


