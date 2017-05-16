# glossom-public-base-os

creating Glossom pulic base OS image

## vagrant

Please execute below commands as root user.

```
vagrant up
vagrant package --output /tmp/glossom-public-base-os.box
vagrant box add ./glossom-public-base-os.json
```

## AWS AMI

```
packer build packer-glossom-public-base-os.json
```

## Link

git

- http://qiita.com/sonots/items/826b90b085f294f93acf

vagrant

- http://tsunokawa.hatenablog.com/entry/2014/10/24/153151
- https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

anyenv/rbenv/pyenv/plenv

- https://github.com/pyenv/pyenv/wiki/Common-build-problems
