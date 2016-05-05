(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar myPackages
  '(
    better-defaults
    icicles
    lispy
    slime
    rainbow-blocks
    rainbow-delimiters
    highlight-sexp
    multiple-cursors
    geiser
    pretty-lambdada
    exec-path-from-shell
    2048-game
    color-theme-modern
    auto-complete                       ;autocomplete code
    multi-term                          ;optimize term
    solarized-theme                     ;beautiful theme
    ido-hacks                           ;autocomplete minibuffer better
    ))
(require 'better-defaults)
(mapcar #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        myPackages)
(setq inhibit-startup-message t)
(global-linum-mode t)
(load-theme 'charcoal-black t t)
(enable-theme 'charcoal-black)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(hl-sexp-background-color "gray1"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-blocks-depth-1-face ((t (:foreground "red"))))
 '(rainbow-blocks-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-blocks-depth-3-face ((t (:foreground "yellow"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "green"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-blocks-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-blocks-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face :background "green"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "yellow")))))
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; open compression file
(setq auto-compression-mode 1)
;; icicles
;; (require 'icicles)
;; (icy-mode 1)
;; menu-bar and tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
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
(set-face-attribute 'default (selected-frame) :height 140)

(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; --------------------
;; transparent

(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))
;; lispy-mode
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(add-hook 'scheme-mode-hook (lambda () (lispy-mode 1)))

 (defun conditionally-enable-lispy ()
  (when (eq this-command 'eval-expression)
    (lispy-mode 1)
    (local-set-key "β" 'helm-lisp-completion-at-point)))
(add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)
;; Set your lisp system and, optionally, some contribs

(setq inferior-lisp-program "~/Bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; configure slime
(add-hook
 'slime-connected-hook
 (lambda ()
   (when (find-if
          #'(lambda (buffer)
              (string=
               "*inferior-lisp*"
               (buffer-name buffer)))
          (buffer-list))
     (slime-redirect-inferior-output))))

;; rainbow-blocks-mode
(add-hook 'lisp-mode-hook 'rainbow-blocks-mode)

(add-hook 'emacs-lisp-mode-hook 'rainbow-blocks-mode)
(add-hook 'scheme-mode-hook 'rainbow-blocks-mode)
;; rainbow-delimiters-mode
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

;; solarized-dark theme
;; ==============================

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
;; (setq solarized-use-variable-pitch nil)

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

;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1)
;; (setq solarized-height-plus-1 1)
;; (setq solarized-height-plus-2 1)
;; (setq solarized-height-plus-3 1)
;; (setq solarized-height-plus-4 1)

(load-theme 'solarized-dark t)

;; ==============================
;; end of solarized-dark theme


;; highlight sexp mode
(add-hook 'lisp-mode-hook 'highlight-sexp-mode)

(add-hook 'emacs-lisp-mode-hook 'highlight-sexp-mode)
(add-hook 'scheme-mode-hook 'highlight-sexp-mode)

(put 'downcase-region 'disabled nil)
;; I usually use this command to read the expanded macro.

(cond
 ((eq system-type 'gnu/linux)
  (if (string-match-p "ARCH" operating-system-release)
      (progn (set-face-attribute 'default nil :font "Hermit-10")
             (set-frame-font "Hermit-10" nil t))
    (progn (set-face-attribute 'default nil :font "9x18")
           (set-frame-font "9x18" nil t)))
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft YaHei"
                                 :size 15))))
 ((eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font "Monospace-17")
  (set-frame-font "Monospace-17" nil t)
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "WenQuanYi Zen Hei Mono"
                                 :size 14))))
 (t
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "WenQuanYi Zen Hei Mono"
                                 :size 14)))))

;; change emacs font according to the Operating System ;)
;; scheme
(setq scheme-program-name "~/Bin/scheme")

;; geiser

(setq geiser-active-implementations '(chicken guile))

;; pretty-lambdada
(pretty-lambda-for-modes)

;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
  ;; quicklisp
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
;; frame size

(setq initial-frame-alist
      '((top . 10)
        (left . 30)
        (width . 90)
        (height . 30)))
(setq default-frame-alist
      '((width . 80) (height . 30)))
;; autocomplete
(ac-config-default)
;; multi-term
(require 'multi-term)
(setq multi-term-program "~/Bin/zsh")
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))
;; turn off visible-bell to avoid opaque on Mac OS X. ;-)
(setq visible-bell nil)

(setq frame-title-format
      (list
       (format
        "%s %%S: %%j "
        (system-name))
       '(buffer-file-name
         "%f"
         (dired-directory
          dired-directory
          "%b"))))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(global-set-key (kbd "C-c <f4>") 'show-file-name)
(defun xah-copy-file-path (&optional dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.
URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2015-12-02"
  (interactive "P")
  (let ((fpath (if (equal major-mode 'dired-mode)
                    (expand-file-name
                     default-directory)
                  (if (null (buffer-file-name))
                      (user-error
                       "Current buffer is not associated with a file.")
                    (buffer-file-name)))))
    (kill-new
     (if (null dir-path-only-p)
         (progn
           (message
            "File path copied: 「%s」"
            fpath)
           fpath)
       (progn
         (message
          "Directory path copied: 「%s」"
          (file-name-directory fpath))
         (file-name-directory fpath))))))

(global-set-key (kbd "C-c <f5>") 'xah-copy-file-path)
