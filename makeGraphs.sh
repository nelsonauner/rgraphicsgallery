echo 'deb http://cran.rstudio.com/bin/linux/ubuntu precise/'  | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update -y
sudo apt-get install r-base -y 
