#' @title RxNorm Promt
#'
#' @author Rohit Vashisht
#'
#' @description Use this function to get possible RxNorm codes for a given
#' medication. Precise medication name will help GPT get better RxNorm codes.
#'
#' @return ss A data frame of RxNorm Codes

rxNormPromt <- function(){
  mt <- rstudioapi::showPrompt(title = "NDC",
                               message = "Enter medical term",
                               default = "Metformin Hydrochloride tablet")
  rxnormCode <- openai::create_completion(
    model = "text-davinci-003",
    prompt = paste("Get All RXNORM codes and description for ",
                   mt,
                   sep=""),
    max_tokens = 500,
    temperature = 0.1,
    top_p = 1,
  )
  s <- strsplit(rxnormCode$choices[1,1], "\n")
  ss <- data.frame(V2 = unlist(s))
  x <- which(ss$V2 == "")
  if(length(x)==0){
    ss <- ss
  }else{
    ss <- data.frame(ss[-x,])
  }
  colnames(ss) <- c("rxNormPromt")
  ss$rxNormPromt <- gsub('^[0-9].', '', ss$rxNormPromt)
  ss$rxNormPromt <- gsub('^.', '', ss$rxNormPromt)
  ss$rxNormPromt <- gsub('^ ', '', ss$rxNormPromt)
  colnames(ss) <- c("RxNorm Codes and Description")
  return(ss)
}
