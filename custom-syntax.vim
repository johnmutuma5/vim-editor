fun! s:SetCustomJavaScriptSyntaxHighlights()
  syn match jsDot /\v\./ 
  syntax match jsNot /\v!/
  syntax match jsEllipsis /\v\.\.\./
  syntax keyword javaScriptArrayMethods     map, filter, reduce, forEach, join, sort, push, reduceRight, pop, find, concat, reverse, shift, slice, toString, includes, keys, splice

  highlight link jsNot SpecialChar
  highlight link jsDot SpecialChar
  highlight link javaScriptArrayMethods Keyword
  highlight link jsEllipsis SpecialChar
endfun

augroup javascript_custom_syntax_highlights 
  :autocmd!
  :autocmd FileType javascript*,typescript :call <SID>SetCustomJavaScriptSyntaxHighlights()
augroup END


