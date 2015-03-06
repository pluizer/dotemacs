;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start up
(progn
  (setq inhibit-startup-message t)
  (setq inhibit-splash-screen t))

;; Packages
(progn
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

;; Looks
(progn
  ;; Theme
  (load-file "~/.emacs.d/themes/distinguished-theme.el")
  ;; Font
  (add-to-list 'default-frame-alist '(font . "Terminus-12" ))
  (set-face-attribute 'default t :font "Terminus-12" ))

;; Window selection
(progn
  (global-set-key (kbd "M-S-<left>")  'windmove-left)
  (global-set-key (kbd "M-S-<right>") 'windmove-right)
  (global-set-key (kbd "M-S-<up>")    'windmove-up)
  (global-set-key (kbd "M-S-<down>")  'windmove-down)
  (setq windmove-wrap-around t))

;; Navigation
(progn
  (global-set-key (kbd "C-l") 'ace-jump-mode)
  (global-set-key (kbd "C-;") 'goto-line))

;; Open init.el file
(progn
  (global-set-key (kbd "C-c e")
                  (lambda ()
                    (interactive)
                    (find-file "~/.emacs.d/init.el"))))

;; Helm
(progn
  (require 'helm-config)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t)
  (helm-mode 1)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C - C++y stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Indentation
(progn
  (setq c-default-style "linux"
        c-basic-offset 8))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lispy stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Paredit
(progn
  ;; Some different movement keys
  (require 'paredit)
  (define-key paredit-mode-map (kbd "<S-right>") 'paredit-forward)
  (define-key paredit-mode-map (kbd "<S-left>") 'paredit-backward)
  (define-key paredit-mode-map (kbd "<S-up>") 'backward-up-list)
  (define-key paredit-mode-map (kbd "<S-down>") 'down-list)
  (define-key paredit-mode-map (kbd "C-,") 'kill-sexp)
  ;; Activate automatically
  (autoload 'enable-paredit-mode "paredit" "" t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'geiser-repl-mode-hook      #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

;; Clojure
(progn
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (setq nrepl-log-messages t))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Javascripty stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; js2-mode
(progn
  (autoload 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

;; Typescript
(progn
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (tss-config-default))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Version control
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Magit
(progn
  (global-set-key (kbd "<f9>") 'magit-status))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Writing
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Markdown
(progn
  ;; Autoload
  (autoload 'markdown-mode "markdown-mode" "" t)
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

;; Spelling
(progn
  ;; Set to english on default
  (setq ispell-dictionary "british")
  ;; Key to set dutch dictionary
  (global-set-key (kbd "C-c s d")
                  (lambda ()
                    (interactive)
                    (ispell-change-dictionary "dutch")))
  ;; Key to set english dictionary
  (global-set-key (kbd "C-c s e")
                  (lambda ()
                    (interactive)
                    (ispell-change-dictionary "british"))))

;; Writeroom
(progn
  (global-set-key (kbd "<f10>") #'writeroom-mode))
