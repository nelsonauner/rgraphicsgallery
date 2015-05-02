Rscript --no-save --no-restore-data --quiet  R/master.R
find R/YourCodeHere -name "*.png"  -exec mv {} img/thumb/ \;
find .  -name "*.markdown"  -exec mv {} _posts/ \;
