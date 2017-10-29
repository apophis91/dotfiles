;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Packages
(defvar local-packages
  '(magit
    projectile
    helm-projectile
    exec-path-from-shell
    auto-complete
    epc
    jedi
    pyvenv
    js2-mode
    js2-refactor
    xref-js2
    company-tern
    nodejs-repl
    smex
    autopair
    jinja2-mode
    markdown-mode
    csv-mode
    ))

;; Autoinstall
(defun uninstalled-packeges (packages)
  (delq nil
        (mapcar (lambda (p)
                  (if (package-installed-p p nil) nil p))
                packages)))

(let ((need-to-install
       (uninstalled-packeges local-packages)))
  (when need-to-install
    (progn
      (package-refresh-contents)
      (dolist (p need-to-install)
        (package-install p)))))

(provide 'setup-packages)
