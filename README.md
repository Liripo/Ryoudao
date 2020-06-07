# 下载
```R
if(!require("devtools"))install.package("devtools")
devtools::install_github("Liripo/Ryoudao")
```
>devtols没有系统权限很难安装，可以使用remotes包下载。

## 使用示例，就一个函数
```R
Rtran(q = "爱因斯坦"，system = "windows")
### 或者
library(ggplot2)
sapply(row.names(mtcars),Rtran,from = "en",to = "zh-CHS")
```

