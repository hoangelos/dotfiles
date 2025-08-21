# Load antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Load asdf
source "$(brew --prefix)/libexec/asdf.sh"

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Load oh-my-zsh plugins
antigen bundle git
antigen bundle direnv
antigen bundle asdf
antigen bundle command-not-found

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle djui/alias/tips

# Load a theme
antigen theme romkatv/powerlevel10k

# Apply the Antigen configuration
antigen apply
