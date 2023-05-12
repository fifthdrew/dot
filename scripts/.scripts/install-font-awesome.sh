wget -c https://github.com/FortAwesome/Font-Awesome/blob/master/fonts/fontawesome-webfont.ttf

sudo mkdir -p /usr/local/share/fonts

sudo mv fontawesome-webfont.ttf /usr/local/share/fonts/

sudo fc-cache -v
