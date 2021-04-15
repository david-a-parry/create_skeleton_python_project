#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Usage: $0 <project_name> <directory>"
    exit 1
fi

set -eou pipefail

project_name=$1
dir=$2
source_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${source_dir}/config.sh
project_dir=${dir}/${project_name}

if [ -e "$project_dir" ]
then
    echo "ERROR: - directory $project_dir already exists!"
    exit 2
fi

echo $(date) Creating project directories at "$project_dir"
mkdir -p $project_dir/{bin,test,$project_name}

echo $(date) Copying template files
cp -vni ${source_dir}/templates/{__init__.py,version.py} $project_dir/$project_name
cp -vni ${source_dir}/templates/setup.py $project_dir/

echo $(date) Customizing copied templates
sed -i -e "s/PROJECT/$project_name/g" \
    -e "s/YOURNAME/$author_name/g" \
    -e "s/EMAIL/$author_email/g" \
    -e "s/GITHUBUSER/$github_username/g" \
    ${project_dir}/setup.py ${project_dir}/${project_name}/__init__.py

echo $(date) Done



