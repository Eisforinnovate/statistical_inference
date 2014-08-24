<h2><u> 2. Basical Inferential Data Analysis</u></h2>



<h3>1.Load the ToothGrowth data and perform some basic exploratory data analyses</h3>

```r
library(datasets); data(ToothGrowth); require(ggplot2); require(gridExtra)
```

```
## Loading required package: ggplot2
## Loading required package: gridExtra
## Loading required package: grid
```
<h3>2.Provide a basic summary of the data.</h3>
<p>We cannot yet assume that dosage or supplement type does not have a noticeable effect so we will begin by testing the null hypotheses of the combined effects of dosage and supplement separately.

Based on the boxplot, we can hypothesize that the orange juice is more effective than ascorbic acid in inducing tooth growth when the dose is 0.5 or 1 mg, but equivalent when the dose is 2 mg. Similarly, the tooth growth appears to increase with an increased dosage regardless of supplement. </p>

<h3>3.Use confidence intervals and hypothesis tests to compare tooth growth by supp and dose. (Use the techniques from class even if there's other approaches worth considering)</h3>
<p>Based on the exploratory data analysis, the null hypotheses to test will be (in groupings a, b, and c):

μOJ,0.5=μVC,0.5,μOJ,1.0=μVC,1.0,μOJ,2.0=μVC,2.0
μOJ,0.5=μOJ,1.0,μOJ,0.5=μOJ,2.0,μOJ,1.0=μOJ,2.0
μVC,0.5=μVC,1.0,μVC,0.5=μVC,2.0,μVC,1.0=μVC,2.0
</p>

```r
tg0.5<-subset(tg,dose == "0.5"); tg1<-subset(tg,dose == "1"); tg2<-subset(tg,dose == "2") #Group (a)
```

```
## Error: object 'tg' not found
```

```
## Error: object 'tg' not found
```

```
## Error: object 'tg' not found
```

```r
tg.vc0.5_1<-subset(tg,supp == "VC" & dose != 2); tg.vc0.5_2<-subset(tg,supp == "VC" & dose != 1); tg.vc1_2<-subset(tg,supp == "VC" & dose != 0.5) # Group (b)
```

```
## Error: object 'tg' not found
```

```
## Error: object 'tg' not found
```

```
## Error: object 'tg' not found
```

```r
tg.oj0.5_1<-subset(tg,supp == "OJ" & dose != 2); tg.oj0.5_2<-subset(tg,supp == "OJ" & dose != 1); tg.oj1_2<-subset(tg,supp == "OJ" & dose != 0.5) # Group (c)
```

```
## Error: object 'tg' not found
```

```
## Error: object 'tg' not found
```

```
## Error: object 'tg' not found
```


```r
rbind(
as.vector(t.test(len~supp,paired = FALSE, var.equal = FALSE, data = tg0.5)$conf.int),
as.vector(t.test(len~supp,paired = FALSE, var.equal = FALSE, data = tg1)$conf.int),
as.vector(t.test(len~supp,paired = FALSE, var.equal = FALSE, data = tg2)$conf.int),
as.vector(t.test(len~dose,paired = FALSE, var.equal = FALSE, data = tg.vc0.5_1)$conf.int),
as.vector(t.test(len~dose,paired = FALSE, var.equal = FALSE, data = tg.vc0.5_2)$conf.int),
as.vector(t.test(len~dose,paired = FALSE, var.equal = FALSE, data = tg.vc1_2)$conf.int),
as.vector(t.test(len~dose,paired = FALSE, var.equal = FALSE, data = tg.oj0.5_1)$conf.int),
as.vector(t.test(len~dose,paired = FALSE, var.equal = FALSE, data = tg.oj0.5_2)$conf.int),
as.vector(t.test(len~dose,paired = FALSE, var.equal = FALSE, data = tg.oj1_2)$conf.int)
)
```

```
## Error: object 'tg0.5' not found
```
<h3>4.State your conclusions and the assumptions needed for your conclusions.</h3>
<p>As seen in the t.test functions, we did not assume an equal variance in the distribution of the data set. Additionally, it was assumed that the data points were not paired because it is noted in the data set description that 10 guinea pigs were tested for each dose level combined with each delivery method.

With those assumptions, we observe if the difference in means falls within the 95% confidence interval. The results are as follows for these hypotheses (listed again for reference):

μOJ,0.5=μVC,0.5: Reject H0. μOJ,1.0=μVC,1.0: Reject H0. μOJ,2.0=μVC,2.0: Fail to reject H0
μOJ,0.5=μOJ,1.0: Reject H0. μOJ,0.5=μOJ,2.0: Reject H0. μOJ,1.0=μOJ,2.0: Reject H0.
μVC,0.5=μVC,1.0: Reject H0. μVC,0.5=μVC,2.0: Reject H0. μVC,1.0=μVC,2.0: Reject H0.
All null hypotheses comparing means were rejected except for when the ascorbic acid and orange juice were delivered in 2 mg quantities. We can now conclude that the dosage size is likely a significant factor at these levels when comparing within the same delivery method, 0.5 mg and 1 mg quantities of orange juice will likely induce more tooth growth than the same amounts of ascorbic acid, and for 2 mg of either orange juice or ascorbic acid the tooth growth is likely to be equivalent.</p>
