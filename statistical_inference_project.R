<h1>Statistical Inference Course Project</h1>

<h2> 1. Simulation Exercises </h2>
  
  <p>The exponential distribution can be simulated in R with 
  <br>rexp(n, lambda) where lambda is the rate parameter. The 
  <br>mean of exponential distribution is 1/lambda and the 
  <br>standard deviation is also also 1/lambda. Set 
  <br>lambda = 0.2 for all of the simulations. 
  <br>In this simulation, you will investigate the 
  <br>distribution of averages of 40 exponential(0.2)s. 
  <br>Note that you will need to do a thousand or so 
  <br>simulated averages of 40 exponentials. </p>

```{r}  
#setting up 
setwd("~/Desktop/statistical_inference_project")
lambda = 0.2 #stated above
n= 40 #stated above
numSim = 1000 #number of simulations, stated above
set.seed(25)
se <- replicate(numSim, rexp(n,lambda));p <-NULL
for (i in 1:numSim){p[i]<-mean(se[,i])}
p <- as.data.frame(p); names(p)<-"mean"
```
<h3>1. Show where the distribution is centered at and compare it to the theoretical center of the distribution.</h3>
<h3>2. Show how variable it is and compare it to the theoretical variance of the distribution.</h3>
<h3>3. Show that the distribution is approximately normal.</h3>
<h3> Evaluate the coverage of the confidence interval for 1/lambda: X¯±1.96Sn√. (This only needs to be done for the specific value of lambda). </h3>
<h2> 2. Basical Inferential Data Analysis</h2>