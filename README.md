# glossom-public-base-os

creating Glossom pulic base OS image

## vagrant

Please execute below commands as root user.

```
sudo -H bash -lc 'apt update && which git || apt install git -y && \
git clone https://github.com/glossom-dev/glossom-public-base-os.git /tmp/glossom-public-base-os && \
cd /tmp/glossom-public-base-os && ./init.sh'
```

## docker

```
docker build -t glossom/public-base:latest .
```


## Link

git

- http://qiita.com/sonots/items/826b90b085f294f93acf

vagrant

- http://tsunokawa.hatenablog.com/entry/2014/10/24/153151
- https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
