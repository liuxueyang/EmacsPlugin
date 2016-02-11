(require 'package)

(add-to-list 'package-archives 
         '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme
    lispy
    slime
    rainbow-blocks
    rainbow-delimiters
    solarized-theme
    highlight-sexp))

(mapcar #'(lambda (package)
        (unless (package-installed-p package)
          (package-install package)))
    myPackages)

(setq inhibit-startup-message t)

(global-linum-mode t)

;; (load-theme 'material t)

(custom-set-variables
 '(delete-selection-mode nil)
 '(tool-bar-mode nil nil (tool-bar)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-blocks-depth-1-face ((t (:foreground "SpringGreen4"))))
 '(rainbow-blocks-depth-2-face ((t (:foreground "dark cyan"))))
 '(rainbow-blocks-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "slate blue"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "medium orchid"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "indian red"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "peach puff"))))
 '(rainbow-blocks-depth-8-face ((t (:foreground "light green"))))
 '(rainbow-blocks-depth-9-face ((t (:foreground "forest green")))))

(setq default-major-mode 'text-mode)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; open compression file
(setq auto-compression-mode 1)

;; calendar
(setq calendar-week-start-day 1)

(setq default-fill-column 80)

(global-font-lock-mode t)

(setq default-major-mode 'text-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(set-face-attribute 'default (selected-frame) :height 130)

(add-hook 'text-mode-hook 'text-mode-hook-identify)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; --------------------
;; transparent
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;; lispy-mode
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

 ;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "~/bin/clisp")
(setq slime-contribs '(slime-fancy))

;; rainbow-blocks-mode
(add-hook 'lisp-mode-hook 'rainbow-blocks-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-blocks-mode)

;; rainbow-delimiters-mode
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; solaried-dark theme
(load-theme 'solarized-dark t)

;; highlight sexp mode
(add-hook 'lisp-mode-hook 'highlight-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-sexp-mode)
