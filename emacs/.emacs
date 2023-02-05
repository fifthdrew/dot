;;--------------------------------------------------------------------
;;                         General Stuff
;;--------------------------------------------------------------------

;; Remove unnecessary ui things
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(toggle-scroll-bar -1)

;; Disable startup screen
(setq inhibit-startup-screen t)

; Disable bell ring
(setq ring-bell-function 'ignore)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Set font family and size
(cond
 ((find-font (font-spec :name "Hack Nerd Font Mono"))
  (set-frame-font "Hack Nerd Font Mono-14"))
 ((find-font (font-spec :name "Hack"))
  (set-frame-font "Hack-14")))

; Remove borders from mode-line
;(set-face-attribute 'mode-line nil :box nil)
;(set-face-attribute 'mode-line-inactive nil :box nil)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Change the size of markdown-mode headlines (off by default)
(setq solarized-scale-markdown-headlines t)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

;; Load my custom themes
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path
             (file-name-as-directory
               (expand-file-name "~/.emacs.d/themes/emacs-color-theme-solarized")))
(load-theme 'solarized t)

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
;;(evil-mode t)

;; Initialize use-package
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Packages
(use-package command-log-mode)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package rust-mode
  :ensure t)

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
