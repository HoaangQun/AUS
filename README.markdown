# AUS
## khi nào cài lại đỡ cực

vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

fcitx5

```bash
sudo pacman -S fcitx5 fcitx5-bamboo fcitx5-configtool fcitx5-qt fcitx5-gtk
fcitx5-configtool
```

hyprland.conf

```bash
#input method
#setup
exec-once = export GTK_IM_MODULE=fcitx5
exec-once = export QT_IM_MODULE=fcitx5
exec-once = export XMODIFIERS=@im=fcitx5
exec-once = export INPUT_METHOD=fcitx5
exec-once = export SDL_IM_MODULE=fcitx5

#auto start
exec-once = fcitx5
```