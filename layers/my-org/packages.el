;;; packages.el --- Org Layer packages File for Spacemacs
;;
;; Copyright (c) 2017 Voleking
;;
;; Author: Sylvain Benner <volekingsg@gmail.com>
;; URL: https://github.com/Voleking/spacemacs-configuration
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq my-org-packages '(org-mac-link org-alert))

(defun my-org/init-org-mac-link ()
  (use-package org-mac-link
    :defer t))

(defun my-org/init-org-alert ()
  (use-package org-alert
    :defer t))