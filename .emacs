;;;; This is my custom emacs file
;;;; 2015/02/23

;;; ==============================
;;; slime

 (setq inferior-lisp-program "/usr/bin/clisp")
 (setq slime-contribs '(slime-fancy))

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
(color-theme-initialize)
(color-theme-subtle-hacker)

;;; ==============================
;;; col

;;; ==============================


(custom-set-variables
 ;; hiding the toolbar
 '(tool-bar-mode nil nil (tool-bar)))
(menu-bar-mode -1)
(custom-set-faces)

(show-paren-mode 1)
(setq show-paren-delay 0)
(require 'paren)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;
;
(add-to-list 'load-path "~/.emacs.d/rainbow-blocks")
(require 'rainbow-blocks)
(add-hook 'lisp-mode-hook 'rainbow-blocks-mode)
;
;
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



;					(print (font-family-list))

;					(member "monospace" (font-family-list))

					; how to comment a block? This is what I want to do...

(when (member "monospace" (font-family-list))
  (set-face-attribute 'default nil :font "monospace" :height 150))
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
(set-frame-parameter (selected-frame) 'alpha '(90 100))
(add-to-list 'default-frame-alist '(alpha 90 100))
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

(require 'linum)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(global-linum-mode 1)
(eval-after-load 'linum
  '(progn
     (defface linum-leading-zero
       `((t :inherit 'linum
            :foreground ,(face-attribute 'linum :background nil t)))
       "Face for displaying leading zeroes for line numbers in display margin."
       :group 'linum)

     (defun linum-format-func (line)
       (let ((w (length
                 (number-to-string (count-lines (point-min) (point-max))))))
         (concat
          (propertize (make-string (- w (length (number-to-string line))) ?0)
                      'face 'linum-leading-zero)
          (propertize (number-to-string line) 'face 'linum))))
     
     (setq linum-format 'linum-format-func)))


(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
    (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)
;;; ==============================


;;; ==============================
;; highlighting parentheses
(require 'highlight-parentheses)

(add-hook 'lisp-mode-hook
          '(lambda ()
             (highlight-parentheses-mode)
             (setq autopair-handle-action-fns
                   (list 'autopair-default-handle-action
                         '(lambda (action pair pos-before)
                            (hl-paren-color-update))))))

;(add-hook 'highlight-parentheses-mode-hook
;          '(lambda ()
;             (setq autopair-handle-action-fns
;                   (append
;		    (if autopair-handle-action-fns
;			autopair-handle-action-fns
;		      '(autopair-default-handle-action))
;		    '((lambda (action pair pos-before)
;			(hl-paren-color-update)))))))
;
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;;; ==============================

;;; ==============================
;;; paredit
;(add-to-list 'load-path "~/.emacs.d/")
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)


(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;;; ==============================

;;; ==============================
;;;  comments
(defun uncomment-region (beg end)
  "Like `comment-region' invoked with a C-u prefix arg."
  (interactive "r")
  (comment-region beg end -1))
;;; ==============================