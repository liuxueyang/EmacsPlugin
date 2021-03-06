;; ==============================
;; General configuration
;; ==============================

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
    better-defaults                  ; # 1
    powerline                        ; # 2 beautify status line.
    bongo                            ; # 3 listen to music
    volume                           ; # 4 change audio volume
    emojify                          ; # 5
    linum-off                        ; # 6
    nyan-mode                        ; # 7
    emms                             ; # 8
    icicles                          ; # 9
    lispy                            ; # 10
    slime                            ; # 11
    rainbow-blocks                   ; # 12
    rainbow-delimiters               ; # 13
    highlight-sexp                   ; # 14
    multiple-cursors                 ; # 15
    geiser                           ; # 16
    pretty-lambdada                  ; # 17
    exec-path-from-shell             ; # 18
    2048-game                        ; # 19
    color-theme-modern               ; # 20
    auto-complete                    ; # 21 autocomplete code
    multi-term                       ; # 22 optimize term
    solarized-theme                  ; # 23 beautiful theme
    ido-hacks                        ; # 24 autocomplete minibuffer better
    tabbar-ruler                     ; # 25 a modernised tabbar with ruler
    fold-this                        ; # 26 Just fold the active region, please.
    column-marker                    ; # 27 Highlight certain character columns
    company             ; # 28 Company is a text completion framework for Emacs.
    fill-column-indicator               ; # 29
    websocket                           ; # 30 Emacs WebSocket client and server
    markdown-preview-mode               ; # 32 markdown realtime preview minor mode.
    ))

;; ------------------------------

;; ==============================
;; Package configurations
;; ==============================

