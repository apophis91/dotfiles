;; ------------------------------
;; Python
;; ------------------------------
;; jedi
(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(defvar jedi-config:with-virtualenv nil
  "Set to non-nil point to a particular virtualenv.")

;; Var to help find the project root
(defvar jedi-config:vcs-root-sentinel ".git")
(defvar jedi-confi:python-module-sentinel "__init__.py")

;; Func to find project root given a buffer
(defun get-project-root (buf repo-type init-file)
  (vc-find-root (expand-file-name (buffer-file-name buf)) repo-type))

(defvar jedi-config:find-root-function 'get-project-root)

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))
(setq python-shell-interpreter "python3")

;; call on init
(defun current-buffer-project-root ()
  (funcall jedi-config:find-root-function
           (current-buffer)
           jedi-config:vcs-root-sentinel
           jedi-confi:python-module-sentinel))

(provide 'python-setup)
