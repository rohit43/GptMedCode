#' @title LOINC Promt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible LOINC codes for a given
#' laboratory measurement. Precise laboratory measurement names will help GPT
#' get better LOINC codes.
#'
#' @return ss A data frame of LOINC Codes

loincPromt <- function(){
  mt <- rstudioapi::showPrompt(title = "LOINC",
                               message = "Enter medical term",
                               default = "Hemoglobin A1c")
  loincCode <- openai::create_completion(
    model = "text-davinci-003",
    prompt = paste("Get All LOINC codes and description for ",
                   mt,
                   sep=""),
    max_tokens = 500,
    temperature = 0.1,
    top_p = 1,
  )
  s <- strsplit(loincCode$choices[1,1], "\n")
  ss <- data.frame(V2 = unlist(s))
  x <- which(ss$V2 == "")
  if(length(x)==0){
    ss <- ss
  }else{
    ss <- data.frame(ss[-x,])
  }
  colnames(ss) <- c("loincPromt")
  ss$loincPromt <- gsub('^[0-9].', '', ss$loincPromt)
  ss$loincPromt <- gsub('^.', '', ss$loincPromt)
  ss$loincPromt <- gsub('^ ', '', ss$loincPromt)
  colnames(ss) <- c("LOINC Codes and Description")
  return(ss)
}
