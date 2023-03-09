# Installation

First of all, download/init this git using chezmoi:
`$ chezmoi init https://github.com/pietrito/dotfiles.git`

Go in the chezmoi directory:
`$ chezmoi cd`

Configure chezmoi itself:
`$ mkdir -p ~/.config/chezmoi && cp chezmoi.toml ~/.config/chezmoi/`

Installing every packages:
`$ paru -S --needed --noconfirm $(cat packages.lst)`

Enabling services:
`$ sudo systemctl enable $(cat services.lst)`

