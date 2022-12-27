#' @title LOINC Prompt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible LOINC codes for a given
#' laboratory measurement. Precise laboratory measurement names will help chatGPT
#' get better LOINC codes.
#'
#' @return ss A data frame of LOINC Codes

loincPrompt <- function(){
  mt <- rstudioapi::showPrompt(title = "LOINC",
                               message = "Enter a laboratory measurement prompt",
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
  colnames(ss) <- c("LOINC Codes and Description")
  return(ss)
}
