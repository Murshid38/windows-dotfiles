;disable the startup screen
(setq inhibit-startup-screen t)

; applying same theme for new frame
(defun apply-my-theme (frame)
  (select-frame frame)
  (load-theme 'modus-vivendi t))

(if (daemonp)
    (add-hook 'after-make-frame-functions #'apply-my-theme)
  (load-theme 'modus-vivendi t))

;setting height and width of startup frame size
(add-to-list 'default-frame-alist '(height . 25))
(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
(tool-bar-mode 0)
;(menu-bar-mode 0)
;(tool-bar-mode 1)
(menu-bar-mode 1)

;;default font
(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline-12")

;;theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(package-selected-packages
   '(csharp-mode multiple-cursors sqlup-mode ob-sql-mode lsp-ui company ## lsp-mode which-key harpoon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;;disable the error sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Translate C-h to DEL
;(keyboard-translate ?\C-h ?\C-?)
;; Define M-h to help  ---  please don't add an extra ' after help!
;(global-set-key "\M-h" 'help)

;; You can use this hydra menu that have all the commands
(global-set-key (kbd "C-c a") 'harpoon-quick-menu-hydra)
(global-set-key (kbd "C-c h RET") 'harpoon-add-file)

;; And the vanilla commands
(global-set-key (kbd "C-c h f") 'harpoon-toggle-file)
(global-set-key (kbd "C-c h h") 'harpoon-toggle-quick-menu)
(global-set-key (kbd "C-c h c") 'harpoon-clear)
(global-set-key (kbd "C-8") 'harpoon-go-to-1)
(global-set-key (kbd "C-9") 'harpoon-go-to-2)

;setting single escape key instead of thrice 
;(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

;indeting 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; terminal emacs background transparent
(set-frame-parameter (selected-frame) 'background-mode 'dark)
(add-to-list 'default-frame-alist '(background-color . "unspecified-bg"))

; mode line background transparent for terminal only
(if (not (display-graphic-p))
    (custom-set-faces
     '(mode-line ((t (:background "unspecified-bg" :foreground "unspecified-fg"))))
     '(mode-line-inactive ((t (:background "unspecified-bg" :foreground "unspecified-fg"))))))

; load ob-csharp.el
(load "~/.emacs.d/ob-csharp.el")

; code evaluation in org mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)
   (C . t)
   (sql . t)
   (csharp . t)))

; dotnet commands
(setq org-babel-csharp-command "dotnet script") ; Adjust if needed
(setq org-babel-csharp-compiler "dotnet-compile") ; Adjust if needed

; enabling count for search
(setq isearch-lazy-count t)

; considering whitespace everything between search terms(not for regex search)
; for example "bg green" is going equivalent to "bg.*?green"
(setq search-whitespace-regexp ".*?")

; to type "y" or "n" instead of "yes" or "no"
(defalias 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)

(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Enable global visual line mode
(global-visual-line-mode t)

;disable backup
(setq make-backup-files nil)
;disable auto save
(setq auto-save-default nil)
