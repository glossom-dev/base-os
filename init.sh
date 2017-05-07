#!/bin/bash

sudo apt update && \
    sudo apt install -y -q git tree unattended-upgrades aptitude git build-essential curl wget python-distutils-extra python-apt \
         libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl \
         llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev && \
    sudo unattended-upgrade && sudo git clone https://github.com/riywo/anyenv /usr/local/anyenv && \
    sudo rm -rf /tmp/anyenv.sh && \
    echo 'export ANYENV_ROOT="/usr/local/anyenv"' > /tmp/anyenv.sh && \
    echo 'export PATH="/usr/local/anyenv/bin:$PATH"' >> /tmp/anyenv.sh && \
    echo 'eval "$(anyenv init -)"' >> /tmp/anyenv.sh && \
    sudo mv /tmp/anyenv.sh /etc/profile.d/ && \
    sudo bash -lc 'anyenv install rbenv && anyenv install pyenv && anyenv install plenv && anyenv install phpenv' && \
    sudo bash -lc 'pyenv install 2.7.12 && pyenv global 2.7.12' && \
    sudo bash -lc 'plenv install 5.22.1 && plenv global 5.22.1' && \
    sudo bash -lc 'pip install --upgrade pip && pip install ansible==2.3.0' && \
    sudo bash -lc 'git clone https://github.com/glossom-dev/glossom-public-base-os.git /tmp/glossom-public-base-os' && \
    sudo bash -lc 'cd /tmp/glossom-public-base-os && ansible-playbook -i hosts.self self.yml' && \
    # git ssh: http://qiita.com/sonots/items/826b90b085f294f93acf
    sudo rm -f /tmp/git_with_deploy_key && \
    echo '#!/bin/bash
usage_exit() {
    echo "Usage: $0 [-i identity_file] -- [GIT ARGUMENTS]" 1>&2
    exit 1
}
while getopts i:h OPT
do
    case $OPT in
        i) IDENTITY_FILE=$OPTARG
           ;;
        h) usage_exit
           ;;
    esac
done
shift $((OPTIND - 1))
if [ -n "$IDENTITY_FILE" ]; then
    tempfile=$(mktemp --dry-run)
    cat <<EOF > $tempfile
#!/bin/sh
exec ssh -oIdentityFile=${IDENTITY_FILE} "\$@"
EOF
    chmod a+x $tempfile
    GIT_SSH=$tempfile git $@
    rm -f $tempfile
else
    git $@
fi' > /tmp/git_with_deploy_key && \
    chmod +x /tmp/git_with_deploy_key && \
    sudo mv /tmp/git_with_deploy_key /usr/local/bin
