#!/bin/bash

echo -e "\e[34m"
echo "########################################################################"
echo "########################################################################"
echo "##  ##########   ###        ###     #############   ################  ##"
echo "##  ##      ##   ###        ###    #############    ################  ##"
echo "##  ##      ##   ###        ###   ###                      ##         ##"
echo "##  ##      ##   ###        ###   ###                      ##         ##"
echo "##  ##########   ###        ###   ##############           ##         ##"
echo "##  ##  ##       ###        ###   ##############           ##         ##"
echo "##  ##   ##      ###        ###              ###           ##         ##"
echo "##  ##    ##     ###        ###              ###           ##         ##"
echo "##  ##     ##     ############   ##############            ##         ##"
echo "##  ##      ##     ##########   ##############             ##         ##"
echo "########################################################################"
echo "########################################################################"
echo -e "\e[0m"

echo -e "\e[32m[INFO] Installing Rust compiler.\e[0m"

# Function to check if a command is available
command_exists() {
    command -v "$1" &> /dev/null
}

# Install Rust based on the Linux distribution
if command_exists apt; then
    # Debian/Ubuntu
    sudo apt update
    sudo apt install -y rustc
elif command_exists pacman; then
    # Arch Linux
    sudo pacman -Syu --noconfirm rust
elif command_exists dnf; then
    # Red Hat/Fedora
    sudo dnf install -y rust
elif command_exists zypper; then
    # openSUSE
    sudo zypper install -y rust
else
    echo "Unsupported Linux distribution. Please install Rust manually."
    exit 1
fi


echo -e -n "\n\e[32mRust version:\e[0m\n"
rustc --version
cargo --version

echo -e "\e[32m[INFO] Installing the rust-coderunner script."
sudo cp rrun /bin
sudo chmod +x /bin/rrun
echo -e "[INFO] Script installation successful."
echo -e "Just type \e[31mrrun \e[33mfile_name.rs\e[32m and the code-runner script would run!!\e[0m"
