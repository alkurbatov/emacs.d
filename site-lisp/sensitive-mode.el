;; sensitive-mode.el --- disable backups when editing sensitive data  -*- lexical-binding: t; -*-

;; Copyright (C) 2005 Anirudh Sasikumar

;; Borrowed from:
;; https://anirudhsasikumar.net/blog/2005.01.21.html
;;
;; Patched by Alexander Kurbatov <sandro.kurbatov@gmail.com>

;;; Code:
(define-minor-mode sensitive-mode
  "For sensitive files like password lists.
It disables backup creation and auto saving.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode."

  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Sensitive"
  ;; The minor mode bindings.
  :keymap
  nil

  (if (symbol-value sensitive-mode)
      (progn
        ;; disable backups
        (set (make-local-variable 'backup-inhibited) t)
        ;; disable auto-save
        (if auto-save-default
            (auto-save-mode -1)))
    ;resort to default value of backup-inhibited
    (kill-local-variable 'backup-inhibited)
    ;resort to default auto save setting
    (if auto-save-default
        (auto-save-mode 1))))

(provide 'sensitive-mode)
;;; sensitive-mode.el ends here
