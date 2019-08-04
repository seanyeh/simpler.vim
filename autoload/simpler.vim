function! simpler#simpler()
    " Ignore if user specifies a register
    if index(['', '*'], v:event.regname) == -1
        return
    endif

    " If yank, push to register stack
    if v:event.operator == 'y'
        call simpler#reg_push(@*)
        return
    endif

    " If insignificant, don't add to register
    if len(@*) <= 1
        let @* = simpler#reg_pop()
    endif
endfunction

function simpler#reg_push(item)
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

function simpler#reg_pop()
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
