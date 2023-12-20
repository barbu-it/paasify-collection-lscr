#!/bin/bash

set -eu

install_git ()
{
  local url=$1
  local dest=$2

  if ! [ -d "$dest" ]; then
    git clone --single-branch --depth 1 "$url" "$dest"
  else
    (
      cd "$dest";
      git pull;
    )
  fi

}

install_git https://github.com/WDaan/VueTorrent.git vuetorrent


install_release ()
{
  local url=$1
  local fname=${url##*/}
  local dest=${url%.zip}

  [ ! -d "$dest" ] || return 0

  wget "$url"
  unzip "$fname"
  rm "$fname"
}

install_release https://github.com/bill-ahmed/qbit-matUI/releases/download/v1.16.4/qbit-matUI_Unix_1.16.4.zip 



