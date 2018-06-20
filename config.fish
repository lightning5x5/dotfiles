# theme
set fish_theme agnoster

# suspend
alias p_suspend='dbus-send --system --print-reply=literal --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.Suspend boolean:true'

# rm-trash
alias rm='trash-put'

# anaconda3
set -x PATH /home/ryota/anaconda3/bin $PATH

# disable C-d
function fish_user_key_bindings
    bind \cd ''
end
