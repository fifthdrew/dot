;;--------------------------------------------------------------------
;;                         Global Variables
;;--------------------------------------------------------------------

(setq my/custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq my/leader-key "<spacebar>")

(setq my/cloud-synced-directory
      (file-name-as-directory
       (expand-file-name
        "~/Documents/")))

(setq my/org-directory (expand-file-name "second-brain" my/cloud-synced-directory))


;;--------------------------------------------------------------------
;;                         General Stuff
;;--------------------------------------------------------------------

;; Remove unnecessary ui things
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))
(set-window-scroll-bars (minibuffer-window) nil nil)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable scratch message
(setq initial-scratch-message nil)

;; Disable alarms
(setq ring-bell-function 'ignore)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Set better scrolling
;; SOURCE: https://github.com/bbatsov/emacs.d/blob/master/init.el
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode t))

;; Set font family and size
(cond
 ((find-font (font-spec :name "Hack Nerd Font Mono"))
  (set-frame-font "Hack Nerd Font Mono-14"))
 ((find-font (font-spec :name "Hack"))
  (set-frame-font "Hack-14")))

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; No percentage (and no "All"/"Top"/"Bot"):
;(setq mode-line-percent-position nil)

;; Show line numbers by default
(setq-default display-line-numbers 'relative)

;; Set fullscreen frame automatically
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Set frame title, to show file or buffer name
;; SOURCE: https://github.com/bbatsov/emacs.d/blob/master/init.el
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; Default identation width
(setq-default tab-width 2)

;; Tab first tries to indent the current line, and if the line was already
;; indented, then try to complete the thing at point.
(setq tab-always-indent 'complete)

;; Force packages relying on this general indentation variable (e.g., lsp-mode)
;; to indent with 2 spaces.
(setq-default standard-indent 2)

;; Newline at end of file
(setq require-final-newline t)

;; Make cursor movement faster
;; SOURCE: https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Keep emacs Custom-settings in separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (not (file-exists-p custom-file))
  (write-region "" nil custom-file))
(load custom-file)

;; Don't write lock-files
(setq create-lockfiles nil)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Auto-close brackets and double quotes
(electric-pair-mode 1)

;; Revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Set Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Swap terms like 'lambda' for their corresponding symbol
(global-prettify-symbols-mode t)

;; No wrap lines
(set-default 'truncate-lines t)

;; Show matching parens
(setq show-paren-delay 0)

(show-paren-mode 1)

;; Minimize garbage collection during startup
;(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
;(add-hook 'emacs-startup-hook
;          (lambda ()
;            (setq gc-cons-threshold (expt 2 23))))

; Remove borders from mode-line
;(set-face-attribute 'mode-line nil :box nil)
;(set-face-attribute 'mode-line-inactive nil :box nil)


;;--------------------------------------------------------------------
;;                               Theme
;;--------------------------------------------------------------------

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
;(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
;(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
;(setq solarized-scale-org-headlines nil)

;; Change the size of markdown-mode headlines (off by default)
;(setq solarized-scale-markdown-headlines t)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

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

;; Initialize use-package
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
(require 'use-package)

;; Setting for all, otherwise I need to specify in most of the packages
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

(use-package solarized-theme
  :defer nil
  :config
  (load-theme 'solarized-light t)
  (let ((line (face-attribute 'mode-line :underline)))
	(set-face-attribute 'mode-line          nil :overline   line)
	(set-face-attribute 'mode-line-inactive nil :overline   line)
	(set-face-attribute 'mode-line-inactive nil :underline  line)
	(set-face-attribute 'mode-line          nil :box        nil)
	(set-face-attribute 'mode-line-inactive nil :box        nil)
	(set-face-attribute 'mode-line-inactive nil :background "#f9f2d9")))

;; Compile packages, and use the newest version available
(use-package auto-compile
  :demand t
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; Install system package if needed
;; NOTE: Must add new package managers
(use-package use-package-ensure-system-package
  :demand t
  :custom
  (system-packages-package-manager 'apt))

(use-package evil
    :demand
    :init
    (progn
      ;(setq evil-want-keybinding nil)
      (setq evil-want-C-u-scroll t)
      (setq evil-want-fine-undo t)
      ; Undo character by character
      ;(advice-add 'undo-auto--last-boundary-amalgamating-number
      ;      :override #'ignore)
      (setq evil-mode-line-format nil)
      (evil-mode 1)))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; For the redo function to work correctly on evil-mode
(use-package undo-tree
  :after evil
  :demand
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(use-package evil-surround
	  :after evil
		:config
		(global-evil-surround-mode 1))

(use-package command-log-mode)

(use-package try)

(use-package which-key
  :config
  (which-key-mode))

(use-package rust-mode)

(use-package typescript-mode)

(use-package vimrc-mode)

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package eglot)

(use-package moody
  :defer nil
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode lisp-mode racket-mode) . rainbow-delimiters-mode))

(use-package dired-ranger)

;; Trigger garbage collection when idle for five seconds and memory usage is over 16 MB.
;; This package replaces the instructions on 'general stuff' section.
(use-package gcmh
		:demand t
		:init
		(setq gcmh-idle-delay 5
					gcmh-high-cons-threshold (* 16 1024 1024))
		:config
		(gcmh-mode))

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
;;                                 Keys
;;--------------------------------------------------------------------

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Toggle visuals
(global-set-key (kbd "<f5>") 'menu-bar-mode)
(global-set-key (kbd "<f6>") 'tool-bar-mode)
(global-set-key (kbd "<f7>") 'toggle-top-menu)
(global-set-key (kbd "<f8>") 'hidden-mode-line-mode)
(global-set-key (kbd "<f9>") 'toggle-line-numbering)