(require 'better-defaults)
(mapcar #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        myPackages)
(setq inhibit-startup-message t)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(require 'linum-off)

;; (load-theme 'charcoal-black t t)
;; (enable-theme 'charcoal-black)
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
 '(rainbow-blocks-depth-3-face ((t (:foreground "blue"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "green"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-blocks-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-blocks-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-mismatched-face
   ((t
     (:inherit rainbow-delimiters-unmatched-face
               :background "green"))))
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

(add-to-list 'default-frame-alist '(alpha 95 95))
(set-frame-parameter (selected-frame) 'alpha 90)
(defun transparency-set-initial-value ()
  "Set initial value of alpha parameter for the current frame"
  (interactive)
  (if (equal (frame-parameter nil 'alpha) nil)
      (set-frame-parameter nil 'alpha 100)))

(defun transparency-set-value (numb)
  "Set level of transparency for the current frame"
  (interactive "nEnter transparency level in range 0-100: ")
  (if (> numb 100)
      (message "Error! The maximum value for transparency is 100!")
    (if (< numb 0)
	(message "Error! The minimum value for transparency is 0!")
      (set-frame-parameter nil 'alpha numb))))

(defun transparency-increase ()
  "Increase level of transparency for the current frame"
  (interactive)
  (transparency-set-initial-value)
   (if (> (frame-parameter nil 'alpha) 0)
       (set-frame-parameter nil 'alpha
                            (+ (frame-parameter nil 'alpha) -2))
     (message "This is a minimum value of transparency!")))

(defun transparency-decrease ()
  "Decrease level of transparency for the current frame"
  (interactive)
  (transparency-set-initial-value)
  (if (< (frame-parameter nil 'alpha) 100)
      (set-frame-parameter nil 'alpha
                           (+ (frame-parameter nil 'alpha) +2))
    (message "This is a minimum value of transparency!")))

;; sample keybinding for transparency manipulation
(global-set-key (kbd "C-?") 'transparency-set-value)
;; the two below let for smooth transparency control
(global-set-key (kbd "C->") 'transparency-increase)
(global-set-key (kbd "C-<") 'transparency-decrease)
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

;; Use less colors for indicators such as git:gutter, flycheck
;; and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other
;; size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
;; (setq solarized-height-minus-1 1)
;; (setq solarized-height-plus-1 1)
;; (setq solarized-height-plus-2 1)
;; (setq solarized-height-plus-3 1)
;; (setq solarized-height-plus-4 1)

(load-theme 'solarized-light t)

;; ==============================
;; end of solarized-dark theme


;; highlight sexp mode
(add-hook 'lisp-mode-hook 'highlight-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-sexp-mode)
(add-hook 'scheme-mode-hook 'highlight-sexp-mode)

(put 'downcase-region 'disabled nil)
;; I usually use this command to read the expanded macro.

(defun which-linux-distribution ()
  "from lsb_release"
  (interactive)
  (when (eq system-type 'gnu/linux)
    (shell-command-to-string "lsb_release -sd")))

(cond
 ((eq system-type 'gnu/linux)
  (let ((distribution (which-linux-distribution)))
    (cond ((string-match-p "openSUSE" distribution)
           (set-face-attribute 'default nil :font "Hermit-11")
           (set-frame-font "Hermit-11" nil t))
          ((string-match-p "Arch" distribution)
           (set-face-attribute 'default nil :font "Hermit-12")
           (set-frame-font "Hermit-12" nil t))))
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft YaHei"
                                 :size 15)))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "sbcl"))
 ((eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font "Hermit-12")
  (set-frame-font "Hermit-12" nil t)
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "WenQuanYi Zen Hei Mono"
                                 :size 14))))
 (t
  (set-face-attribute 'default nil :font "Hermit-15")
  (set-frame-font "Hermit-15" nil t)
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "WenQuanYi Zen Hei Mono"
                                 :size 14)))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "sbcl")))

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
;; (setq visible-bell nil)
(setq ring-bell-function 'ignore)

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

;; https://www.emacswiki.org/emacs/CopyWithoutSelection#toc4
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point))

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end))))

(defun paste-to-mark (&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe (lambda ()
                   (if (string=
                        "shell-mode"
                        major-mode)
                       (progn
                         (comint-next-prompt 25535)
                         (yank))
                     (progn
                       (goto-char (mark))
                       (yank))))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing
   'backward-word
   'forward-word
   arg)
  ;;(paste-to-mark arg)
  )
(global-set-key
 (kbd "C-c w")
 (quote copy-word))

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (copy-thing
   'beginning-of-line
   'end-of-line
   arg)
  (paste-to-mark arg))

(global-set-key
 (kbd "C-c l")
 (quote copy-line))

(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
  (interactive "P")
  (copy-thing
   'backward-paragraph
   'forward-paragraph
   arg)
  (paste-to-mark arg))

(global-set-key
 (kbd "C-c p")
 (quote copy-paragraph))

(defun beginning-of-string (&optional arg)
  "  "
  (re-search-backward
   "[ \t]"
   (line-beginning-position)
   3
   1)
  (if (looking-at "[\t ]")
      (goto-char (+ (point) 1))))
(defun end-of-string (&optional arg)
  " "
  (re-search-forward
   "[ \t]"
   (line-end-position)
   3
   arg)
  (if (looking-back "[\t ]")
      (goto-char (- (point) 1))))

(defun thing-copy-string-to-mark (&optional arg)
  " Try to copy a string and paste it to the mark
     When used in shell-mode, it will paste string on shell prompt by default "
  (interactive "P")
  (copy-thing
   'beginning-of-string
   'end-of-string
   arg)
  (paste-to-mark arg))

(global-set-key
 (kbd "C-c s")
 (quote
  thing-copy-string-to-mark))

(defun beginning-of-parenthesis (&optional arg)
  "  "
  (re-search-backward
   "[[<(?\"]"
   (line-beginning-position)
   3
   1)
  (if (looking-at "[[<(?\"]")
      (goto-char (+ (point) 1))))
(defun end-of-parenthesis (&optional arg)
  " "
  (re-search-forward
   "[]>)?\"]"
   (line-end-position)
   3
   arg)
  (if (looking-back "[]>)?\"]")
      (goto-char (- (point) 1))))

(defun thing-copy-parenthesis-to-mark (&optional arg)
  " Try to copy a parenthesis and paste it to the mark
     When used in shell-mode, it will paste parenthesis on shell
 prompt by default "
  (interactive "P")
  (copy-thing
   'beginning-of-parenthesis
   'end-of-parenthesis
   arg)
  (paste-to-mark arg))
(global-set-key
 (kbd "C-c a")
 (quote
  thing-copy-parenthesis-to-mark))

;; etags
;; (setq path-to-ctags "/")

;; fix a small problem for fish
(add-hook 'term-mode-hook
          (lambda ()
            (toggle-truncate-lines)
            (setq term-prompt-regexp "^.*❯❯❯ ")
            (make-local-variable 'mouse-yank-at-point)
            (setq mouse-yank-at-point t)
            (make-local-variable 'transient-mark-mode)
            (setq transient-mark-mode nil)
            (setq yas-dont-activate t)))

;; configure ansi-term
(defun open-localhost ()
  (interactive)
  (ansi-term "zsh" "localhost"))

;; Use this for remote so I can specify command line arguments
(defun remote-term (new-buffer-name cmd &rest switches)
  (setq term-ansi-buffer-name (concat "*" new-buffer-name "*"))
  (setq term-ansi-buffer-name
        (generate-new-buffer-name term-ansi-buffer-name))
  (setq term-ansi-buffer-name
        (apply 'make-term term-ansi-buffer-name cmd nil switches))
  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)
  (term-set-escape-char ?\C-x)
  (switch-to-buffer term-ansi-buffer-name))

(defun open-pi ()
  (interactive) 
  (remote-term "raspberry-pi" "ssh" "192.168.1.103"))

;; powerline
;; (require 'powerline)
;; (powerline-center-theme)


;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;
;; General Configurations
;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; set keys to insert math symbol
(define-key key-translation-map (kbd "<f9> p") (kbd "φ"))
(define-key key-translation-map (kbd "<f9> x") (kbd "ξ"))
(define-key key-translation-map (kbd "<f9> i") (kbd "∞"))
(define-key key-translation-map (kbd "<f9> <right>") (kbd "→"))
(define-key key-translation-map (kbd "<f9> s") (kbd "∑"))
(define-key key-translation-map (kbd "<f9> ;") (kbd "⩽"))
(define-key key-translation-map (kbd "<f9> h") (kbd "⩾"))
(define-key key-translation-map (kbd "<f9> l") (kbd "<"))
(define-key key-translation-map (kbd "<f9> g") (kbd ">"))

(define-key key-translation-map (kbd "<f8> 1") (kbd "☵"))
(define-key key-translation-map (kbd "<f8> 2") (kbd "☷"))
(define-key key-translation-map (kbd "<f8> 3") (kbd "☳"))
(define-key key-translation-map (kbd "<f8> 4") (kbd "☴"))
(define-key key-translation-map (kbd "<f8> 6") (kbd "☰"))
(define-key key-translation-map (kbd "<f8> 7") (kbd "☱"))
(define-key key-translation-map (kbd "<f8> 8") (kbd "☶"))
(define-key key-translation-map (kbd "<f8> 9") (kbd "☲"))

;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;
;; plugin configurations
;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;

;; # 5 emojify
(add-hook 'after-init-hook #'global-emojify-mode)

;; # 7 nyan-mode
(require 'nyan-mode)
(add-hook 'scheme-mode-hook (lambda () (nyan-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (nyan-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (nyan-mode 1)))
;; (setf nyan-animate-nyancat t)

;; # 8 emms
;; emms, Emacs Multimedia System
;; Autoload the id3-browser and bind it to F7.
;; You can change this to your favorite EMMS interface.
(autoload 'emms-smart-browse "emms-browser.el" "Browse with EMMS" t)
(global-set-key [(f7)] 'emms-smart-browse)

(with-eval-after-load 'emms
  (emms-standard) ;; or (emms-devel) if you want all features
  (setq emms-source-file-default-directory "~/music"
        emms-info-asynchronously t
        emms-show-format "♪ %s")

  ;; Might want to check `emms-info-functions',
  ;; `emms-info-libtag-program-name',
  ;; `emms-source-file-directory-tree-function'
  ;; as well.

  ;; Determine which player to use.
  ;; If you don't have strong preferences or don't have
  ;; exotic files from the past (wma) `emms-default-players`
  ;; is probably all you need.
  (if (executable-find "mplayer")
      (setq emms-player-list '(emms-player-mplayer))
    (emms-default-players))

  ;; For libre.fm see `emms-librefm-scrobbler-username' and
  ;; `emms-librefm-scrobbler-password'.
  ;; Future versions will use .authoinfo.gpg.
  )
(require 'emms-history)
(emms-history-load)
(require 'emms-mode-line)
(emms-mode-line 1)
(require 'emms-playing-time)
(emms-playing-time 1)
(require 'emms-lyrics)
(emms-lyrics 1)
(global-set-key (kbd "C-c +") 'emms-volume-mode-plus)
(global-set-key (kbd "C-c -") 'emms-volume-mode-minus)
(require 'emms-streams)
(setq emms-playlist-default-major-mode 'emms-playlist-mode)
(defadvice gnus-group-get-new-news (around pause-emms)
  "Pause emms while Gnus is fetching mails or news."
  (if emms-player-playing-p
      (progn (emms-pause)
             ad-do-it
             (emms-pause))
    ad-do-it))
(ad-activate 'gnus-group-get-new-news)

;; # 25 a modernised tabbar with ruler
(setq tabbar-ruler-global-tabbar t)    ; get tabbar
(setq tabbar-ruler-global-ruler t)     ; get global ruler
(setq tabbar-ruler-popup-menu t)       ; get popup menu.
(setq tabbar-ruler-popup-toolbar t)    ; get popup toolbar
(setq tabbar-ruler-popup-scrollbar t)  ; show scroll-bar on mouse-move
(require 'tabbar-ruler)
(global-set-key (kbd "C-c t") 'tabbar-ruler-move)

;; # 26 Just fold the active region, please.
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;; # 27 column-marker
(require 'column-marker)
(add-hook 'lisp-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'emacs-lisp-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'scheme-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; # 28 Company is a text completion framework for Emacs.
(add-hook 'after-init-hook 'global-company-mode)

;; # 29 fill column indicator
(setq fci-rule-width 5)
(setq fci-rule-color "darkblue")
(add-hook 'after-change-major-mode-hook 'fci-mode)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (eq major-mode 'dired-mode)))
        (fci-mode 1))))
(global-fci-mode 1)
;; workaround to fix bug when use fci-mode with company
(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
;; workaround to fix bug when use with auto-complete-mode
(defun sanityinc/fci-enabled-p () (symbol-value 'fci-mode))

(defvar sanityinc/fci-mode-suppressed nil)
(make-variable-buffer-local 'sanityinc/fci-mode-suppressed)

(defadvice popup-create (before suppress-fci-mode activate)
  "Suspend fci-mode while popups are visible"
  (let ((fci-enabled (sanityinc/fci-enabled-p)))
    (when fci-enabled
      (setq sanityinc/fci-mode-suppressed fci-enabled)
      (turn-off-fci-mode))))

(defadvice popup-delete (after restore-fci-mode activate)
  "Restore fci-mode when all popups have closed"
  (when (and sanityinc/fci-mode-suppressed
             (null popup-instances))
    (setq sanityinc/fci-mode-suppressed nil)
    (turn-on-fci-mode)))

;; 
