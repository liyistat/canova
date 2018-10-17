# Install canova package by devtools
```{r}
install.packages(c("snow"));
devtools::install_github("liyistat/canova", force =T);
library(canova);
```

# You can also install package dependencies by install_github
```{r}
devtools::install_github("cran/snow", force =T);
devtools::install_github("liyistat/canova", force =T);
library(canova);
```

# Reference
Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.
