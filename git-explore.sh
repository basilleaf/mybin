#/bin/sh

# This is a collection of quick and dirty unix commands for exploring
# local git repositories. Read the description of each to see what it
# does.

# Get a count of the number of commits for this git repo
git log | grep 'Author: ' | wc -l
git log --oneline | wc -l
git log --pretty=oneline | wc -l
git rev-list HEAD | wc -l

# Count the number of non-merge commits for this git repo
git rev-list --no-merges HEAD | wc -l

# Get a list of hashes and commit messages for the log history of the repo
git log --pretty=oneline
git log --oneline

# See a graph representation of the commit history (CLI style)
git log --graph
git log --graph --decorate --pretty=oneline --abbrev-commit
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

# Get a count of the number of authors for this git repo
git log | grep 'Author: ' | sort | uniq | wc -l

# Get a sorted list of the authors for this git repo
git log | grep 'Author: ' | sort | uniq

# Get a list of authors for this git repo with their commit count,
# sorted in decreasing order by the commit count
git log | grep 'Author: ' | sort | uniq -c | sort -rn

# Get the number of merges along the main branch
git rev-list --merges HEAD | wc -l

# Get the list of commits that are the result of merges on the main branch
git rev-list --merges HEAD

# Get the list of commits that are non-merges on the HEAD branch
git rev-list --no-merges HEAD

# Get the root commit(s) for the main branch, if more than one exists
# then you will have to use 'git show' to figure out which is the initial
# commit.
git rev-list --max-parents=0 HEAD

# Get a list of the files changed at a commit (defaults to diff with the
# parent). Replace HEAD with any commit hash.
git show --pretty="format:" --name-only HEAD

# Get a list of the files added at the initial commit of this git repo
git show --pretty="format:" --name-only `git rev-list --max-parents=0 HEAD`

# See the pending commits/unpushed commits
git log origin/master..HEAD
git log --branches --not --remotes
