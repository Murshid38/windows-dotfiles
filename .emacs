;disable the startup screen
(setq inhibit-startup-screen t)

;setting height and width of startup frame size
(add-to-list 'default-frame-alist '(height . 25))
(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
(tool-bar-mode 0)
(menu-bar-mode 0)
;(tool-bar-mode 1)
;(menu-bar-mode 1)

;;default font
(set-face-attribute 'default nil :font "Source Code Pro-12")

;;theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(package-selected-packages '(harpoon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;disable the error sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Translate C-h to DEL
(keyboard-translate ?\C-h ?\C-?)
;; Define M-h to help  ---  please don't add an extra ' after help!
(global-set-key "\M-h" 'help)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
 (package-initialize)

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
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

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
