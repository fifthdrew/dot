; Remove welcome message
(setq inhibit-startup-message t)

; Remove menus
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

; Remove scroll bar
(toggle-scroll-bar -1)

; Set numbers
(setq-default display-line-numbers 'relative)

; Set font family and size
(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)

; Set visual bell
(setq visible-bell t)

; Set theme
(load-theme 'wombat)

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

; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


