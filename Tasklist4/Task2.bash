# Script that migrates SVN remote repistory to local GIT repository 
# input:      [from revision] [to revision] [url]

svn_repository_url=$3
repository_name=l3

git_add() {
    # Function adds all files and directories except .gitignore
    git add .
    git reset -- .gitignore
    echo -e "-----\n"
}

create_repository() {
    # Function creates a git repository with given name,
    #          starting at given revision from remote svn repo
    # input:   [revision]

    # Only one revision is given (ex: 15:15)
    # Cloning given revision
    svn checkout -q -r "$1" "$svn_repository_url" $repository_name
    echo -e "=====\nMigrating Repository:\n - Name: '$repository_name'\n - Starting Revision: '$1'\n - SVN url: $svn_repository_url\n====="

    # Browsing into the repository directory
    cd $repository_name

    # Initializing Git Repository
    git init .

    # Create .gitignore with ".svn/*" and ".svn" rule
    echo -e ".svn/* \n.svn" >> ".gitignore"

    # Add everything except ".gitignore"
    git_add

    # Create git commit
    commit_revision $1
}

commit_revision () {
    # Function reads svn commit msg for given revision
    #          and commits with it to local git repository
    # input:   [revision]

    # Get the Commit Message to a variable
    svn log -r $1 >> commit_msg.txt
    commit_msg=`sed -n "4 p" commit_msg.txt`
    rm commit_msg.txt

    # Commit the message
    git commit -q -m "$commit_msg"
    echo -e "New Git Commit (based on svn -r $1): '$commit_msg'\n---"
}

copy_revision () {
    # Function copies svn commit for given revision
    # input:   [revision]

    # Get the Commit Message to a variable
    cd ..
    svn checkout -q -r "$1" "$svn_repository_url" $repository_name
    cd $repository_name
    echo -e "Revision $1 pulled."
}

copy_commit_from_svn_to_git () {
    # Function copies svn commit and commits it with revision message
    # input:   [revision]

    # Save '.git' file
    mv .git ..

    # Checkout new svn at given revision
    copy_revision $1

    # Bring back '.git' file and add changes
    mv ../.git .
    git_add

    # Commit to git repository with svn message at given revision
    commit_revision $1
}

# Depending on the order the revisions were entered
# Revision == Revision
if [ $1 -eq $2 ]
then
    create_repository $1

# (from:to)
elif [ $1 -lt $2 ]
then
    create_repository $1

    for ((i=$1;i<=$2;i++));
    do
        copy_commit_from_svn_to_git $i
    done

# (to:from)
else
    create_repository $2

    for ((i=$2;i<=$1;i++));
    do
        copy_commit_from_svn_to_git $i
    done
fi
