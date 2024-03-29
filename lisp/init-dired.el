;; init-dired.el --- Initialize file manager configurations. -*- lexical-binding: t -*

;; Copyright (c) 2021-2023 Alexander Kurbatov
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
;; File manager configuration.
;;

;;; Code:
(require 'init-consts)
(require 'init-custom)

(use-package dirvish
  :config
  (dirvish-override-dired-mode)

  (setq dirvish-attributes '(dirvish-side dirvish-subtree-toggle))
  (when (display-graphic-p)
    (add-to-list 'dirvish-attributes 'subtree-state)
    (add-to-list 'dirvish-attributes 'file-size))

  (setq dirvish-preview-dispatchers '(archive no-media))

  (when sys/macp
    ;; On OS X use GNU version of ls with --dired option support
    ;; to properly work with dired.
    (setq
     dired-use-ls-dired t
     insert-directory-program (concat alk/brew-path "/opt/coreutils/libexec/gnubin/ls")
     dired-listing-switches "--group-directories-first -Alh")

    (dirvish-define-preview
     exa (file) "Use `exa' to generate directory preview."
     :require ("exa") ; tell Dirvish to check if we have the executable
     (when
         (file-directory-p file) ; we only interest in directories here
       `(shell
         .
         ("exa"
          "-algh"
          "--color=always"
          "--icons"
          "--git",
          "--group-directories-first",
          file))))

    (add-to-list 'dirvish-preview-dispatchers 'exa))

  ;; Tweak files and folders deletion.
  (setq
   delete-by-moving-to-trash t
   dired-recursive-deletes 'always)

  :bind
  (("C-x d" . dirvish)
   ([f10] . dirvish-side)
   :map dirvish-mode-map
   ("TAB" . dirvish-subtree-toggle)))

(provide 'init-dired)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dired.el ends here
