#!/bin/bash

echo "This script will delete all gnome games as of 12.7 (iagno lightsoff four-in-a-row gnome-robots pegsolitaire gnome-2048 hitori gnome-klotski gnome-mines gnome-mahjongg gnome-sudoku quadrapassel swell-foop gnome-tetravex gnome-taquin aisleriot gnome-chess five-or-more gnome-nibbles tali) and perfom an 'apt autoremove' once done."
read -p "Do you want to proceed ? [Y/n]" confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then

	echo "Checking if current user is root..."

	# Check if the current user is root
	if [ "$EUID" -ne 0 ]; then
		echo "Current user isn't root, using sudo instead"
		SUDO="sudo"
	else
		SUDO=""
	fi

	# Uninstall the GNOME games and autoremove unnecessary packages
	$SUDO apt purge iagno lightsoff four-in-a-row gnome-robots pegsolitaire gnome-2048 hitori gnome-klotski gnome-mines gnome-mahjongg gnome-sudoku quadrapassel swell-foop gnome-tetravex gnome-taquin aisleriot gnome-chess five-or-more gnome-nibbles tali -y
	$SUDO apt autoremove -y

	echo "All gnome games should be uninstalled"
else
	echo "Nothing was done"
fi