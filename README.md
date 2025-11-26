# Cascading periods of language-related brain plasticity across early childhood

## About
This repository contains the code and data supporting the study *"Cascading periods of language-related brain plasticity across early childhood"* submitted on *BioArxiv*.

## Code

**To reproduce Figure 1,2,4**  
- `Schaefer_analysis.Rmd`

**To reproduce Figure 3**  
- `Thalamus_analysis.Rmd`

## Scripts
- `hurst_exponent.m` — Calculates the Hurst exponent.
- `language_schaefer_overlap.sh/language_schaefer_overlap.py` — Overlay the Fedorenko language regions with the Schaefer 400 parcellation and extract the parcels that overlap with each language ROI.

## Derivatives
Includes all the data needed to run the code.  

## Data
Templates used in this study:  
- `aseg_pt5_rim_layer_equivol_6,7bins.nii.gz` — Language ROIs downloaded from https://www.evlab.mit.edu/resources-all/download-parcels.
- `Schaefer2018_400Parcels_17Networks_order_FSLMNI152_1mm.nii.gz` — Schaefer 400 parcellations downloaded from https://github.com/ThomasYeoLab/CBIG/tree/master/stable_projects/brain_parcellation/Schaefer2018_LocalGlobal
- `atlas-THOMAS_space-MNI152NLin2009cAsym_res-01.nii.gz` - THOMAS thalamus parcellations downloaded from https://www.sciencedirect.com/science/article/pii/S1053811919301946?via%3Dihub

Global cortical hierarchy map used in this study:
- `Anterior_Posterior_Axis_Ranks.csv` — Anterior-Posterior axis.
- `Sensorimotor_Association_Axis_AverageRanks.csv` — Sensory-Association axis downloaded from https://netneurolab.github.io/neuromaps/user_guide/annotations.html.
