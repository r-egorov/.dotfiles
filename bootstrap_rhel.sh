#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Dotfiles Bootstrap (AlmaLinux/RHEL) ==="
echo "Dotfiles directory: $DOTFILES_DIR"

# --- Install packages via dnf ---
echo "Installing packages..."
sudo dnf install -y zsh tmux git curl unzip ripgrep fd-find xclip

# --- Install Neovim (latest stable) ---
if ! command -v nvim &>/dev/null; then
    echo "Installing Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux-x86_64.tar.gz
    echo "Neovim installed."
else
    echo "Neovim already installed: $(nvim --version | head -1)"
fi

# --- Create symlinks ---
echo "Creating symlinks..."

for file in .zshrc .tmux.conf .gitconfig; do
    target="$HOME/$file"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "  Backing up $target -> ${target}.bak"
        mv "$target" "${target}.bak"
    fi
    ln -sf "$DOTFILES_DIR/$file" "$target"
    echo "  Linked $target"
done

mkdir -p "$HOME/.config"
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "  Linked ~/.config/nvim"

# --- Install oh-my-zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # oh-my-zsh overwrites .zshrc, restore our symlink
    ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
else
    echo "oh-my-zsh already installed."
fi

# --- Install TPM (Tmux Plugin Manager) ---
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "TPM already installed."
fi

# --- Install tmux plugins ---
echo "Installing tmux plugins..."
"$HOME/.tmux/plugins/tpm/bin/install_plugins" || true

# --- Install Neovim plugins headlessly ---
echo "Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

# --- Set default shell to zsh ---
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(which zsh)" || echo "  Could not change shell. Run: chsh -s \$(which zsh)"
fi

echo ""
echo "=== Done! ==="
echo "Start a new shell or run: tmux new -s default"
