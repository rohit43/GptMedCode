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
# This will being open your .Renviron file. Add following in that file and save.
OPENAI_API_KEY="Your OpenAI API Key "
```
### All Set
Now you are ready to rock and roll. Try the following script to get started. This will bring up a dialogue box. Enter the disease of your choice (Diabetes, a default option) and hit return. In few seconds, the mDat will be populated with ICD-10-CM codes for Diabetes. 
```{r}
mDat <- GptMedCode::icd10Promt()
head(mDat)
```
#### Get ICD-9-CM Codes
For diabetes (or the disease of your choice).
```{r}
mDat <- GptMedCode::icd9Promt()
head(mDat)
```
#### Get SNOMED Codes
For diabetes (or the disease of your choice).
```{r}
mDat <- GptMedCode::snomedPromt()
head(mDat)
```

#### Get RxNorms Codes
For Metformin (or the medication of your choice).
```{r}
mDat <- GptMedCode::rxNormPromt()
head(mDat)
```

#### Get LOINC Codes
For Hemoglobin A1c (or the laboratory measurement of your choice).
```{r}
mDat <- GptMedCode::loincPromt()
head(mDat)
```

## Please be careful
The code list returned by this package are from the pre-trained language model (ChatGPT). Please make sure to manually review the codes in case you want to utilize the codes further.

## Comments
Please reach out for discussions, comments, and suggestions. Enjoy and be safe.
