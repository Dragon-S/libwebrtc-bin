#!/bin/bash

WEBRTC_DIR=$(cd $1 && pwd)
DEPOT_TOOLS_DIR=$(cd $2 && pwd)
WEBRTC_COMMIT=$3
CONFIG_DIR=$(cd $4 && pwd)
FETCH_TARGET=`cat ${CONFIG_DIR}/webrtc_fetch`

mkdir -p $WEBRTC_DIR
cd $WEBRTC_DIR

if [ -f $WEBRTC_DIR/.gclient ]; then
  echo "Syncing webrtc ...";
  cd $WEBRTC_DIR/src;
  git reset --hard;
  git clean -xdf;
  if [ -d $WEBRTC_DIR/src/third_party ]; then
    cd $WEBRTC_DIR/src/third_party;
    git reset --hard;
    git clean -xdf;
  fi
  if [ -d $WEBRTC_DIR/src/build ]; then
    cd $WEBRTC_DIR/src/build;
    git reset --hard;
    git clean -xdf;
  fi
else
  echo "Create .gclient file ...";
  rm -f $DEPOT_TOOLS_DIR/metrics.cfg;
  rm -rf $WEBRTC_DIR/src;
  gclient root
  gclient config --spec 'solutions = [
    {
      "name": "src",
      "url": "https://github.com/Dragon-S/google-webrtc.git",
      "deps_file": "DEPS",
      "managed": False,
      "custom_deps": {},
    },
  ]
  '

  echo "Getting WEBRTC ...";
  gclient sync --nohooks --with_branch_heads
fi

echo "Switch WEBRTC to WEBRTC_COMMIT = $WEBRTC_COMMIT";
cd $WEBRTC_DIR/src
git fetch
git checkout -f $WEBRTC_COMMIT
yes | gclient sync -D