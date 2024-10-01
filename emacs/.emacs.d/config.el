(setq my/custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq my/leader-key "<spacebar>")

(setq my/notes-directory
      (file-name-as-directory
       (expand-file-name "~/Notes")))

(setq my/org-directory
      (file-name-as-directory
       (expand-file-name (concat my/notes-directory "/Org"))))

(setq my/themes-directory 
      (file-name-as-directory
       (expand-file-name (concat user-emacs-directory "/themes"))))

;; Set font family and size
(cond
((find-font (font-spec :name "MPLUS1Code"))
 (set-frame-font "MPLUS1Code 8" nil t)))

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Set path to themes directory
(add-to-list 'custom-theme-load-path my/themes-directory)

;; Set fullscreen frame automatically
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Keep emacs Custom-settings in separate file.
(when (not (file-exists-p my/custom-file))
  (write-region "" nil my/custom-file))
(load my/custom-file)

;; Set Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; No wrap lines
(set-default 'truncate-lines t)

;; Remove scroll bars
(set-window-scroll-bars (minibuffer-window) nil nil)

;; Set better scrolling
;; SOURCE: https://github.com/bbatsov/emacs.d/blob/master/init.el
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable scratch message
(setq initial-scratch-message nil)

;; Disable alarms
(setq ring-bell-function 'ignore)

;; No percentage (and no "All"/"Top"/"Bot"):
(setq mode-line-percent-position nil)

;; Show line numbers by default
;(setq-default display-line-numbers 'relative)

;; Set frame title, to show file or buffer name
;; SOURCE: https://github.com/bbatsov/emacs.d/blob/master/init.el
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; Default identation width
(setq-default tab-width 4)

;; Tab first tries to indent the current line, and if the line was already
;; indented, then try to complete the thing at point.
(setq tab-always-indent 'complete)

;; Force packages relying on this general indentation variable (e.g., lsp-mode)
;; to indent with 4 spaces.
(setq-default standard-indent 4)

;; Newline at end of file
(setq require-final-newline t)

;; Make cursor movement faster
;; SOURCE: https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)

;; Store backup files in the tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; Store autosave files in the tmp directory
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files
(setq create-lockfiles nil)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Show matching parens
(setq show-paren-delay 0)

;; Set scrolling mode
;; SOURCE: https://github.com/bbatsov/emacs.d/blob/master/init.el
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode t))

;; Remove unnecessary ui modes 
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))

;; Mode line settings
(line-number-mode t)
(column-number-mode t)
;(size-indication-mode t)

;; Auto-close brackets and double quotes
(electric-pair-mode 1)

;; Revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Swap terms like 'lambda' for their corresponding symbol
(global-prettify-symbols-mode t)

(show-paren-mode 1)

(fringe-mode 0)

;(ido-mode 1)

;; make the fringe stand out from the background
;;(setq solarized-distinct-fringe-background t)

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
;(setq solarized-scale-org-headlines nil)

;; Change the size of markdown-mode headlines (off by default)
;(setq solarized-scale-markdown-headlines t)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

; TODO: Move hooks to their own place
;(add-hook 'window-setup-hook 'on-after-init)

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
  (load-theme 'solarized-dark t)
  (let ((line (face-attribute 'mode-line :underline)))
    (set-face-attribute 'mode-line          nil :overline   line)
    (set-face-attribute 'mode-line          nil :background "#657B83")
    (set-face-attribute 'mode-line-inactive nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :underline  line)))

(use-package command-log-mode)

(use-package try)

(use-package which-key
  :config
  (which-key-mode))

(use-package markdown-mode)

(use-package rust-mode)

(use-package vimrc-mode)

(use-package go-mode)

;; (use-package magit
;;   :bind (("C-x g" . magit-status)
;;          ("C-x C-g" . magit-status)))

;; (use-package eglot)

(use-package diminish)

(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode lisp-mode racket-mode) . rainbow-delimiters-mode))

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

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Toggle visuals
(global-set-key (kbd "<f5>") 'menu-bar-mode)
(global-set-key (kbd "<f6>") 'tool-bar-mode)
(global-set-key (kbd "<f7>") 'toggle-top-menu)
(global-set-key (kbd "<f8>") 'hidden-mode-line-mode)
(global-set-key (kbd "<f9>") 'toggle-line-numbering)

;; Increase/Decrease font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
