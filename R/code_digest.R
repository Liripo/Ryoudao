#' @title digest sha256
#' @importFrom digest digest
#' @author Liripo
#' @param system "Linux" or "Windows"
#' @param str sha256
code_digest <- function(str = str,system = "Linux"){
    type <- c("LINUX","WINDOWS")
    system <- match.arg(toupper(system),type)
    str <- str
    Encoding(str) <- "bytes"
    if (system == "WINDOWS"){
        str <- iconv(str,from = "GB18030",to = "UTF-8")
        Encoding(str) <- "bytes"
    }
    sign <- digest::digest(str,algo = "sha256",serialize = F)
}
