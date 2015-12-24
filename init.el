;; ====================
;; Default customize
;; ====================
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(global-highlight-sexp-mode t)
 '(global-linum-mode t)
 '(global-rainbow-blocks-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-stages-global-mode nil)
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(inhibit-startup-screen t)
 '(linum-format "%3d")
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(nyan-animate-nyancat nil)
 '(nyan-animation-frame-interval 5)
 '(nyan-mode nil)
 '(nyan-wavy-trail t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d2d2d" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width extra-expanded :foundry "nil" :family "Inconsolata"))))
 '(highlight-stages-level-1-face ((t (:background "OliveDrab1"))))
 '(highlight-stages-level-2-face ((t (:background "honeydew1"))))
 '(highlight-stages-level-3-face ((t (:background "LightPink4"))))
 '(linum ((t (:background "#515151" :distant-foreground "black" :foreground "#99cc99" :slant normal :width expanded))))
 '(menu ((t nil)))
 '(rainbow-blocks-depth-1-face ((t (:foreground "SpringGreen4"))))
 '(rainbow-blocks-depth-2-face ((t (:foreground "dark cyan"))))
 '(rainbow-blocks-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "slate blue"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "medium orchid"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "indian red"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "peach puff"))))
 '(rainbow-blocks-depth-8-face ((t (:foreground "light green"))))
 '(rainbow-blocks-depth-9-face ((t (:foreground "forest green"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "dark magenta"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face :background "green"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "yellow"))))
 '(scroll-bar ((t nil))))

;; ====================
;; Extra Packages ;-)
;; ====================

;; --------------------
;; add packages-path installed manually
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; --------------------
;; slime
(setq inferior-lisp-program "~/bin/clisp")
;(setq inferior-lisp-program "/Applications/Clozure\ CL.app/Contents/Resources/ccl/scripts/ccl64")
(setq slime-contribs '(slime-fancy))

;; --------------------
;; quicklisp for slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "clisp" with the path to your implementation
(setq inferior-lisp-program "clisp")

;; --------------------
;; rainbow-delimiters-mode
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)

;; --------------------
;; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;; --------------------
;; highlight-sexps
(require 'highlight-sexp)
(add-hook 'lisp-mode-hook 'highlight-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-sexp-mode)

;; --------------------
;; common-lisp-snippets
(require 'yasnippet)
(yas-global-mode 1)
(require 'common-lisp-snippets)

;; --------------------
;; iedit
(require 'iedit)
; fix iedit in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; --------------------
;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; --------------------
;; transparent
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;; --------------------
;; Icicles: enhances minibuffer completion
(require 'icicles)
(icy-mode 1)

;; --------------------
;; ace-window
(global-set-key (kbd "M-q") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-dispatch-always t)

;; --------------------
;; disable scroll bar
; (scroll-bar-mode -1)


;; --------------------
;; macrostep
(define-key emacs-lisp-mode-map
  (kbd "C-c e")
  'macrostep-expand)


;; ====================
;; Built-in customization
;; ====================

;; see matching pairs of parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)


;; --------------------
;; Emacs::PDE
(add-to-list 'load-path "~/.emacs.d/pde")
(load "pde-load")

;; --------------------
;; jdei: python environment
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; --------------------
;; exec-path-from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; --------------------
;; jdee
(require 'jdee)

;; --------------------
;; java-snippets
(require 'java-snippets)

;; --------------------
;; pretty-lambdada
(require 'pretty-lambdada)
(pretty-lambda-for-modes)

;; --------------------
;; AucTex
(require 'tex)
(load "auctex.el" nil t t)
(load "preview.elc" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)
(setq TeX-PDF-mode t)
(eval-after-load "tex"
  '(progn (TeX-global-PDF-mode t)))
(setq TeX-view-program-list
      '(("Okular" "okular --unique %o")))
(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list
                                          '("XeLaTeX"
                                            "%`xelatex%(mode)%' %t"
                                            TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             (setq TeX-save-query  nil )
                             (setq TeX-show-compilation t)))

;; --------------------
;; latex-preview-pane
(latex-preview-pane-enable)

;; --------------------
;; cdlatex
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

;; --------------------
;; auto-complete-auctex
(require 'auto-complete-auctex)


