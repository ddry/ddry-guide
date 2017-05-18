###
# Numbering module example
###

# Unbelievable that ddry started here, from refactoring `ordinal` spec

'use strict'

module.exports =
  ordinal: (n) ->
    index = if ~~(n/10%10)-1 then n%10 else 0
    n + ([false, 'st', 'nd', 'rd'][index]||'th')

  range: (from, to) ->
    range = []
    cursor = from
    for i in Array(to - from + 1)
      range.push cursor
      cursor += 1
    range

  query: (limit) ->
    @.range(1, limit).map (number) ->
      "key#{number}=value#{number}"
    .join '&'

  selector: (limit = 1, tag = 'li') ->
    tag + Array(limit).join("+#{tag}")
