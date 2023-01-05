#!/usr/bin/env bash

export COMPOSE_PROJECT_NAME=ms-sssm

export wkdr=$PWD
cd $wkdr/ms-template && make stop

cd $wkdr
make proxystop
unset wkdr