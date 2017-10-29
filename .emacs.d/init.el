;; Basic

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-splash-screen t)           ;; startup screen
(setq inhibit-startup-message t)
(load-theme 'wombat)                     ;; theme
(setq frame-title-format "Emacs")        ;; title frame
(global-linum-mode t)                    ;; line number
(column-number-mode)                     ;; column number
(menu-bar-mode -1)                       ;; menu bar
(tool-bar-mode -1)                       ;; tool bar
(scroll-bar-mode -1)                     ;; scroll nil
(set-default 'cursor-type 'bar)          ;; cursor blink|bar|vbar
(ido-mode)                               ;; ido
(show-paren-mode)                        ;; hl parent () []
(global-hl-line-mode 1)                  ;; hl current line
(winner-mode t)
(windmove-default-keybindings)
(prefer-coding-system 'utf-8-unix)       ;; encoding
(set-language-environment "UTF-8")
(setq iso-transl-char-map nil)
(setq vc-follow-symlinks t)              ;; follow symbolic link

(ido-mode t)                             ;; ido
(setq ido-enable-flex-matching t)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil)

;; backup and autosave (temp dir)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq abbrev-file-name
      (concat user-emacs-directory ".abbrev_defs"))

;; paths dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; load paths
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path settings-dir)

;; ------------------------------
;; Packages
;; ------------------------------
(require 'setup-packages)
(require 'mappings)

;; smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(setq exec-path-from-shell-check-startup-files nil)

;; auto-complete
(ac-config-default)

;; autopair
(autopair-global-mode)

;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile-find-file)

;; exec-path
(exec-path-from-shell-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (neotree nodejs-repl pyvenv csv-mode magit markdown-mode exec-path-from-shell jinja2-mode mmm-mode less-css-mode jedi company-tern xref-js2 js2-refactor js2-mode projectile autopair auto-complete smex))))
(put 'erase-buffer 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)       ;; on save delete whitespace

;; ------------------------------
;; Setup Specific Languages
;; ------------------------------
(eval-after-load 'js2-mode '(require 'js-setup))
(eval-after-load 'python-mode '(require 'python-setup))

;; handlebars-mode .hbs .handlebars
(require 'handlebars-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ------------------------------
;; Magit
;; ------------------------------
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; ------------------------------
;; Functions
;; ------------------------------

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun collapse-blank-lines (start end)
  (interactive "r")
  (replace-regexp "^\n\\{2,\\}" "\n" nil start end))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;; eshell
(defun clear-eshell ()
  "Clear eshell terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

;; ------------------------------
;; key-bindings
;; ------------------------------
(defun my-shell-hook ()
  (local-set-key "\C-l" 'clear-shell)
  (linum-mode -1))
(add-hook 'shell-mode-hook 'my-shell-hook)
(global-set-key (kbd "C-c i") 'cleanup-buffer)                ;; cleanup-buffer
(global-set-key (kbd "C-z") 'shell)                          ;; eshell
(global-set-key (kbd "C-x M-z") 'suspend-frame)               ;; suspend frame
;; resize w
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(add-hook 'eshell-mode-hook                               ;; eshell clear buff C-l
          '(lambda()
             (local-set-key (kbd "C-l") 'clear-eshell)))
(add-hook 'eshell-mode-hook (lambda () (linum-mode -1)))
