(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(load-file "~/.emacs.d/mine/xresources-theme.el")
(package-initialize)
(tool-bar-mode -1)
(menu-bar-mode -1)
(xterm-mouse-mode 1)
(scroll-bar-mode -1)
;;(global-linum-mode 0)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(battery-mode-line-format " %p" t)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "9cb6358979981949d1ae9da907a5d38fb6cde1776e8956a1db150925f2dad6c1" default)))
 '(erc-track-position-in-mode-line t t)
 '(linum-format (quote linum-relative))
 '(linum-relative-format "%3s   ")
 '(markdown-command "/usr/bin/pandoc")
 '(web-mode-enable-current-element-highlight t))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(linum-relative-mode)
(setq inhibit-startup-screen t)
(setq visible-cursor nil)
(defun display-startup-echo-area-message ()
  (message ""))
(electric-pair-mode t)
(setq web-mode-enable-current-element-highlight t)
(global-set-key(kbd "<f9>") 'backward-kill-word)
(global-unset-key(kbd "M-:"))
(key-chord-define-global "2~" 'backward-kill-word)
(require 'evil-multiedit)
;;(key-chord-define-global "MA" 'mc/mark-next-like-this)
;;(key-chord-define-global "MM" 'mc/mark-previous-like-this)
(key-chord-define-global "MA" 'evil-multiedit-match-all)
;;(key-chord-define-global "mp" 'evil-mc-pause-cursors)
;;(key-chord-define-global "mx" 'evil-mc-undo-all-cursors)
;;(key-chord-define-global "mr" 'evil-mc-resume-cursors)
(require 'dired+)
(eval-after-load "dired"
   '(progn
      (define-key dired-mode-map "F" 'my-dired-find-file)
      (defun my-dired-find-file (&optional arg)
	"Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
	(interactive "P")
	(let* ((fn-list (dired-get-marked-files nil arg)))
	           (mapc 'find-file fn-list)))))
(defvar sticky-buffer-previous-header-line-format)
(define-minor-mode sticky-buffer-mode
  "Make the current window always display this buffer."
  nil " sticky" nil
  (if sticky-buffer-mode
      (progn
	(set (make-local-variable 'sticky-buffer-previous-header-line-format)
	     header-line-format)
	(set-window-dedicated-p (selected-window) sticky-buffer-mode))
    (set-window-dedicated-p (selected-window) sticky-buffer-mode)
        (setq header-line-format sticky-buffer-previous-header-line-format)))
(require 'evil)
(eval-after-load 'ibuffer
  '(progn
(evil-set-initial-state 'ibuffer-mode 'normal)
(evil-define-key 'normal ibuffer-mode-map
(kbd "m") 'ibuffer-mark-forward
(kbd "t") 'ibuffer-toggle-marks
(kbd "u") 'ibuffer-unmark-forward
(kbd "=") 'ibuffer-diff-with-file
(kbd "J") 'ibuffer-jump-to-buffer
(kbd "M-s a C-s") 'ibuffer-do-isearch
(kbd "M-s a M-C-s") 'ibuffer-do-isearch-regexp
(kbd "j") 'evil-next-line
(kbd "k") 'evil-previous-line
(kbd "l") 'ibuffer-visit-buffer
)))
(evil-define-key 'normal dired-mode-map "h" 'my-dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
(evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
(evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
(evil-define-key 'normal dired-mode-map "m" 'dired-mark)
(evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
(evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
(evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
(defun my-dired-up-directory ()
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
        ))
(evil-mode 1)
(require 'key-chord)
(key-chord-mode 1)
;;(require 'powerline-evil)
;;(powerline-evil-vim-theme)
;;(require 'airline-themes)
;;(load-theme 'airline-molokai)
;;(sml/setup)
;;(setq sml/theme 'dark)
;;(setq sml/no-confirm-load-theme t)

;;(setq-default mode-line-format
;;	       '("%e" mode-line-front-space
;;		 ;; Standard info about the current buffer
;;		 mode-line-mule-info
;;		 mode-line-client
;;		 mode-line-modified
;;		 mode-line-remote
;;		 mode-line-frame-identification
;;		 mode-line-buffer-identification " " mode-line-position
;;		 ;; Some specific information about the current buffer:
;;		 lunaryorn-projectile-mode-line ; Project information
;;		 (vc-mode lunaryorn-vc-mode-line) ; VC information
;;		 (flycheck-mode flycheck-mode-line) ; Flycheck status
;;		 (multiple-cursors-mode mc/mode-line) ; Number of cursors
;;		 ;; Misc information, notably battery state and function name
;;		 " "
;;		 mode-line-misc-info
;;		 ;; And the modes, which I don't really care for anyway
;;		                 " " mode-line-modes mode-line-end-spaces))
;;(require 'spaceline-config)
;;(spaceline-emacs-theme)
;;(require 'telephone-line)
;;(telephone-line-mode 1)
;;(load-theme 'tango-plus t)
;;(require 'color-theme-sanityinc-solarized)
;;(color-theme-sanityinc-solarized-light)

(global-auto-revert-mode t)
(defun on-after-init ()
   (unless (display-graphic-p (selected-frame))
     (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)
(display-time-mode t)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-normal-state-map "id" 'reindent-then-newline-and-indent)
(key-chord-define-global "bb" 'ibuffer)
(key-chord-define evil-normal-state-map "oo" 'newline-without-break)
(key-chord-define evil-normal-state-map "OO" 'prev-newline-without-break)
(defun newline-without-break()
    (interactive)
    (let ((oldpos (point)))
      (end-of-line)
         (newline-and-indent)))
(defun prev-newline-without-break()
    (interactive)
    (let ((oldpos (point)))
      (previous-line)
      (end-of-line)
          (newline-and-indent)))
(setq scroll-margin 5
  scroll-conservatively 9999
  scroll-step 1)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(defun sudo-edit (&optional arg)
    (interactive "P")
    (if (or arg (not buffer-file-name))
	(find-file (concat "/sudo:root@localhost:"
			   (ido-read-file-name "Find file(as root): ")))
      (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'sudo-edit)
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(require 'helm-config)
(require 'helm)
;;(helm-mode 1)
;;(global-set-key (kbd "M-x") 'helm-M-x)
(require 'hydra)
(defhydra helm-like-unite ()
  ("q" keyboard-escape-quit "exit")
  ("<spc>" helm-toggle-visible-mark "mark")
  ("a" helm-toggle-all-marks "(un)mark all")
  ("v" helm-execute-persistent-action)
  ("g" helm-beginning-of-buffer "top")
  ("h" helm-previous-source)
  ("l" helm-next-source)
  ("G" helm-end-of-buffer "bottom")
  ("j" helm-next-line "down")
  ("k" helm-previous-line "up")
  ("i" nil "cancel"))
(global-set-key (kbd "C-c j") 'helm-like-unite/body)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(setq js2-strict-missing-semi-warning nil)
(setq js2-include-node-externs t)
(require 'flycheck)
(require 'js2-mode)


(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; Disable JSCS linting (optional but if you're using ESLint you probably don't
;; need this).
(let ((checkers (get 'javascript-eslint 'flycheck-next-checkers)))
  (put 'javascript-eslint 'flycheck-next-checkers
       (remove '(warning . javascript-jscs) checkers)))

(defun setup-js2-mode ()
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-mode))

(add-hook 'js2-mode-hook #'setup-js2-mode)
(require 'enh-ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.opa\\'" . org-mode))

(require 'zone)
(zone-when-idle 120)
;;(setq linum-relative-format "%4d  ")
(setq linum-relative-format "\ %3s   ")
(add-hook 'after-change-major-mode-hook
   '(lambda ()
      (linum-mode (if (or (equal major-mode 'lisp-interaction-mode)(equal major-mode 'text-mode) (equal major-mode 'term-mode) (equal major-mode 'help-mode)) 0 1))))
(setq initial-scratch-message "\


     
     
                 .s    s.                                                    
                       SS. .s5SSSs.  .s5SSSs.  .s    s.  .s    s.  .s5SSSs.  
       .sSs.     sSs.  S%S       SS.       SS.       SS.       SS.       SS. 
       S%%%S     SS`S. S%S sS    S%S sS    S%S sS    S%S sS    S%S sS    S%S 
       `:;:'     SS `S.S%S SS    S%S SS    S%S SSSs. S%S SS    S%S SS .sSSS  
                 SS  `sS%S SS    S%S SS    S%S SS    S%S SS    S%S SS    S%S 
       .sSs.     SS    `:; SS    `:; SS    `:; SS    `:; SS    `:; SS    `:; 
       S%%%S     SS    ;,. SS    ;,. SS    ;,. SS    ;,. SS    ;,. SS    ;,. 
       `:;:'     :;    ;:' `:;;;;;:' `:;;;;;:' :;    ;:' `:;;;;;:' `:;;;;;:'
     






")


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "unspecified-bg" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(diredp-dir-name ((t (:background "black" :foreground "green"))))
 '(font-lock-builtin-face ((t (:foreground "brightred"))))
 '(font-lock-comment-face ((t (:foreground "brightblack"))))
 '(font-lock-constant-face ((t (:foreground "brightred"))))
 '(font-lock-function-name-face ((t (:foreground "brightcyan"))))
 '(font-lock-keyword-face ((t (:foreground "#FFD700"))))
 '(font-lock-string-face ((t (:foreground "#ffffff"))))
 '(font-lock-variable-name-face ((t (:foreground "brightcyan"))))
 '(highlight ((t (:background "#fff"))))
 '(highlight-indent-guides-even-face ((t (:background "color-232"))))
 '(highlight-indent-guides-odd-face ((t (:background "color-233"))))
 '(hl-line ((t (:inherit highlight :background "black"))))
 '(iedit-occurrence ((t (:background "blue"))))
 '(js2-external-variable ((t (:foreground "brightblue"))))
 '(js2-function-call ((t (:inherit default :foreground "green"))))
 '(js2-function-param ((t (:foreground "magenta"))))
 '(linum ((t (:inherit (shadow default) :foreground "#FDD700"))))
 '(linum-relative-current-face ((t (:inherit linum :background "color-233" :foreground "brightgreen" :weight bold))))
 '(mode-line ((t (:background "Black" :foreground "#fff" :inverse-video nil :box nil))))
 '(region ((t (:background "blue"))))
 '(web-mode-constant-face ((t (:inherit font-lock-constant-face :foreground "brightred"))))
 '(web-mode-css-property-name-face ((t (:inherit font-lock-variable-name-face :foreground "#FFD700"))))
 '(web-mode-current-element-highlight-face ((t (:background "#FFD700" :foreground "black"))))
 '(web-mode-function-call-face ((t (:inherit font-lock-function-name-face :foreground "brightcyan"))))
 '(web-mode-function-name-face ((t (:inherit font-lock-function-name-face :foreground "brightcyan"))))
 '(web-mode-html-attr-value-face ((t (:inherit font-lock-string-face :foreground "brightcyan"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#ffffff"))))
 '(web-mode-javascript-string-face ((t (:inherit web-mode-string-face :foreground "#ffffff"))))
 '(web-mode-keyword-face ((t (:inherit font-lock-keyword-face :foreground "brightmagenta"))))
 '(web-mode-symbol-face ((t (:foreground "black"))))
 '(web-mode-variable-name-face ((t (:inherit font-lock-variable-name-face :foreground "#ffd700")))))
(put 'dired-find-alternate-file 'disabled nil)

