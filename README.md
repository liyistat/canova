# Recommended canova package installation
```{r}
source("https://raw.githubusercontent.com/liyistat/install_github_package/master/install_github.R");
install_github("liyistat/canova")
library(canova);
```

# Install canova package by devtools
```{r}
install.packages(c("snow"));
devtools::install_github("liyistat/canova");
library(canova);
```

# You can also install package dependencies by install_github
```{r}
devtools::install_github("cran/snow");
devtools::install_github("liyistat/canova");
library(canova);
```

# Reference
Wang Y, Li Y, Cao H, et al. Efficient test for nonlinear dependence of two continuous variables[J]. BMC bioinformatics, 2015, 16(1): 1.
https://github.com/liyistat/canova
