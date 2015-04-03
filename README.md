# bus-request-loggeR

analytics for bus.codeforanchorage.org

# Setup

## Setup with Vagrant
Download and install VirtualBox and Vagrant. If you have old versions of either, you may need to upgrade to a newer version.

### Installing Virtualbox:
Download the .dmg from here: https://www.virtualbox.org/wiki/Downloads

Follow the instructions here: https://www.virtualbox.org/manual/ch02.html#idp52694656

### Installing Vagrant:
https://docs.vagrantup.com/v2/installation/index.html

## Preparing the repo:
```
git clone git@github.com:codeforanchorage/bus-request-loggeR.git
cd bus-request-loggeR
```

### Bringing up the VM:
From within the bus-request-loggeR directory run the following commands:
```
vagrant up
```

#### Connecting to the VM:
```
vagrant ssh
```

#### On the VM
```
cd /vagrant
sudo su
apt-get update
apt-get -y install r-base-dev
apt-get -y build-dep libcurl4-gnutls-dev
apt-get -y install libcurl4-gnutls-dev
apt-get -y install libcurl4-openssl-dev libxml2-dev
apt-get -y install gdebi-core
cd 
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
gdebi shiny-server-1.3.0.403-amd64.deb
cd /vagrant
```

#### Go into the R shell
```
R # this takes you to the R shell
install.packages("jsonlite") # Wait for CRAN mirror options to load, 101 is US Washington
install.packages("devtools")
require(devtools)
install_github('ramnathv/rCharts')
install_github('jcheng5/leaflet-shiny')
install_github('trestletech/ShinyDash')
install.packages("lubridate")
install_github('rstudio/leaflet')
install.packages("stringr")

```

#### The error
```
> json_data <- fromJSON(url)$requests
Error: could not find function "fromJSON"
```

#### Notes

install_github('hadley/httr')

We still need fromJSON, 

install_github('ropensci/rbison')


install_github('hadley/lazyeval')
ERROR: this R is version 3.0.2, package 'lazyeval' requires R >= 3.1.0
going to R 3.1.2 fixed it

install.packages("dplyr") -> need lazyeval




