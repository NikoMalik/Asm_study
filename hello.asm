global    _start

section   .text

;  RAX:
;    - It is a general purpose register in x86-64 architecture.
;    - It is used to store the result of operations such as arithmetic and logical calculations.
;    - It is often used to return a value from functions.

; 2. RDI:
;    - This too is a general purpose register that is usually used to pass arguments to functions.
;    - In x86-64, RDI corresponds to the first argument in function calls. For example, if a function takes one parameter, its value will be in RDI.

; 3. XOR:
;    - This is a logical “exclusive OR” operation.
;    - In assembly language context, it is often used to zero registers and perform arithmetic operations.
;    - For example, XOR RAX, RAX will reset the RAX register to zero. This is the preferred method for zeroing registers because it is less resource intensive compared to using the MOV instruction.




_start:   
          mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, message            ; address of string to output
          mov       rdx, 13                 ; number of bytes
          syscall                           ; invoke operating system to do the write
          mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

          section   .data
message:  db        "Hello, World", 10      ; note the newline at the end


;nasm -felf64 hello.asm && ld hello.o && ./a.out
; for help commands use nasm -h