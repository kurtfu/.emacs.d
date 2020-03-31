;;--- PACKAGE INITIALIZATIONS -------------------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-list
    '(all-the-icons
      auto-complete
      dumb-jump
      git-gutter
      magit
      neotree
      org
      smartparens
      spacemacs-theme
      undo-tree))

(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(unless package-archive-contents
    (package-refresh-contents))

(dolist (packs package-list)
    (unless (package-installed-p packs)
        (package-install packs)))

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(setq load-prefer-newer t)

;;--- UI INITIALIZATIONS ------------------------------------------------------

(load-theme 'spacemacs-dark t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-splash-screen t)
(setq visible-bell 1)

(column-number-mode t)
(global-display-line-numbers-mode t)

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))
(set-face-attribute 'default t :font "DejaVu Sans Mono-10")

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq inhibit-compacting-font-caches t)

(global-git-gutter-mode t)

(global-auto-revert-mode t)

;;--- EDITOR INITIALIZATIONS --------------------------------------------------

(setq-default delete-trailing-lines nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-hook 'c-mode-hook '(lambda () (setq c-basic-offset 4)))
(add-hook 'c++-mode-hook '(lambda () (setq c-basic-offset 4)))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))    
(setq mouse-wheel-progressive-speed nil)    
(setq mouse-wheel-follow-mouse 't)   
(setq scroll-step 1)

(windmove-default-keybindings 'meta)

(global-undo-tree-mode)

(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)
(show-paren-mode 1)

(electric-indent-mode 0)

(ac-config-default)

(dumb-jump-mode)
