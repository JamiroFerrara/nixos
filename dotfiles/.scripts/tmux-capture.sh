#!/usr/bin/sh

source '/root/.zshrc'

tmux capture-pane -p -S - | nvim -c 'set buftype=nofile' -c 'set nonumber' +'$'
