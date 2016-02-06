(require 'package)

(add-to-list 'package-archives 
         '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

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

(set-face-attribute 'default (selected-frame) :height 140)

(add-hook 'text-mode-hook 'text-mode-hook-identify)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

