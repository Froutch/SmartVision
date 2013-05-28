.text
        .globl addll
        .globl subll
        .globl addllx
        .globl subllx
        .globl shiftl
        .globl shiftlr
        .globl bfffo
        .globl mulll
        .globl addmul
        .globl divll
        .globl overflow
        .globl hiremainder
.comm overflow,4,4
.comm hiremainder,4,4



.text

 .align 8
addll:
        xorl %edx,%edx
        movl 4(%esp),%eax
        addl 8(%esp),%eax
        adcl %edx,%edx
        movl %edx,overflow
 ret


 .align 8
addllx:
        xorl %edx,%edx
        xorl %eax,%eax
        subl overflow,%eax
        movl 4(%esp),%eax
        adcl 8(%esp),%eax
        adcl %edx,%edx
        movl %edx,overflow
 ret


 .align 8
subll:
        xorl %edx,%edx
        movl 4(%esp),%eax
        subl 8(%esp),%eax
        adcl %edx,%edx
        movl %edx,overflow
 ret


 .align 8
subllx:
        xorl %edx,%edx
        xorl %eax,%eax
        subl overflow,%eax
        movl 4(%esp),%eax
        sbbl 8(%esp),%eax
        adcl %edx,%edx
        movl %edx,overflow
 ret


 .align 8
shiftl:
        movl 4(%esp),%eax
        movb 8(%esp),%cl
        xorl %edx,%edx
        shldl %eax,%edx

        shll %cl,%eax
        movl %edx,hiremainder
 ret


 .align 8
shiftlr:
        movl 4(%esp),%eax
        movb 8(%esp),%cl
        xorl %edx,%edx
        shrdl %eax,%edx

        shrl %cl,%eax
        movl %edx,hiremainder
 ret


 .align 8
bfffo:
        movl 4(%esp),%eax
        bsrl %eax,%edx
        movl $31,%eax
        subl %edx,%eax
        ret


 .align 8
mulll:
        movl 4(%esp),%eax
        mull 8(%esp)
        movl %edx,hiremainder
        ret


 .align 8
addmul:
        xorl %ecx,%ecx
        movl 4(%esp),%eax
        mull 8(%esp)
        addl hiremainder,%eax
        adcl %ecx,%edx
        movl %edx,hiremainder
        ret


        .align 8
divll:
        movl 4(%esp),%eax
        movl hiremainder,%edx
        divl 8(%esp)
        movl %edx,hiremainder
        ret


 .align 8
