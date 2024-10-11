systemctl --user disable --now appimaged.service || true
rm ~/.config/systemd/user/appimaged.service
rm ~/.local/share/applications/appimagekit*.desktop
rm ~/Applications/appimaged-*-x86_64.AppImage
