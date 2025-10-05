
;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(display-line-numbers-type 'visual)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages '(dired-subtree multiple-cursors rust-mode))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;;; set global line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;;; set highlight line
(setq global-hl-line-sticky-flag t)
(global-hl-line-mode 1)

;;set alpha background
(set-frame-parameter (selected-frame) 'alpha 96)
(add-to-list 'default-frame-alist '(alpha . 96))

;;; update melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;;(package-refresh-contents)

;;; rust-mode
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;;; dired hacks
(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map))

;;; multi cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono NFM" :foundry "outline" :slant normal :weight regular :height 143 :width normal))))
 '(hl-line ((t (:background "#253D2C" :extend t)))))
