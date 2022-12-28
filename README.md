## Get Codes  
This package may be utilized to obtain ICD-9-CM, ICD-10-CM, SNOMEDs, RxNorms, LOINC codes for given disease, drugs or laboratory terms. The codes are obtained using pre-trained model ‘text-davinci-003’. Please make sure to manually review the codes before using them further. I personally always manually review the codes before using them irrespective of the source. Enjoy, and have fun!

## Set up and use
Setting and using this package is very simple. You will need an OpenAI API key (please see this https://beta.openai.com/). Please follow the following steps once you have the API key. 

### Install the package
Use following to install the package.
```{r}
devtools:: install_github("rohit43/GptMedCode")
```
### Set up environment
Set up your R environment with the OpenAI key as follows
```{r}
usethis::edit_r_environ()
# This will open your .Renviron file. Add following in that file and save.
OPENAI_API_KEY="Your OpenAI API Key "
```
### All Set
Now you are ready to rock and roll. Try the following script to get started. This will bring up a dialogue box. Enter the disease of your choice (Diabetes, a default option) and hit return. In few seconds, the mDat will be populated with ICD-10-CM codes for Diabetes. 
```{r}
mDat <- GptMedCode::icd10Prompt()
head(mDat)
```
#### Get ICD-9-CM Codes
For diabetes (or the disease of your choice).
```{r}
mDat <- GptMedCode::icd9Prompt()
head(mDat)
```
#### Get SNOMED Codes
For diabetes (or the disease of your choice).
```{r}
mDat <- GptMedCode::snomedPrompt()
head(mDat)
```

#### Get RxNorms Codes
For Metformin (or the medication of your choice).
```{r}
mDat <- GptMedCode::rxNormPrompt()
head(mDat)
```

#### Get LOINC Codes
For Hemoglobin A1c (or the laboratory measurement of your choice).
```{r}
mDat <- GptMedCode::loincPrompt()
head(mDat)
```

## Please be careful
The code list returned by this package are from the pre-trained language model (ChatGPT). Please make sure to manually review the codes in case you want to utilize the codes further.

## New additions
Thanks to Daniel Donoho, MD (Twitter @ddonoho) for suggesting (https://twitter.com/ddonoho/status/1607878698870382594?s=20&t=WVQFX1s6T-QUVH5-lUks6g) to add codes from NLM CTSS (https://clinicaltables.nlm.nih.gov/). One can use the function ICD10NlmCTSS.R to obtain the ICD-10-CM codes for a given disease prompt (default Diabetes) from the NLM CTTS to help compare the codes returned by the ChatGPT prompt. 

## Comments
Please reach out for discussions, comments, and suggestions. Enjoy and be safe.
