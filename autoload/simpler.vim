function! simpler#simpler()
    let reg_info = s:get_default_register()
    let reg_val = @"

    " Ignore if user specifies a register
    if index(['', reg_info.name], v:event.regname) == -1
        return
    endif

    " If yank, push to register stack
    if v:event.operator ==# 'y'
        call s:reg_push(reg_val)
        return
    endif

    " If insignificant, don't add to register
    if len(reg_val) <= 1
        call s:set_default_register(s:reg_pop())
    endif
endfunction

function s:reg_push(item)
    let @9 = @8
    let @8 = @7
    let @7 = @6
    let @6 = @5
    let @5 = @4
    let @4 = @3
    let @3 = @2
    let @2 = @1
    let @1 = a:item
endfunction

function s:reg_pop()
    let @1 = @2
    let @2 = @3
    let @3 = @4
    let @4 = @5
    let @5 = @6
    let @6 = @7
    let @7 = @8
    let @8 = @9
    return @1
endfunction

function! s:get_default_register()
    if &clipboard =~# 'unnamedplus'
        return {'name': '+', 'value': @+}
    elseif &clipboard =~# 'unnamed'
        return {'name': '*', 'value': @*}
    else
        return {'name': '', 'value': @"}
    endif
endfunction!

function! s:set_default_register(item)
    if &clipboard =~# 'unnamedplus'
        let @+ = a:item
    elseif &clipboard =~# 'unnamed'
        let @* = a:item
    else
        let @" = a:item
    endif
endfunction!
