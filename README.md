win-vagrant-meteorjs
====================

Use vagrant to run Meteor JS on windows.

The inspiration for putting this together came from the gist below.
[https://gist.github.com/ahoereth/2607d2ee99103a0a9bc9](https://gist.github.com/ahoereth/2607d2ee99103a0a9bc9)

# Windows(Host) 
From the location where the repo clone was cloned:
```sh
vagrant up
vagrant ssh
```

# VM(Linux)
```sh
/vagrant/setupmeteorproject.sh <project name> #Creates the project within the VM.
cd /home/vagrant/shared/<project name>
meteor
```
* /vagrant/setupmeteorproject.sh
  * Checks for Meteor and will install it if it doesn't see it.
  * Note: When cloning this project you will need to have core.autocrlf set to false in your git config or this script will report an error.
* /home/vagrant/mock/\<project name\> is the location that stores your MongoDB. It is actually mounted using the --bind switch to /home/vagrant/shared/\<project name\>/.meteor.
* /home/vagrant/shared/\<project name\> is the location where projects will be created with the sh script.

# Windows
* To edit your projects in windows just go to the following location. You will want to use an editor in windows that understands Unix line endings. My personal favorite is Sublime Text 3.
```sh
<Vagrant Box Location>\shared\<project name>
```
