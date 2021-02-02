(identifier) @variable
(string_literal) @string
(number_literal) @number
(boolean_literal) @boolean
(comment) @comment

[
  (intrinsic_type)
  ; (primitive_type_qualifier)
  "dimension"
  "intent"
  "in"
  "out"
  "inout"
  "type"
  "endtype"
  "attributes"
  "global"
  "device"
  "host"
  "grid_global"
  "pointer"
] @type

[
  "bind"
  "call"
  "class"
  "contains"
  "continue"
  "cycle"
  "endfunction"
  "endmodule"
  "endprogram"
  "endsubroutine"
  "enumerator"
  "equivalence"
  "exit"
  "format"
  "function"
  "goto"
  "include"
  "interface"
  "module"
  "only"
  "parameter"
  "print"
  "procedure"
  "program"
  "read"
  "return"
  "stop"
  "subroutine"
  "use"
  "write"
  "implicit"
  (none)
  (default)
  (procedure_qualifier)
  (private_statement)
  (public_statement)
] @keyword

[
  "if"
  "then"
  "else"
  "elseif"
  "endif"
] @conditional

[
  "do"
  "enddo"
  "while"
  "forall"
] @repeat

[
  "<"
  ">"
  "<="
  ">="
  "=="
  "/="
] @keyword.operator

; Brackets
[
 "("
 ")"
 "["
 "]"
] @punctuation.bracket

; import
; abstract (e.g. abstract interface ... end interface)
; extends
; keywords inside of variable names are highlighted (e.g. total hightlights TO)
