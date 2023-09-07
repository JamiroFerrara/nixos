#!/bin/zsh

source /root/.zshrc

collections=$(fd . /root/pman/ | awk -F'[/=]' '{print $4}' | uniq)
selected_collection=$(echo $collections | fzy)

root="/root/pman/"
root+=$selected_collection

selected_request=$(fd -e sh . $root | fzy)
eval $selected_request

while true
do
  # loop infinitely
done
