#!/bin/bash

requirements="[+] Installing Files...."

for ((i=0; i<${#requirements}; i++)); do
    echo -n "${requirements:$i:1}"
    sleep 0.05
done
echo

sudo apt install tmux xclip dconf-cli kitty

setup="[+] Setting up Tmux Config (localh0ste)"
for ((i=0; i<${#setup}; i++)); do
    echo -n "${setup:$i:1}"
    sleep 0.05
done
echo

cp .tmux.conf ~/.tmux.conf
cp kitty.conf ~/.config/kitty




setup_done="[-] Done!"
for ((i=0; i<${#setup_done}; i++)); do
    echo -n "${setup_done:$i:1}"
    sleep 0.05
done
echo

exit_txt="Install Complete [+] ;)"
for ((i=0; i<${#exit_txt}; i++)); do
    echo -n "${exit_txt:$i:1}"
    sleep 0.05
done
echo

echo "open new terminal as kitty and use tmux "
