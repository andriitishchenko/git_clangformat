#!/bin/sh

#  install.sh
#  Installer
#
#  Created by Andrii Tish on 2021.
#  

chech_status(){
    local code="$1"
    local message="$2"
    if [ ${code} -ne 0 ]; then
        echo "$message" 1>&2 
        exit 1
    fi
}

main(){

    #check which clang-format
    which clang-format >/dev/null 2>&1
    chech_status $? "fatal: clang-format not found."

    #chech if git parent directory
    git status >/dev/null 2>&1
    chech_status $? "fatal: Not a git parent directory."

    # download predefined .clang-format
    curl -O -L https://raw.githubusercontent.com/andriitishchenko/git_clangformat/main/.clang-format
    chech_status $? "fatal: .clang-format downloading failed."

    # backup exising "pre-commit" hook
    mv .git/hooks/pre-commit .git/hooks/pre-commit.backup 2>/dev/null

    # download predefined pre-commit hook to .git/hooks/
    curl -o .git/hooks/pre-commit -L https://raw.githubusercontent.com/andriitishchenko/git_clangformat/main/pre-commit 
    chech_status $? "fatal: pre-commit hook downloading failed."

    echo "Installed successfully"
}
main
