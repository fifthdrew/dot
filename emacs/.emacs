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

(use-package ligature
  :load-path "~/dotfiles/emacs/.emacs.d/"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       ))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package rust-mode
  :ensure t) 

(use-package clojure-mode
  :ensure t)

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package typescript-mode
  :ensure t)
