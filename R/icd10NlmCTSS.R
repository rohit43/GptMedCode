#' @title ICD-10-CM NLM CTSS
#'
#' @author Rohit Vashisht, Daniel Donoho, MD (Twitter handel ddonoho)
#'
#' @description Use this function to get possible ICD10-CM codes for a given
#' disease term based on NLM Clinical Table Search Service. This excellent
#' update was suggested by Daniel Donoho, MD (Twitter handel ddonoho). This
#' is a reference function that can be used to obtain ICD-10-CM codes from the
#' NLM clinical table search service and can be reffered to check the quality
#' of the codes returned by the ChatGPT. We thank NLM clinical table search
#' service for their excellent work and providing the information.  
#'
#' @return icdCode A data frame of ICD-10-CM Codes

icd10NlmCTSS <- function(){
  mt <- rstudioapi::showPrompt(title = "ICD10",
                               message = "Enter a disease prompt",
                               default = "Diabetes")
  icdCode <- RCurl::getURL(paste("https://clinicaltables.nlm.nih.gov/api/icd10cm/v3/search?sf=code,name&terms=",
  mt, "&maxList=500", sep = ""))
  icdCode <- strsplit(icdCode, "null")
  icdCode <- strsplit(icdCode[[1]][2], "\\],\\[")
  icdCode <- data.frame(unlist(icdCode))
  colnames(icdCode) <- c("NlmCTSS")
  icdCode$NlmCTSS <- gsub("\"","", icdCode$NlmCTSS)
  icdCode$NlmCTSS <- gsub("\\[","", icdCode$NlmCTSS)
  icdCode$NlmCTSS <- gsub("^,","", icdCode$NlmCTSS)
  icdCode <- data.frame(stringr::str_split_fixed(icdCode$NlmCTSS, ",", 2))
  colnames(icdCode) <- c("ICD10CM_NlmCTSS", "Name")
  return(icdCode)
}
