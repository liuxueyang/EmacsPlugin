(require 'package)

(add-to-list 'package-archives 
         '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme
    lispy
    slime))

(mapcar #'(lambda (package)
        (unless (package-installed-p package)
          (package-install package)))
    myPackages)

(setq inhibit-startup-message t)

(global-linum-mode t)

(load-theme 'material t)


;; ==============================

(custom-set-variables
 '(tool-bar-mode nil nil (tool-bar)))

(custom-set-faces)

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

(set-face-attribute 'default (selected-frame) :height 120)

(add-hook 'text-mode-hook 'text-mode-hook-identify)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; --------------------
;; transparent
(set-frame-parameter (selected-frame) 'alpha '(50 50))
(add-to-list 'default-frame-alist '(alpha 50 50))

;; lispy-mode
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))

 ;; Set your lisp system and, optionally, some contribs
 (setq inferior-lisp-program "~/bin/clisp")
 (setq slime-contribs '(slime-fancy))
