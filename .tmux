# -----------------------------------------------------------------------------
# This config is targeted for tmux 2.1+ and should be placed in $HOME.
#
# Read the "Plugin Manager" section (bottom) before trying to use this config!
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Global options
# -----------------------------------------------------------------------------

# Set a new prefix / leader key.
set -g prefix C-a
bind C-a send-prefix

# Allow opening multiple terminals to view the same session at different sizes.
setw -g aggressive-resize on

# Remove delay when switching between Vim modes.
set -s escape-time 0

# Allow Vim's FocusGained to work when your terminal gains focus.
#   Requires Vim plugin: https://github.com/tmux-plugins/vim-tmux-focus-events
set -g focus-events on

# Add a bit more scroll history in the buffer.
set -g history-limit 50000

# Enable color support inside of tmux.
set -g default-terminal "screen-256color"

# Ensure window titles get renamed automatically.
setw -g automatic-rename

# Start windows and panes index at 1, not 0.
set -g base-index 1
setw -g pane-base-index 1

# Enable full mouse support.
set -g mouse on

# Status bar optimized for Gruvbox.
set -g status-fg colour244
set -g status-bg default
set -g status-left ''
set -g status-right-length 0
#set -g status-right-length 20
#set -g status-right '%a %Y-%m-%d %H:%M'

set -g pane-border-fg default
set -g pane-border-bg default
set -g pane-active-border-fg colour250
set -g pane-active-border-bg default

set-window-option -g window-status-current-attr bold
set-window-option -g window-status-current-fg colour223

# -----------------------------------------------------------------------------
# Key bindings
# -----------------------------------------------------------------------------

# Unbind default keys
unbind C-b
unbind '"'
unbind %

# Reload the tmux config.
bind-key r source-file ~/.tmux.conf

# Split panes.
bind-key h split-window -v
bind-key v split-window -h

# Move around panes with ALT + arrow keys.
bind-key -n M-Up select-pane -U
bind-key -n M-Left select-pane -L
bind-key -n M-Down select-pane -D
bind-key -n M-Right select-pane -R

# -----------------------------------------------------------------------------
# Plugin Manager - https://github.com/tmux-plugins/tpm
# In order to use the plugins below you need to install TPM and the plugins.
#   Step 1) git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#   Step 2) Reload tmux if it's already started with `r
#   Step 3) Launch tmux and hit `I (capital i) to fetch any plugins
# -----------------------------------------------------------------------------

# List of plugins.
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'

# Initialize TPM (keep this line at the very bottom of your tmux.conf).
run -b '~/.tmux/plugins/tpm/tpm'
