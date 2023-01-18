;; init-projectile.el --- Initialize Projectile configurations. -*- lexical-binding: t -*

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
;; Projectile configuration.
;; See the detailed user manual at:
;; https://docs.projectile.mx/projectile/index.html
;;

;;; Code:

(use-package projectile
  :diminish

  :demand t

  :config
  (use-package ag)

  (projectile-mode +1)

  ;; Setup project types.
  ;; (!) Normally projectile always asks for confirmation of
  ;; each project command as a security measure.
  ;; To disable this behaviour set
  ;; (setq compilation-read-command nil)
  (projectile-register-project-type 'go '("go.mod" "go.sum")
   :project-file "go.mod"
   :test-suffix "_test.go")
  (projectile-register-project-type 'npm '("package.json")
   :project-file "package.json"
   :compile "npm install"
   :test "npm test"
   :run "npm start"
   :test-suffix ".spec")

  :bind-keymap
  ("C-x p" . projectile-command-map)

  :custom
  (projectile-auto-discover nil)
  (projectile-completion-system 'ivy)
  (projectile-enable-caching nil)
  (projectile-indexing-method 'alien))

(provide 'init-projectile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-projectile.el ends here
