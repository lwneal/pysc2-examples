#!/bin/bash

# Install wget
sudo apt-get update
sudo apt-get install wget unzip git python-mpi4py cmake libopenmpi-dev -y

# Install StarCraftII to the home directory
cd ~
wget -nc http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.0.2.zip

# Uncompress StarCraftII
unzip -P iagreetotheeula SC2.4.0.2.zip

cd StarCraftII

# Download StarCraftII Maps
wget -nc https://github.com/deepmind/pysc2/releases/download/v1.2/mini_games.zip

wget -nc http://blzdistsc2-a.akamaihd.net/MapPacks/Melee.zip
wget -nc http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season3.zip
wget -nc http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season2.zip
wget -nc http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season1.zip

# Uncompress zip files
unzip -o mini_games.zip -d ~/StarCraftII/Maps/
unzip -o -P iagreetotheeula Melee.zip -d ~/StarCraftII/Maps/
unzip -o -P iagreetotheeula Ladder2017Season3.zip -d ~/StarCraftII/Maps/
unzip -o -P iagreetotheeula Ladder2017Season2.zip -d ~/StarCraftII/Maps/
unzip -o -P iagreetotheeula Ladder2017Season1.zip -d ~/StarCraftII/Maps/

