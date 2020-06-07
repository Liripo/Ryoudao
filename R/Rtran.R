#' @title Rtran
#' @param q search word
#' @param from search word Language
#' @param to target Language
#' @param app_key youdao app
#' @param app_secret youdao app sercet
#' @param ... code_digest function param
#' @return translation character
#' @importFrom uuid UUIDgenerate
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @author Liripo
#' @export Rtran
#' @examples
#' Rtran(q = "爱因斯坦",system = "windows")
#'
#' data <- c("math","english","chinese")
#' tran <- sapply(data,Rtran,from = "en",to = "zh-CHS",system = "WINDOWS")
Rtran <- function(q = q,
                  from = "zh-CHS",
                  to = "en",
                  app_key = NULL,
                  app_secret = NULL,
                  ...){
    YOUDAO_URL <-  "https://openapi.youdao.com/api"
    APP_KEY = app_key %||% .APP_KEY
    APP_SECRET = app_secret %||% .APP_SECRET
    q <- q
    salt <- as.character(uuid::UUIDgenerate(TRUE))
    curtime = as.character(floor(as.numeric(Sys.time())))
    signStr <-  paste0(APP_KEY,q,salt,curtime,APP_SECRET)
    sign <- code_digest(str = signStr,...)
    query_params <- list(
        from = from,
        to = to,
        signType = "v3",
        curtime = curtime,
        appKey = APP_KEY,
        q = q,
        salt = salt,
        sign =sign
    )
    response <- httr::GET(YOUDAO_URL,query = query_params)
    data <- httr::content(response,type = "text",encoding = "utf-8")
    last <- jsonlite::fromJSON(data)
    trans <- last$translation
    return(trans)
}
