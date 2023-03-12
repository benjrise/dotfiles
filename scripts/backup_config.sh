#!/bin/bash

git -C /home/benjrise/.dotfiles add -u
git -C /home/benjrise/.dotfiles commit -m "new settings"
git -C /home/benjrise/.dotfiles push

git -C /home/benjrise/.config/nvim add .
git -C /home/benjrise/.config/nvim commit -m "new settings"
git -C /home/benjrise/.config/nvim push

git -C /home/benjrise/.config/Code add -u
git -C /home/benjrise/.config/Code commit -m "new settings"
git -C /home/benjrise/.config/Code push

