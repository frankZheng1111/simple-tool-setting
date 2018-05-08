#!/bin/bash
projects=`ls -A`

echo $projects

for project in $projects
do
  if [ -d $project ];then
    echo $project
    cd $project
    pwd
    git checkout master
    br=`git branch | grep "*"`
    br=${br/* /}
    echo $br
    git pull
    cd -
  fi
done

