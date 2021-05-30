;; macro0.el Macro level

(require 'macroexp)
(require 'gv)

;;;###autoload
(defmacro push-ref (elt place)
  (declare (debug (form gv-place)))
  (let ((xcar `(car ,place)) (xcdr `(cdr ,place)))
    `(if (null ,place)
	 ,(if (symbolp place) `(setq ,place (cons ,elt ,place)))
       (prog1 ,place
	 ,(gv-letplace (_getter setter) xcdr
	    (funcall setter `(cons ,xcar ,xcdr)))
	 ,(macroexp-let2 macroexp-copyable-p v elt
	    (gv-letplace (_getter setter) xcar
	      (funcall setter v)))))))

;;;###autoload
(defmacro pop-ref (place)
  (declare (debug (form gv-place)))
  (let ((xcar `(car ,place)) (xcdr `(cdr ,place)))
    `(car-safe
      (prog1 (copy-sequence ,place)
	(if (null ,xcdr)
	    ,(gv-letplace (getter setter) place
	       (funcall setter `(cdr ,getter)))
	  ,(gv-letplace (_getter setter) xcar
	     (funcall setter `(car ,xcdr)))
	  ,(gv-letplace (getter setter) xcdr
	     (funcall setter `(cdr ,getter))))))))

;;;###autoload
(defmacro for-each-tail (spec &rest body)
  (declare (indent 1) (debug ((symbolp form &optional form) body)))
  (unless (consp spec)
    (signal 'wrong-type-argument `(consp ,spec)))
  (unless (<= 2 (length spec) 3)
    (signal 'wrong-number-of-arguments `(,spec ,(length spec))))
  ;; fix lexical binding
  `(let ((tail ,(nth 1 spec))
	 (,(car spec)))
     (while
	 ;; fix function-object predicate on return
	 ,(if (cdr (cdr spec))
	      `(and (consp tail) (null ,@(cdr (cdr spec))))
	    `(consp tail))
       (setq ,(car spec) (car tail))
       ,@body
       (setq tail (cdr tail)))
     ,@(if (cdr (cdr spec)) (cdr (cdr spec)))))

(provide 'macro0)
;; macro0.el ends
