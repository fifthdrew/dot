;; Remove welcome message
(setq inhibit-startup-message t)

;; Remove menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remove scroll bar
(toggle-scroll-bar -1)

;; Set numbers
(global-linum-mode t)

;; Set font size
(set-face-attribute 'default nil :height 150)
