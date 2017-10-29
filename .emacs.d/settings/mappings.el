;; ------------------------------
;; Mappings
;; ------------------------------
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env python?" . python-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("templates/.*\\.html?\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("/\.bash/.*\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("/crontab\\.X*[0-9]+\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.bash*" . shell-script-mode))
(add-to-list 'magic-mode-alist '("#!/bin/bash" . shell-script-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))


(provide 'mappings)
