;;--------------------------------------------------------------------
;;                         General Stuff
;;--------------------------------------------------------------------

;; Remove unnecessary things
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-message t)

;; Set font family and size
(set-face-attribute 'default nil :font "Iosevka" :height 150)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Load my custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; TODO: Customize my default theme
;; Reference: https://www.reddit.com/r/emacs/comments/2yoi7k/help_with_color_schemes_in_the_terminal/
(if (display-graphic-p)
    ()
  (load-theme 'my-default t))

;;--------------------------------------------------------------------
;;                            Packages
;;--------------------------------------------------------------------

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize evil-mode
(require 'evil)
(evil-mode t)

;; Initialize use-package
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Packages
(use-package command-log-mode)

(use-package ligature
  :load-path "~/.emacs.d/ligature.el"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
    '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
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
    "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'
  (global-ligature-mode t))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package rust-mode
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package clojure-mode-extra-font-locking
  :ensure t)

;;(use-package cider
;;  :ensure t)

(use-package typescript-mode
  :ensure t)

(use-package vimrc-mode
  :ensure t)

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))


;;--------------------------------------------------------------------
;;                          Utility Functions
;;--------------------------------------------------------------------

(defun toggle-top-menu ()
  "Run toggle-menu-bar-mode-from-frame and toggle-tool-bar-mode-from-frame"
  (interactive)
  (menu-bar-mode (if tool-bar-mode -1 1))
  (tool-bar-mode (if tool-bar-mode -1 1)))

(defun toggle-mode-line ()
  (interactive)
  (mode-line-format (if mode-line-format -1 1)))

(defun toggle-line-numbering ()
  "Toggle line numbering."
  (interactive)
  (if (eq display-line-numbers 'relative)
      (setq display-line-numbers nil)
    (setq display-line-numbers 'relative)))

;; SOURCE: https://bzg.fr/en/emacs-hide-mode-line/
(defvar-local hidden-mode-line-mode nil)
(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))


;;--------------------------------------------------------------------
;;                           Toggle visuals
;;--------------------------------------------------------------------

(global-set-key (kbd "<f5>") 'menu-bar-mode)
(global-set-key (kbd "<f6>") 'tool-bar-mode)
(global-set-key (kbd "<f7>") 'toggle-top-menu)
(global-set-key (kbd "<f8>") 'hidden-mode-line-mode)
(global-set-key (kbd "<f9>") 'toggle-line-numbering)
