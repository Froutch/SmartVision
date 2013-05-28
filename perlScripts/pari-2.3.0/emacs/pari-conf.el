;; $Id: pari-conf.el.in,v 1.2 2003/11/20 18:49:46 kb Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'pari-conf)
;; Set the following constants for your site:
(defconst gp-version "2.3.0" "pari's version number")

(defconst gp-file-name "/usr/local/bin/gp"
 "The file name of the gp executable file")

(defconst gp-gphelp-dir "/usr/local/bin/"
  "The directory where gphelp is to be found")

(defconst gp-pariemacs "@emacsdir/pariemacs.txt"
  "The pariemacs file")
