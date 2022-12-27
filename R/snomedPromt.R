#' @title SNOMED Promt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible SNOMED codes for a given
#' disease. Precise disease names will help GPT get better SNOMED codes.
#'
#' @return ss A data frame of SNOMED Codes

snomedPromt <- function(){
  mt <- rstudioapi::showPrompt(title = "SNOMED",
                               message = "Enter medical term",
                               default = "Diabetes")
  snomedCode <- openai::create_completion(
    model = "text-davinci-003",
    prompt = paste("Get All SNOMED Codes and description for ",
                   mt,
                   sep=""),
    max_tokens = 500,
    temperature = 0.1,
    top_p = 1,
  )
  s <- strsplit(snomedCode$choices[1,1], "\n")
  ss <- data.frame(V2 = unlist(s))
  x <- which(ss$V2 == "")
  if(length(x)==0){
    ss <- ss
  }else{
    ss <- data.frame(ss[-x,])
  }
  colnames(ss) <- c("snomedPromt")
  ss$snomedPromt <- gsub('^[0-9].', '', ss$snomedPromt)
  ss$snomedPromt <- gsub('^.', '', ss$snomedPromt)
  ss$snomedPromt <- gsub('^ ', '', ss$snomedPromt)
  colnames(ss) <- c("SNOMED Codes and Description")
  return(ss)
}
