packages=(
        dunst
	qtile
	zsh
	tmux
	ripgrep
	libvirt
	qemu
	virt-manager
        feh
        tree
        git
        lazygit
        libnotify
        lxappearance
        neovim
        nodejs
        npm
        polybar
        python-pip
        python-virtualenv
        rofi
        starship
        ttf-fira-code
        ttf-font-awesome
        ttf-jetbrains-mono-nerd
        ttf-jetbrains-mono
)

# Install packages
yay -S ${packages[@]}
