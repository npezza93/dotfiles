(identifier) @variable

; Keywords

[
 "alias"
 "begin"
 "break"
 "class"
 "def"
 "defined?"
 "do"
 "end"
 "ensure"
 "module"
 "next"
 "rescue"
 "retry"
 "return"
 "yield"
 "undef"
 ] @keyword

[
 "and"
 "or"
 "in"
 "not"
] @keyword.operator

[
 "case"
 "else"
 "elsif"
 "if"
 "unless"
 "when"
 ] @conditional

[
 "for"
 "until"
 "while"
 ] @repeat

(constant) @type

((identifier) @keyword
 (#vim-match? @keyword "^(private|protected|public)$"))

; Function calls

(call
   method: [
            (identifier)
            (constant)
            ] @function
   )

((identifier) @keyword
 (#any-of? @keyword
  "fail" "raise" "require" "require_relative" "load" "using" "define_method"
  "define_singleton_method" "remove_method" "undef_method" "class_eval"
  "instance_eval" "module_eval" "block_given\?" "iterator\?" "alias_method"
  "loop" "then"))

((identifier) @include (#vim-match? @include "^(include|extend|prepend)$"))
((identifier) @include (#vim-match? @include "^(attr_reader|attr_writer|attr_accessor)$"))

((identifier) @RubyModelMacro (#any-of? @keyword "belongs_to" "has_many" "has_one" "accepts_nested_attributes_for" "attr_readonly" "attribute" "enum" "serialize" "store" "store_accessor" "default_scope" "scope" "has_rich_text" "has_secure_password" "has_secure_token" "has_one_attached" "has_many_attached" "delegated_type" "with_options" "delegate" "delegate_missing_to"))

((identifier) @RubyModelCallback (#any-of? @keyword "before_validation" "after_validation" "before_create" "before_destroy" "before_save" "before_update" "after_create" "after_destroy" "after_save" "after_update" "around_create" "around_destroy" "around_save" "around_update" "after_commit" "after_create_commit" "after_update_commit" "after_save_commit" "after_destroy_commit" "after_rollback" "after_find" "after_initialize" "after_touch"))

((identifier) @RubyModelValidations (#any-of? @keyword "validates" "validates_acceptance_of" "validates_associated" "validates_confirmation_of" "validates_each" "validates_exclusion_of" "validates_format_of" "validates_inclusion_of" "validates_length_of" "validates_numericality_of" "validates_presence_of" "validates_absence_of" "validates_size_of" "validates_with" "validates_associated" "validates_uniqueness_of" "validate"))

; Function definitions

(alias (identifier) @function)
(setter (identifier) @function)

(method name: [
               (identifier) @function
               (constant) @type
               ])

(singleton_method name: [
                         (identifier) @function
                         (constant) @type
                         ])

(class name: (constant) @type)
(module name: (constant) @type)
(superclass (constant) @type)

; Identifiers
[
 (class_variable)
 (instance_variable)
 ] @label

((identifier) @variable.builtin
 (#vim-match? @variable.builtin "^__(callee|dir|id|method|send|ENCODING|FILE|LINE)__$"))

((constant) @type
 (#vim-match? @type "^[A-Z\\d_]+$"))

[
 (self)
 (super)
 (global_variable)
 ] @variable.builtin

(method_parameters (identifier) @parameter)
(lambda_parameters (identifier) @parameter)
(block_parameters (identifier) @variable.builtin)
(splat_parameter (identifier) @parameter)
(hash_splat_parameter (identifier) @parameter)
(optional_parameter (identifier) @parameter)
(destructured_parameter (identifier) @parameter)
(block_parameter (identifier) @parameter)
(keyword_parameter (identifier) @symbol)

; TODO: Re-enable this once it is supported
; ((identifier) @function
;  (#is-not? local))

; Literals

[
 (string)
 (bare_string)
 (subshell)
 (heredoc_body)
 (heredoc_beginning)
 (heredoc_end)
 ] @string

[
 (bare_symbol)
 (simple_symbol)
 (delimited_symbol)
 (hash_key_symbol)
 ] @symbol

(pair key: (hash_key_symbol) ":" @symbol)
(regex) @string.regex
(escape_sequence) @string.escape
(integer) @number
(float) @float

[
 (nil)
 (true)
 (false)
 ] @boolean

(comment) @comment

; Operators

[
 "="
 "=>"
 "->"
 "+"
 "-"
 "*"
 "/"
 "||"
 "&&"
 "||="
 "!="
 "=="
 ">"
 "<"
 "<="
 ">="
 "+="
 "-="
 "*="
 "/="
 "<<="
 "%="
 "&="
 "&&="
 "|="
 "**="
 "**"
 "^="
 "<=>"
 "==="
 "=~"
 "!~"
 "!"
 "^"
 "&"
 "%"
 "<<"
 ] @operator

[
 ","
 ";"
 "."
 ] @punctuation.delimiter

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
 ] @punctuation.bracket

(string_array) @string
(string_array ")" @string)
(symbol_array) @symbol
(symbol_array ")" @symbol)

(ERROR) @error

(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special) @none
