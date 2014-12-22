;--------------------------------------------------------------------
;	ARM Examples for testing of syntax highlighting
;	Dan Underwood
;--------------------------------------------------------------------

strings 	defw	"Awaiting input"
		defb    'a', 'b', 'c', 'd'

branches	b	start			;With comment!
                bne     end
                bl      linked_place

                include test.s

stack           defs	512			;stack
stack_end					;end stack

start	        adr	sp, stack_end
                mrs	r0, r1
                bic	r2, r0, #&3F
                mov	r1, sp
                strb	r0, [r1, #stack]
                nop
                stmfd	sp!, {r0-r2, lr}
		movs	r2, r2, lsr #1
		cmp	r0, r2
                addsne	r0, r0, #&1
                bne	start
		ldmfd	sp!, {r0-r2, pc}^

end		svc	0
