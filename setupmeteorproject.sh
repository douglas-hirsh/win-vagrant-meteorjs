#!/bin/bash
projectname=$1
homedir="/home/vagrant";
shareddir="$homedir/shared"
meteordir="$shareddir/$projectname";
mockdir="$homedir/mock/$projectname";

echo "Checking for Meteor"
if [ ! -d "/home/vagrant/.meteor" ]; then
  echo "Meteor is not installed. Installing it now."
  curl https://install.meteor.com/ | sh
else
  echo "Meteor is installed."
fi

echo "shared folder = $shareddir";
echo "meteor folder = $meteordir";
echo "mongo folder = $mockdir";

cd $shareddir;
meteor create $projectname;
cd $meteordir;
mkdir -p $mockdir;
mv $meteordir/.meteor $mockdir;
mkdir $meteordir/.meteor;

mountcommand="sudo mount --bind $mockdir/.meteor $meteordir/.meteor";
mountif="if ! mount | grep -q \"/home/vagrant/shared/$projectname/.meteor\"; then $mountcommand; fi"
$mountcommand;

echo "You should be able to run meteor for $projectname";
echo "Added the following line to your .profile"
echo "$mountif";
echo "$mountif" >> $homedir/.bashrc 
source $homedir/.bashrc
