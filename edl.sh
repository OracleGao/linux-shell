#######################################################
# Author: OracleGao                                         
# Desc: eliminate duplicationin lines for text in a file or in the dirs recursively
# Date: 20190623
#######################################################
#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage $0 <src> <dest>"
    exit 1
fi

src=${1///}
dst=${2///}

function edl() {
    cat $1 | sort | uniq > "${2}.tmp"
    mv "${2}.tmp" ${2}
}

function recurseDirEdl() {
    local src=$1
    local dst=$2
    local item=""
    local fileSrc=""
    local fileDst=""
    local coll="$(ls ${src})"
    if [ "${coll}" == "" ]; then
        return
    fi
    for item in ${coll}
    do
        fileSrc="${src}/${item}"
        fileDst="${dst}/${item}"
        if [ -f "${fileSrc}" ]; then
            echo "${fileSrc} -> ${fileDst}"
            edl ${fileSrc} ${fileDst}
        elif [ -d "${fileSrc}" ]; then
            mkdir -p ${fileDst}
            echo "${fileSrc}/    ${fileDst}/"
            recurseDirEdl ${fileSrc} ${fileDst}
        else
            echo "error: ${fileSrc}"
        fi
    done;
}

if [ -f "${src}" ]; then
    edl ${src} ${dst}
elif [ -d "${src}" ]; then
    recurseDirEdl ${src} ${dst}
fi
