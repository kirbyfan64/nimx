#!/bin/sh

echo "BUILD.sh"
env


function installNim()
{
    git clone "https://github.com/Araq/Nim" ~/nim
    cd ~/nim
    sh build.sh
    export PATH=$(pwd)/bin
    cd -
}

function installNimble()
{
    git clone https://github.com/nim-lang/nimble.git ~/nimble
    cd ~/nimble
    nim c -r src/nimble install
    cd -
    PATH=$HOME/.nimble/bin
}

function installDependencies()
{
    nimble install
}

function buildTest()
{
    cd test
    nake
    cd -
}

echo Install Nim
installNim

echo Install Nimble
installNimble

echo Install dependencies
installDependencies

echo Build test
buildTest
