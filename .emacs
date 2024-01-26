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
;(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono-12")

;;theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi)))
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
