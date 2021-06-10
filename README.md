# sMRI_ChronicPain
ALE Meta-Analysis of Structural Imaging Studies in Patients with Chronic Pain versus Healthy Controls


## Project Lead
Alina T. Henn

## Faculty Leads
Theodore D. Satterthwaite

Lisa Wagels

## Analytic Replicator
Azeez Adebimpe

## Collaborators
Bart Larsen, Anna Xu, Cobb Scott, Robert Dworkin, Ute Habel, Simon Eickhoff, Claudia Eickhoff

## Project Start Date
January 2020

## Current Project Status
Paper and code submited 

## Datasets
folgt

## Github Repository
folgt

## Path to Data on Filesystem
folgt

## Publication DOI
folgt

# CODE DOCUMENTATION
The following describes all the steps that need to be performed for replication including set up, statistical main and subanalyses as well figure generation and result interpretation. 

## 1. Setup
The following softwares are needed for the analyses:
* [MATLAB](https://www.mathworks.com/products/matlab.html)
* [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/)
* [BrainNet Viewer](https://www.nitrc.org/projects/bnv/)
* [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL)

After you have downloaded the software, proceed as follows: 
1. Download [GitHub repo].
2. Move the *spm12 folder* and *BrainNet Viewer folder* to the **dependencies folder**. 
3. Go to the folder **ale**:
    - Create two new subdirectories and name them **DataMatlab** and **DataRaw**.
    - The entered data will be saved here later

If you are running the analyses on a Windows OS computer, please follow the next steps (otherwise go on to **2. ALE Metaanalysis**)
1. Download [Visual Studio for C++](https://visualstudio.microsoft.com/vs/features/cplusplus/)
2. The following Windows-specific documents are located in the **ale** folder (they do not affect analyses performed using Linux or Mac OS ):
    - *tfceMex_pthread.c*
    - *tfceMex_pthread.m*
    - *tfceMex_pthread.mexw64*
3. Before the actual ALE analysis, run the following commands in MATLAB:
    
    ```
    mex -setup
    mex 'tfceMex.c'
    mex 'tfceMex_pthread.c'
    ```


## 2. ALE Metaanalysis
4. open the script *runALE.m* in MATLAB. 
    - You will need this script to perform the analyses. 

### Main analysis

### Subanalysis
***Gray matter***

***Cortical thickness***

## 3. Results



