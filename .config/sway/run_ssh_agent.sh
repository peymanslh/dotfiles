export $(gnome-keyring-daemon --start)
export SSH_AGENT_PID=${GNOME_KEYRING_PID:-gnome}
