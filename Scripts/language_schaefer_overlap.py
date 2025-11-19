import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import glob
import os
import seaborn as sns
import nibabel as nib
from natsort import natsorted
from scipy.stats import ttest_ind
import scipy.stats as stats
import statsmodels.api as sm
from statsmodels.formula.api import ols
import statsmodels.stats.api as sms

def extract_unique_labels(masked_nii):
    # Load the NIfTI file
    img = nib.load(masked_nii)
    data = img.get_fdata()

    # Get unique labels in the image (ignoring zero)
    unique_labels = np.unique(data[data > 0])

    return unique_labels

unique_all = []
schaefer = glob.glob('../dataset/language/schaefer_*.nii.gz')
for s in natsorted(schaefer):
    print(s)
    unique_labels = extract_unique_labels(s)
    unique_all.append(list(unique_labels))

language_schaefer = pd.DataFrame(unique_all)
language_schaefer.to_csv('../Derivatives/language_schaefer.csv', index=False)