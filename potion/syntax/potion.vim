if exists("b:current_syntax")
    finish
endif

" add keywords to potionKeyword piecemeal
syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string

syntax match potionComment "\v#.*$"

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

syntax match potionNumber "\v\d+"
syntax match potionNumber "\v\d+\.\d+"

" :help syn-region
syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=potionEscapeChars

syntax match potionEscapeChars "\v\\." contained

" :help group-name
highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNumber Number
highlight link potionString String
highlight link potionEscapeChars Special

let b:current_syntax = "potion"
