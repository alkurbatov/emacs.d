;; init-backups.el --- Initialize backup settings. -*- lexical-binding: t -*

;; Copyright (c) 2023 Alexander Kurbatov
;;
;; Author: Alexander.Kurbatov <sandro.kurbatov@gmail.com>
;; URL: https://github.com/alkurbatov/emacs.d
;;
;; This file is not part of GNU Emacs.
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
;;

;;; Commentary:
;;
;; Setup backups.
;;

;;; Code:
(require 'sensitive-mode)

;; Move backups to dedicated directory under ~/.emacs.d.
(setq backup-directory-alist
      (list
       (cons "." (no-littering-expand-var-file-name "backups/"))))

;; Move auto-saves to dedicated directory under ~/.emacs.d.
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; Exclude sensitive data from backups
(add-to-list 'auto-mode-alist '("\\.gpg$" . sensitive-mode))
(add-to-list 'auto-mode-alist '("\\.netrc$" . sensitive-mode))

;; Tweak backup settings.
(setq
 make-backup-files t ; backup of a file the first time it is saved.
 backup-by-copying t ; don't clobber symlinks
 vc-make-backup-files t ; backup version controlled files too as we don't commit on every save
 version-control t ; version numbers for backup files
 delete-old-versions t ; delete excess backup files silently
 kept-old-versions 6 ; oldest versions to keep when a new numbered backup is made (default: 2)
 kept-new-versions 9 ; newest versions to keep when a new numbered backup is made (default: 2)
 auto-save-default t ; auto-save every buffer that visits a file
 auto-save-timeout 20 ; number of seconds idle time before auto-save (default: 30)
 auto-save-interval 200 ; number of keystrokes between auto-saves (default: 300)
 )

(provide 'init-backups)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-backups.el ends here
