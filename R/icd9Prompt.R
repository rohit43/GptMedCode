#' @title ICD-9-CM Prompt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible ICD-9-CM codes for a given
#' disease. Precise disease names will help chatGPT get better ICD-9-CM codes.
#'
#' @return ss A data frame of ICD-9-CM Codes

icd9Prompt <- function(){
  mt <- rstudioapi::showPrompt(title = "ICD9",
                         message = "Enter a disease prompt",
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
  colnames(ss) <- c("ICD-9-CM Codes and Description")
  return(ss)
}
