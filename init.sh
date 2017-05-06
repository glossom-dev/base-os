#!/bin/bash

apt install tree unattended-upgrades aptitude git build-essential curl wget \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl \
    llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev -y && \
    unattended-upgrade && \
    git clone https://github.com/riywo/anyenv /usr/local/anyenv && \
    echo 'export ANYENV_ROOT="/usr/local/anyenv"' > /tmp/anyenv.sh && \
    echo 'export PATH="/usr/local/anyenv/bin:$PATH"' >> /tmp/anyenv.sh && \
    echo 'eval "$(anyenv init -)"' >> /tmp/anyenv.sh && \
    mv /tmp/anyenv.sh /etc/profile.d/ && \
    source /etc/profile.d/anyenv.sh && \
    anyenv install rbenv && anyenv install pyenv && anyenv install plenv && anyenv install phpenv && \
    source /etc/profile.d/anyenv.sh && \
    pyenv install 2.7.12 && pyenv global 2.7.12  && \
    source /etc/profile.d/anyenv.sh && \
    plenv install 5.22.1 && plenv global 5.22.1  && \
    source /etc/profile.d/anyenv.sh  && \
    pip install --upgrade pip && pip install ansible==2.3.0 && \
    source /etc/profile.d/anyenv.sh && \
    bash -lc 'ansible-playbook -i hosts.self self.yml'

# git ssh: http://qiita.com/sonots/items/826b90b085f294f93acf
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
mv /tmp/git_with_deploy_key /usr/local/bin
