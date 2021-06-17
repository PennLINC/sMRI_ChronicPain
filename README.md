# sMRI_ChronicPain
ALE Meta-Analysis of Structural Imaging Studies in Patients with Chronic Pain versus Healthy Controls


## Project Lead
Alina T. Henn

## Faculty Leads
Theodore D. Satterthwaite

## Analytic Replicator
Azeez Adebimpe

## Collaborators
Bart Larsen, Azeez Adebimpe, Anna Xu, Cobb Scott, Vaishnavi Sharma, Sophia Linguiti, Robert Dworkin, Allan I. Basbaum, Gregory Corder, Robert R. Edwards, Clifford J. Woolf, Ute Habel, Simon B. Eickhoff, Claudia R. Eickhoff, Lisa Wagels

## Project Start Date
January 2020

## Current Project Status
Paper and code submited 

## Datasets
1. Main analysis:
    - aberrant_20210617.xls
    - pain_20210617.xlsx
    - painCoords_20210617.xls
2. Subanalysis: gray matter
    - aberrant_GM_20210617.xls
    - pain_GM_20210617.xlsx
    - painCoords_GM_20210617.xls
3. Subanalysis: cortical thickness
    - aberrant_CT_20210617.xls
    - pain_CT_20210617.xlsx
    - painCoords_CT_20210617.xls

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
2. The following Windows-specific documents are located in the **ale** folder (they do not affect analyses performed using Linux or Mac OS):
    - *tfceMex_pthread.c*
    - *tfceMex_pthread.m*
    - *tfceMex_pthread.mexw64*
3. Before the actual ALE analysis, run the following commands in MATLAB:
    ```
    mex -setup
    mex 'tfceMex.c'
    mex 'tfceMex_pthread.c'
    ```
4. If you are using Windows OS you need a way to unpack **.gz** files. We recommend [WinRAR](https://winrar.de/downld.php) for this purpose.

***Everything is now prepared to run the ALE scripts!***

## 2. ALE Metaanalysis
+ Open the script *runALE.m* in MATLAB. 
    - You will need this script to perform the analyses. 

***Description and explanation of the commands in the runALE script:*** 
+ ```curPath=genpath(pwd)``` & ```addpath(curPath)```: 
    - Adds all dependencies to the main directory. 
+ ```cd ale```:
    - Takes you to the **ale** folder so that analyses can be started.

*Main analysis*
+ ```ale_inputCoords('aberrant_20200908.xls')```: 
    - The coordinate data for the main analyses (aberrant structural changes) located in *data/aberrant_20200908.xls* are read in. 
    - Data will be converted to a .mat format for the analyses.
+ ```ale_inputCoords('painCoords_20200908.xls')```: 
    - Reads the coordinate data from the document *data/painCoords_20200908.xls* for the subgroup analyses regarding direction-specific group differences in structural data.
    - The coordinate data is read in .mat format for analyses and is located in ale/DataMatlab folder.
+ ```ale_estimateALE('pain_20200908.xlsx')```
    - XX


*Subanalysis gray matter*
+ ```ale_inputCoords('aberrant_GM_20210304.xls')```
    - xx
+ ```ale_inputCoords('painCoords_GM_20210304.xls')```
    - xx
+ ```ale_estimateALE('pain_GM_20210304.xlsx')```
    - xx

*Subanalysis cortical thickness*
+ ```ale_inputCoords('aberrant_CT_20210304.xls')```
    - xx
+ ```ale_inputCoords('painCoords_CT_20210304.xls')```
    - xx
+ ```ale_estimateALE('pain_CT_20210304.xlsx')```
    - xx


### Main analysis

### Subanalysis
***Gray matter***

***Cortical thickness***

## 3. Results


## 4. Annotation
+ Please note that if you want to run the analysis again, you must first empty the **ALE** folder (where all results were saved). Otherwise, the analysis cannot run without errors. 
