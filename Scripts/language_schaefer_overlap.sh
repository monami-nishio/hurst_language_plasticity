input_nii="../Dataset/template/allParcels_language_SN220.nii" 
atlas_nii="../Dataset/template/Schaefer2018_400Parcels_17Networks_order_FSLMNI152_1mm.nii.gz"

for X in {1..12}; do
    output_nii="output_value_${X}.nii.gz"
    binarized_nii="binarized_${X}.nii.gz"
    masked_nii="schaefer_${X}"
    fslmaths $input_nii -thr $X -uthr $X $output_nii
    fslmaths $output_nii -bin $binarized_nii
    fslmaths $atlas_nii -mas $binarized_nii $masked_nii.nii.gz
    fslchfiletype NIFTI_GZ $masked_nii.img $masked_nii.nii.gz
    max_intensity=$(fslstats $masked_nii -R | awk '{print $2}')
    fslstats $masked_nii -k $masked_nii -H 10000 $max_intensity > histogram.txt
    awk '{if ($2 > 0) print $1}' histogram.txt > unique_labels.txt
    echo $max_intensity
done