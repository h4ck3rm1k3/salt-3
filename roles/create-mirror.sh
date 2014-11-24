#!/bin/bash
#for check_mk-agent
# bzip2 prorior gz, so apt-get update will get bz2 pkgs info last
function mirror_dir() {
dir=$1
dists="lucid precise"
    for dist in $dists
    do
        echo "[$dir]: createing apt mirror for $dist"
        rm -f ./dists/$dist/main/binary-amd64/Packages.gz
        rm -f ./dists/$dist/main/binary-amd64/Packages.bz2
        dpkg-scanpackages pool/main/$dir > ./dists/$dist/main/binary-amd64/Packages
        dpkg-scanpackages  pool/$dist >> ./dists/$dist/main/binary-amd64/Packages
        cat ./dists/$dist/main/binary-amd64/Packages | gzip > ./dists/$dist/main/binary-amd64/Packages.gz
        cat ./dists/$dist/main/binary-amd64/Packages | bzip2 > ./dists/$dist/main/binary-amd64/Packages.bz2
        echo "deb http://ftp01/srv/apt-mirror $dist main" > $dir.$dist.list
    done
    
    echo "[$dir]: create apt mirror done"
}

mirror_dir check_mk
#mirror_dir omd
