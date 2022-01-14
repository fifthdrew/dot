(deftheme my-default "My own Emacs color theme")

(let ((class '((class color) (min-colors 8))))
  (custom-theme-set-faces
   'my-default

   ;normal stuff
   `(default ((,class (:background "darkblack" :foreground "lightwhite"))))
   `(cursor ((,class (:background "lightgreen" :forefround "lightgreen"))))
   `(fringe ((,class (:background "none" :foreground "lightgreen"))))
   ; special stuff
   `(font-lock-builtin-face ((,class (:foreground "lightblue"))))
   `(font-lock-constant-face ((,class (:foreground "lightcyan"))))
   `(font-lock-keyword-face ((,class (:foreground "lightblue"))))
   `(font-lock-string-face ((,class (:foreground "lightcyan"))))
   `(font-lock-comment-face ((,class (:foreground "LightGreen"))))
   `(font-lock-warning-face ((,class (:foreground "lightred"))))
   `(font-lock-type-face ((,class (:foreground "lightyellow"))))
   `(font-lock-variable-name-face ((,class (:foreground "lightwhite"))))
   `(font-lock-function-name-face ((,class (:foreground "lightwhite"))))
   `(font-lock-constant-face ((,class (:foreground "lightcyan"))))
   `(font-lock-warning-face ((,class (:foreground "lightred"))))))

(provide-theme 'my-default)
