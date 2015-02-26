;;;; This is my custom emacs file
;;;; 2015/02/23

;;; ==============================
;;; package management
(require 'package)

(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(unless package-archive-contents 
  (package-refresh-contents))
;;; ==============================


(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme")

(require 'color-theme)


;;; ==============================
;;; col
(add-to-list 'load-path "~/.emacs.d/rainbow-blocks")
(color-theme-initialize)

;;; ==============================


(custom-set-variables
 ;; hiding the toolbar
 '(tool-bar-mode nil nil (tool-bar)))
(menu-bar-mode -1)
(custom-set-faces)

(show-paren-mode 1)
(setq show-paren-delay 0)
(require 'paren)

					;(set-face-background 'show-paren-match
					;(face-background 'default))
					;(set-face-foreground 'show-paren-match "#def")
					;(set-face-attribute 'show-paren-match nil
					; :weight 'extra-bold)


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(require 'rainbow-blocks)
(add-hook 'lisp-mode-hook 'rainbow-blocks-mode)


;;; ==============================
;;; for MELPA
(require 'package) ;; You might already have this line
;(add-to-list 'package-archives
;            '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;; ==============================



					;(print (font-family-list))

					;(member "Inconsolata" (font-family-list))

(when (member "Inconsolata" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata" :height 140))
					;(text-scale-increase 1)

					;(text-scale-decrease 2)

;;; ==============================
;;; highlight blocks configuration
(require 'highlight-sexps)
(add-hook 'lisp-mode-hook 'highlight-sexps-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-sexps-mode)
;;; ==============================




;;; ==============================
;;; autoindent
(add-hook 'lisp-mode-hook '(lambda ()
			     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'lisp-mode-hook
	  (lambda ()
	    (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'set-newline-and-indent)

(define-key global-map (kbd "RET") 'newline-and-indent)
;;; ==============================

;;; ==============================
;;; transparent emacs
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 50))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
;;; ==============================

;;; ==============================
;;; show line number

;;; ==============================
