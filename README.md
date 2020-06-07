```R
devtools::install_github("Liripo/Ryoudao")
```

## 使用示例，就一个函数
```R
Rtran(q = "爱因斯坦"，system = "windows")
### 或者
library(ggplot2)
sapply(row.names(mtcars),Rtran,from = "en",to = "zh-CHS")
```
Rtran即为翻译函数

