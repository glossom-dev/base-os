# glossom-public-base-os

creating Glossom pulic base OS image

## vagrant

Please execute below commands as root user.

```
# ubuntu 16.04
vagrant up glossom-public-base-os
vagrant package --output /tmp/glossom-public-base-os.box
vagrant box add ./vagrant-glossom-public-base-os_16.04.json

# ubuntu 20.04
vagrant up glossom-public-base-os_20.04
vagrant package --output /tmp/glossom-public-base-os_20.04.box
vagrant box add ./vagrant-glossom-public-base-os_20.04.json

```

## AWS AMI

```
packer build packer-glossom-public-base-os_aws_16.04.json
```

## Link

git

- http://qiita.com/sonots/items/826b90b085f294f93acf

vagrant

- http://tsunokawa.hatenablog.com/entry/2014/10/24/153151
- https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

anyenv/rbenv/pyenv/plenv

- https://github.com/pyenv/pyenv/wiki/Common-build-problems

## Base AMI

Ubuntu Official AMI finder: https://cloud-images.ubuntu.com/locator/ec2/

```
amd64 hvm:ebs-ssd
```
