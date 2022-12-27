#' @title ICD-9-CM Promt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible ICD-9-CM codes for a given
#' disease. Precise disease names will help GPT get better ICD-9-CM codes.
#'
#' @return ss A data frame of ICD-9-CM Codes

icd9Promt <- function(){
  mt <- rstudioapi::showPrompt(title = "ICD9",
                         message = "Enter medical term",
                         default = "Diabetes")
  icdCode <- openai::create_completion(
    model = "text-davinci-003",
    prompt = paste("Get All ICD-9-CM Codes and description for ",
                   mt,
                   sep=""),
    max_tokens = 500,
    temperature = 0.1,
    top_p = 1,
  )
  s <- strsplit(icdCode$choices[1,1], "\n")
  ss <- data.frame(V2 = unlist(s))
  x <- which(ss$V2 == "")
  if(length(x)==0){
    ss <- ss
  }else{
    ss <- data.frame(ss[-x,])
  }
  colnames(ss) <- c("icd9Promt")
  ss$icd9Promt <- gsub('^[0-9].', '', ss$icd9Promt)
  ss$icd9Promt <- gsub('^.', '', ss$icd9Promt)
  ss$icd9Promt <- gsub('^ ', '', ss$icd9Promt)
  colnames(ss) <- c("ICD-9-CM Codes and Description")
  return(ss)
}
