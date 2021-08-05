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
(set-face-attribute 'default nil :font "Iosevka" :height 150)

; Remove borders from mode-line
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

; Show bounding line 
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

; Set theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

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

; Packages
(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

