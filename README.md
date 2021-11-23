
#### To get the audio and backlight work
```
sudo pacman -S xbindkeys pamixer pulseaudio 
```

##### Fonts require for i3status
```
sudo pacman -S noto-fonts-emoji noto-fonts-cjk noto-fonts
```



----

### Nvim 0.5 with Treesitter and Lsp 
```
sudo pacman -S clangd nodejs python yarn python-pip

pip3 install [require language servers]
```

----------------

##### To enable the linux wifi hotspot 
```
sudo systemctl enable create_ap.service
sudo systemctl disable libvirtd.service
```

