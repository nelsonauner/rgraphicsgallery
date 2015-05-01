Rscript R/master.R
find R/YourCodeHere -name "*.png"  -exec mv {} img/thumb/ \;
find R/YourCodeHere -name "*.markdown"  -exec mv {} _posts/ \;
