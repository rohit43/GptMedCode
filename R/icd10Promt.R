#' @title ICD-10-CM Promt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible ICD10-CM codes for a given
#' disease. Precise disease names will help GPT get better ICD-10-CM codes.
#'
#' @return ss A data frame of ICD-10-CM Codes

icd10Promt <- function(){
  mt <- rstudioapi::showPrompt(title = "ICD9",
                               message = "Enter medical term",
                               default = "Diabetes")
  icdCode <- openai::create_completion(
    model = "text-davinci-003",
    prompt = paste("Get All ICD-10-CM Codes and description for ",
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
  #colnames(ss) <- c("icd10Promt")
  #ss$icd10Promt <- gsub('^[0-9].', '', ss$icd10Promt)
  #ss$icd10Promt <- gsub('^.', '', ss$icd10Promt)
  #ss$icd10Promt <- gsub('^ ', '', ss$icd10Promt)
  colnames(ss) <- c("ICD-10-CM Codes and Description")
  return(ss)
}
