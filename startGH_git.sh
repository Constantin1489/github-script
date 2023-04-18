function ghcreatepri(){
gh repo create $@ --private
}

function ghaddremote(){
if [ -z $1 ]
then
    echo "please provide a remote repo"
    return
fi
set -x
# if there is no remote repo, then add $1 to a remote repo called origin.
git remote show origin || git remote add origin git@github.com:$1.git && git push --set-upstream origin master
set +x

}

set -x

gitproject=$1
REMOTEURL=$(ghcreatepri $gitproject | sed 's/https:\/\/github.com\/\(.*\)/git@github.com:\1.git/')
echo $REMOTEURL

git init $gitproject
GITWORKDIR=$PWD/$gitproject
GITDIR=$PWD/$gitproject/.git
git --work-tree=$GITWORKDIR --git-dir=$GITDIR remote add origin $REMOTEURL
set +x
