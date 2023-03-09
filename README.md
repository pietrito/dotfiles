# Installation

First of all, download/init this git using chezmoi:
`$ chezmoi init https://github.com/pietrito/dotfiles.git`

Go in the chezmoi directory:
`$ chezmoi cd`

Installing every packages:
`$ paru -S --needed --noconfirm $(cat packages.lst)`

Enabling services:
`$ sudo systemctl enable $(cat services.lst)`

Switch to ZSH:
`$ chsh -s /usr/bin/zsh`

Install oh-my-zsh:
`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Finally, reboot:
`$ reboot`
