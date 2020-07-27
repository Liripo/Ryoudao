# 下载
```R
if(!require("devtools"))install.package("devtools")
devtools::install_github("Liripo/Ryoudao")
```
>devtols没有系统权限很难安装，可以使用remotes包下载。

## 使用示例，就一个函数
```R
#默认自动识别使用系统，当然你可以指定你的操作系统，比如
Rtran(q = "爱因斯坦"，system = "windows")
### 或者
library(ggplot2)
sapply(row.names(mtcars),Rtran,from = "en",to = "zh-CHS")
```

