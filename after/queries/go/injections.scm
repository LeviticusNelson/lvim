; extends
(call_expression
  (selector_expression
    operand: (identifier) @_operand 
    field: (field_identifier) @_field (#eq? @_field "Exec"))
  (argument_list
    (raw_string_literal) @sql
    (#offset! @sql 1 0 -1 0)) 
) 
