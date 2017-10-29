;; ------------------------------
;; Javascript
;; ------------------------------
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq js2-basic-offset 2)
(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert"
				   "refute" "setTimeout" "clearTimeout" "setInterval"
				   "clearInterval" "location" "__dirname" "console"
				   "JSON" "test" "$" "__dirname" "describe" "it"
				   "process"))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
;; refactor
(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook
 'js2-mode-hook (lambda ()
                  (add-hook
                   'xref-backend-functions #'xref-js2-xref-backend nil t)))

(require 'company-tern) ;; npm i -g tenr

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))

;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

(provide 'js-setup)
