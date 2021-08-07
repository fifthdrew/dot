; Remove unnecessary things
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-message t)

; Set numbers
(setq-default display-line-numbers 'relative)

; Set font family and size
(set-face-attribute 'default nil :font "Iosevka" :height 150)

; Show bounding line 
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

; Set theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

; Remove borders from mode-line
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

; Initialize evil-mode
(require 'evil)
(evil-mode t)

; Initialize use-package
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

; Packages
(use-package command-log-mode)
