#
# Job definitions used on rumcay
#

NAME="wicked-master-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="master"
NANNY="without"
ID=1 configure

NAME="wicked-master-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="master"
NANNY="with"
ID=2 configure

NAME="wicked-testing-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="testing"
NANNY="without"
ID=3 configure

NAME="wicked-testing-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="testing"
NANNY="with"
ID=4 configure

### SLE-12-SP0

NAME="sle12-0-last-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12"
NANNY="without"
ID=5 configure

NAME="sle12-0-last-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12"
NANNY="with"
ID=6 configure

NAME="sle12-0-next-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12-next"
NANNY="without"
ID=7 configure

NAME="sle12-0-next-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12-next"
NANNY="with"
ID=8 configure

NAME="sle12-0-test-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12-test"
NANNY="without"
ID=9 configure

NAME="sle12-0-test-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12-test"
NANNY="with"
ID=10 configure

### SLE-12-SP1

NAME="sle12-1-last-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1"
NANNY="without"
ID=11 configure

NAME="sle12-1-last-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1"
NANNY="with"
ID=12 configure

NAME="sle12-1-next-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1-next"
NANNY="without"
ID=13 configure

NAME="sle12-1-next-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1-next"
NANNY="with"
ID=14 configure

NAME="sle12-1-test-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1-test"
NANNY="without"
ID=15 configure

NAME="sle12-1-test-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1-test"
NANNY="with"
ID=16 configure

### SLE-12-SP2

NAME="sle12-2-last-direct"
DISTRIBUTION="SLES 12 SP2 (x86_64)"
BRANCH_NAME="sle12-sp2"
NANNY="without"
ID=17 configure

NAME="sle12-2-last-nanny"
DISTRIBUTION="SLES 12 SP2 (x86_64)"
BRANCH_NAME="sle12-sp2"
NANNY="with"
ID=18 configure

NAME="sle12-2-next-direct"
DISTRIBUTION="SLES 12 SP2 (x86_64)"
BRANCH_NAME="sle12-sp2-next"
NANNY="without"
ID=19 configure

NAME="sle12-2-next-nanny"
DISTRIBUTION="SLES 12 SP2 (x86_64)"
BRANCH_NAME="sle12-sp2-next"
NANNY="with"
ID=20 configure

NAME="sle12-2-test-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp2-test"
NANNY="without"
ID=21 configure

NAME="sle12-2-test-nanny"
DISTRIBUTION="SLES 12 SP2 (x86_64)"
BRANCH_NAME="sle12-sp2-test"
NANNY="with"
ID=22 configure

### openSUSE-Tumbleweed

NAME="tumbleweed-next-direct"
DISTRIBUTION="openSUSE Tumbleweed (x86_64)"
BRANCH_NAME="master"
NANNY="without"
ID=23 configure

NAME="tumbleweed-next-nanny"
DISTRIBUTION="openSUSE Tumbleweed (x86_64)"
BRANCH_NAME="master"
NANNY="with"
ID=24 configure

### openSUSE-Leap-42.1

NAME="leap-421-next-direct"
DISTRIBUTION="openSUSE Leap 42.1 (x86_64)"
BRANCH_NAME="sle12-sp1-next"
NANNY="without"
ID=25 configure

NAME="leap-421-next-nanny"
DISTRIBUTION="openSUSE Leap 42.1 (x86_64)"
BRANCH_NAME="sle12-sp1-next"
NANNY="with"
ID=26 configure


### openSUSE-Leap-42.2

NAME="leap-422-next-direct"
DISTRIBUTION="openSUSE Leap 42.2 (x86_64)"
BRANCH_NAME="sle12-sp2-next"
NANNY="without"
ID=27 configure

NAME="leap-422-next-nanny"
DISTRIBUTION="openSUSE Leap 42.2 (x86_64)"
BRANCH_NAME="sle12-sp2-next"
NANNY="with"
ID=28 configure

### openSUSE-13.2

NAME="suse-132-next-direct"
DISTRIBUTION="openSUSE 13.2 (x86_64)"
BRANCH_NAME="sle12-next"
NANNY="without"
ID=29 configure

NAME="suse-132-next-nanny"
DISTRIBUTION="openSUSE 13.2 (x86_64)"
BRANCH_NAME="sle12-next"
NANNY="with"
ID=30 configure

###
# User job IDs 30..39, 40..49
###

