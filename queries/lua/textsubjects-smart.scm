((comment) @_start @_end
     (#make-range! "range" @_start @_end))

; TODO This query doesn't work for comment groups at the start and end of a
; file
; See https://github.com/tree-sitter/tree-sitter/issues/1138
(((_) @head . (comment) @_start . (comment)+ @_end (_) @tail)
    (#not-has-type? @tail "comment")
    (#not-has-type? @head "comment")
    (#make-range! "range" @_start @_end))

(([
    (function_call)
    (function_definition)
    (local_function)
    (function)
    (do_statement)
    (repeat_statement)
    (while_statement)
    (for_in_statement)
    (for_statement)
    (if_statement)
] @_start @_end)
(#make-range! "range" @_start @_end))

((parameters (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((arguments (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((table (_) @_start @_end . ["," ";"]? @_end)
    (#make-range! "range" @_start @_end))

((return_statement (_) @_start @_end)
    (#make-range! "range" @_start @_end))
