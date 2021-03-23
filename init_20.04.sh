#!/bin/bash

timestamp=`date +%s`
sudo apt update -q && \
    sudo apt-get update && \
    sudo apt-get install -y -q aptitude && \
    sudo aptitude install -y -q git tree unattended-upgrades jq && \
    sudo aptitude install -y -q build-essential curl wget && \
    sudo aptitude install -y -q libssl1.1 zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libedit-dev && \
    sudo aptitude install -y -q llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev && \
    sudo aptitude install -y -q chrony libffi-dev liblzma-dev python-openssl && \
    sudo sudo apt-get install -y -q python3-pip && \
    sudo unattended-upgrade && \
    sudo pip3 install --upgrade pip && sudo pip3 install ansible awscli && \
    sudo git clone https://github.com/riywo/anyenv /usr/local/anyenv && \
    sudo rm -rf /tmp/anyenv.sh && \
    echo 'export ANYENV_ROOT="/usr/local/anyenv"' > /tmp/anyenv.sh && \
    echo 'export PATH="/usr/local/anyenv/bin:$PATH"' >> /tmp/anyenv.sh && \
    echo 'export ANYENV_DEFINITION_ROOT="/usr/local/anyenv/.config"' >> /tmp/anyenv.sh && \
    echo 'eval "$(anyenv init -)"' >> /tmp/anyenv.sh && \
    sudo mv /tmp/anyenv.sh /etc/profile.d/ && \
    sudo bash -lc 'anyenv install --force-init' &&  \
    sudo bash -lc 'anyenv install -s rbenv && anyenv install -s pyenv && anyenv install -s plenv && anyenv install -s phpenv' && \
    sudo bash -lc 'anyenv install -s goenv && anyenv install -s luaenv' && \
    sudo bash -lc 'git clone https://github.com/pyenv/pyenv-virtualenv.git /usr/local/anyenv/envs/pyenv/plugins/pyenv-virtualenv' && \
    sudo bash -lc 'rm -rf /tmp/'$timestamp && \
    sudo bash -lc 'git clone https://github.com/glossom-dev/glossom-public-base-os.git /tmp/'$timestamp && \
    sudo bash -lc 'cd /tmp/'$timestamp' && ansible-playbook -i hosts.self self.yml' && \
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
exec ssh -oStrictHostKeyChecking=no -oIdentityFile=${IDENTITY_FILE} "\$@"
EOF
    chmod a+x $tempfile
    GIT_SSH=$tempfile git $@
    rm -f $tempfile
else
    git $@
fi' > /tmp/git_with_deploy_key && \
    chmod +x /tmp/git_with_deploy_key && \
    sudo mv /tmp/git_with_deploy_key /usr/local/bin && \
    # cleanup
    sudo rm -rf /root/.ssh/authorized_keys /root/.aptitude ~/.sudo_as_admin_successful ~/.ansible ~/.cache
