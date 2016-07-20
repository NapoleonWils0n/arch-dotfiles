; melpa rackages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
; hide toolbar
(tool-bar-mode -1)
; hide scrollbar
(scroll-bar-mode -1)
; markdown preview using pandoc
(setq markdown-command "pandoc -f markdown -t html -s -S --mathjax --highlight-style=pygments")
; hide start up screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
; fix tab in evil for org mode
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)
; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
; case insensitive search
(setq read-file-name-completion-ignore-case t)
(setq pcomplete-ignore-case t)
; powerline-evil
(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)
; magit 
(global-set-key (kbd "C-x g") 'magit-status)
