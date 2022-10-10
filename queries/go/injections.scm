(call_expression
  (selector_expression
    operand: (identifier) @operand 
    field: (field_identifier) @field (#eq? @field "Exec"))
  (argument_list
    (raw_string_literal) @sql
)
) 
