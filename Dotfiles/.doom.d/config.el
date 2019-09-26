;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 13))

;;(set-frame-parameter (selected-frame) 'alpha '(70 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (70 . 50)))

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-nord t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(doom-themes-neotree-config)
(setq doom-neotree-enable-variable-pitch nil)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; My language <3 (and other configs)
(let ((default-directory  "~/Git/Electrux/Emacs-Configs/"))
  (normal-top-level-add-subdirs-to-load-path))
(require 'ethl-mode)

;; Set default style for C/C++ language.
(setq-default c-default-style "bsd")

;; Set indentation mode for C-esque languages.
(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)

(toggle-frame-fullscreen)
