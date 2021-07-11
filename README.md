# sMRI_ChronicPain
ALE Meta-Analysis of Structural Imaging Studies in Patients with Chronic Pain versus Healthy Controls


## Project Lead
Alina T. Henn

## Faculty Leads
Theodore D. Satterthwaite

## Analytic Replicator
Lennart Frahm

## Collaborators
Bart Larsen, Azeez Adebimpe, Anna Xu, Cobb Scott, Vaishnavi Sharma, Sophia Linguiti, Robert Dworkin, Allan I. Basbaum, Gregory Corder, Robert R. Edwards, Clifford J. Woolf, Ute Habel, Simon B. Eickhoff, Claudia R. Eickhoff, Lisa Wagels

## Project Start Date
January 2020

## Current Project Status
Paper and code submitted 

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
The following software  is needed for the analyses:
* [MATLAB](https://www.mathworks.com/products/matlab.html)
* [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/)
* [MRIcron](https://www.nitrc.org/projects/mricron)
* [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL)

After you have downloaded the software, proceed as follows: 
1. Download [GitHub repo].
2. Move the *spm12 folder* to the **dependencies folder**. 
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

### 2.1. Main analysis
+ ```ale_inputCoords('aberrant_20210617.xls')```: 
    - The coordinate data for the main analyses (aberrant structural changes) located in *data/aberrant_20210617.xls* are read in. 
    - Data will be converted to a .mat format for the analyses.
+ ```ale_inputCoords('painCoords_20210617.xls')```: 
    - Reads the coordinate data from the document *data/painCoords_20210617.xls* for the subgroup analyses regarding direction-specific group differences in structural data.
    - The coordinate data is read in .mat format for analyses and is located in ale/DataMatlab folder.
    - Description: 
+ ```ale_estimateALE('pain_20200908.xlsx')```
    - Starts the actual ALE analysis

### 2.2. Subanalyses
In the context of the subanalysis, the documents listed below are read in in an identical manner as already described in chapter 2.1. The only difference lies in the content and the name of the documents read in. 

*Subanalysis gray matter*
+ ```ale_inputCoords('aberrant_GM_20210617.xls')```
+ ```ale_inputCoords('painCoords_GM_20210617.xls')```
+ ```ale_estimateALE('pain_GM_20210617.xlsx')```

*Subanalysis cortical thickness*
+ ```ale_inputCoords('aberrant_CT_20210617.xls')```
+ ```ale_inputCoords('painCoords_CT_20210617.xls')```
+ ```ale_estimateALE('pain_CT_20210617.xlsx')```

## 3. Results
### 3.1. Discription of output (ALE) folder 
The results of the analysis are stored in the **"ALE" folder** (Henn_Pain-master_17.06.2021\EickhoffALE\ALE).

The following folders can be found in the ALE folder:

1. *Contribution*
    - empty: null results
    - format: text fieles (.txt)
    - contains gravity for significant clusters converging in structural changes  
    - contains %-contribution from each experiment to ALE
2. *Results*
    - format: NIfTI (.nii)
    - contains thresholded ALE maps: use map with suffix ***_cFWE05***: *p*<.05 cluster based family wise error corrected & ***_TFCE***: p<.05 ***?*** threshold free cluster enhancement
    - information: all maps are thesholded at voxel-hight *p*<.001 uncorrected and further cluster corrected
3. *Foci*
    - format: NIfTI (.nii)
    - contains foci images (0: regions without significant coordinate results; 1:regions with significant coordinate results)
4. *VolumsZ*
    - format: NIfTI (.nii)
    - contains Z-scored unthresholded ALE maps 
5. *Images*
    - ??
6. *NullDistributions*
    - ??
7. *Volums*
    - ??
8. *VolumesTFCE*
    - ??
  
### 3.2. Figures
A detailed description of how to use MRIcron can be found here: [MRIcron Introducation](https://people.cas.sc.edu/rorden/mricron/main.html)
You have many possibilities to view the NIfTI documents or to generate images with MRIcron. In the following I will only describe how I generated the figures in the paper associated with the data so that you will be able to reproduce them. 

1. **open MRIcron**
2. **select  *OVERLY* :arrow_right: *ADD***
    - go to *Result*-folder within the ALE folder
    - select the NIfTI file you want to display
3. **select *WINDOW* :arrow_right: *MULTISLICES***
    -  You will be shown a series of slices of the currently open volumes.
4. **select *VIEW* :arrow_right: *ORIENT***
    - You can select whether the slices are displayed in sagittal, coronal or axial view
    - In the context of the paper, I have only shown the sagittal and axial view
5. **select *VIEW* :arrow_right: *SLICES***
    - You can specify the slices by means of numbers that you want to display in the multislice figure
    - In addition, you can define how far the slices should overlap in the image

### 3.3. Distribution of foci



## 4. Annotation
+ Please note that if you want to run the analysis again, you must first empty the **ALE** folder (where all results were saved). Otherwise, the analysis cannot run without errors. 
