;;; lispy-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (lispy-mode) "lispy" "lispy.el" (22203 8912 218770
;;;;;;  828000))
;;; Generated autoloads from lispy.el

(autoload 'lispy-mode "lispy" "\
Minor mode for navigating and editing LISP dialects.

When `lispy-mode' is on, most unprefixed keys,
i.e. [a-zA-Z+-./<>], conditionally call commands instead of
self-inserting. The condition (called special further on) is one
of:

- the point is before \"(\"
- the point is after \")\"
- the region is active

For instance, when special, \"j\" moves down one sexp, otherwise
it inserts itself.

When special, [0-9] call `digit-argument'.

When `lispy-mode' is on, \"[\" and \"]\" move forward and
backward through lists, which is useful to move into special.

\\{lispy-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("elpa.el" "le-clojure.el" "le-lisp.el"
;;;;;;  "le-scheme.el" "lispy-inline.el" "lispy-pkg.el" "lispy-tags.el")
;;;;;;  (22203 8912 390775 475000))

;;;***

(provide 'lispy-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lispy-autoloads.el ends here
