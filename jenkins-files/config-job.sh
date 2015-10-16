#! /bin/bash

ID=0
SUBDIR="cucumber"
GIT_REPO="openSUSE"
JOBS_DIR=/var/lib/jenkins/jobs
JOBS_DIR=../../jobs

function configure()
{
  printf "ID=%02u\t%-24s\t%-24s\t%s\t%s\n" "$ID" "$NAME" "$DISTRIBUTION" "$GIT_REPO" "$BRANCH_NAME"
  test -d "$JOBS_DIR/$NAME" || mkdir -p "$JOBS_DIR/$NAME" || exit 1
  sed "s!@@SUBDIR@@!$SUBDIR!g;
       s!@@GIT_REPO@@!$GIT_REPO!g;
       s!@@BRANCH_NAME@@!$BRANCH_NAME!g;
       s!@@DISTRIBUTION@@!$DISTRIBUTION!g;
       s!@@ID@@!$ID!g;
       s!@@NANNY@@!$NANNY!g" \
      config-job.template > "$JOBS_DIR/$NAME/config.xml"
}

NAME="sle12-0-last-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-0-last-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-0-next-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12-next"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-0-next-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="sle12-next"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-1-last-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-1-last-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-1-next-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1-next"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-1-next-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="sle12-sp1-next"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-0-master-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="master"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-0-master-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="master"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-1-master-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="master"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-1-master-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="master"
NANNY="with"
ID=$((++ID))
configure

NAME="tumbleweed-master-direct"
DISTRIBUTION="openSUSE Tumbleweed (x86_64)"
BRANCH_NAME="master"
NANNY="without"
ID=$((++ID))
configure

NAME="tumbleweed-master-nanny"
DISTRIBUTION="openSUSE Tumbleweed (x86_64)"
BRANCH_NAME="master"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-0-testing-direct"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="testing"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-0-testing-nanny"
DISTRIBUTION="SLES 12 SP0 (x86_64)"
BRANCH_NAME="testing"
NANNY="with"
ID=$((++ID))
configure

NAME="sle12-1-testing-direct"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="testing"
NANNY="without"
ID=$((++ID))
configure

NAME="sle12-1-testing-nanny"
DISTRIBUTION="SLES 12 SP1 (x86_64)"
BRANCH_NAME="testing"
NANNY="with"
ID=$((++ID))
configure

NAME="tumbleweed-testing-direct"
DISTRIBUTION="openSUSE Tumbleweed (x86_64)"
BRANCH_NAME="testing"
NANNY="without"
ID=$((++ID))
configure

NAME="tumbleweed-testing-nanny"
DISTRIBUTION="openSUSE Tumbleweed (x86_64)"
BRANCH_NAME="testing"
NANNY="with"
ID=$((++ID))
configure

NAME="os132-master-direct"
DISTRIBUTION="openSUSE 13.2 (x86_64)"
BRANCH_NAME="master"
NANNY="without"
ID=$((++ID))
configure

NAME="os132-master-nanny"
DISTRIBUTION="openSUSE 13.2 (x86_64)"
BRANCH_NAME="master"
NANNY="with"
ID=$((++ID))
configure

#NAME="os132-testing-direct"
#DISTRIBUTION="openSUSE 13.2 (x86_64)"
#BRANCH_NAME="testing"
#NANNY="without"
#ID=$((ID++))
#configure

#NAME="os132-testing-nanny"
#DISTRIBUTION="openSUSE 13.2 (x86_64)"
#BRANCH_NAME="testing"
#NANNY="with"
#ID=$((ID++))
#configure

###
# User job IDs 30..39, 40..49
###

