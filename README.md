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
cd /vagrant
sudo su
apt-get update
apt-get install r-base-dev
```

#### Go into the R shell
```
R # this takes you to the R shell
install.packages("jsonlite") # Wait for CRAN mirror options to load, 101 is US Washington
install.packages("RCurl")
install.packages("devtools")


install.packages("leaflet")

```

This has an error of 
package ‘leaflet’ is not available (for R version 3.0.2)




