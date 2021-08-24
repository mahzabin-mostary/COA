.model small
.stack 100h
.data
menu db '*****************WELCOME TO G8 HOTEL*********************$'
menu1 db 10,13,'Enter 1 for King Room$'
menu2 db 10,13,'Enter 2 for Queen Room$'
menu3 db 10,13,'Enter 3 for Twin Room$'
menu4 db 10,13,'Enter 4 to display all the details$'
menu5 db 10,13,'Enter 5 to remove data from the record$'
menu6 db 10,13,'Enter 6 to exit$'
msg1 db 'No room to offer$'
msg2 db 'Wrong input!!!$'
msg3 db 'Queen Room$'
msg4 db 'Twin Room$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of room booked=$'
msg9 db 'the total number of King Room Booked=$'
msg10 db 'the total number of Queen Room Booked=$'
msg11 db 'the total number of Twin Room Booked=$'
msg12 db '***Record deleted successfully!!!***$' 
msg13 db 'Are you sure?If yes, then click 1 to continue...$'                                 
msg14 db 10,13,' Total day spend$'

amount dw 0
count dw  '0'
am1 dw ?
am2 dw ?
am3 dw ?


k dw '0'
q db '0'
t db '0'

.code
      main proc
      mov ax,@data    ; Initializiation data segment to code segment
      mov ds,ax



while_:   
             
mov dl,10
mov ah,2                ; Print New Line
int 21h
mov dl,13
mov ah,2
int 21h



lea dx,menu              ; printing msg
mov ah,9
int 21h



lea dx,menu1
mov ah,9                ; printing msg
int 21h




lea dx,menu2
mov ah,9               ; printing msg
int 21h





lea dx,menu3
mov ah,9               ; printing msg
int 21h



lea dx,menu4
mov ah,9                ; printing msg
int 21h




lea dx,menu5
mov ah,9                 ; printing msg
int 21h


lea dx,menu6
mov ah,9
int 21h


mov dl,10
mov ah,2                 ; Print New Line
int 21h
mov dl,13
mov ah,2
int 21h


 
                           ;userinput
mov ah,1
int 21h
mov bl,al 

mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h

 
mov al,bl                   ; compare
cmp al,'1'
je kingg                          
cmp al,'2'
je queenn
cmp al,'3'
je twinn
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_


lea dx,msg2
mov ah,9                ; printing msg
int 21h

mov dl,10
mov ah,2
int 21h
mov dl,13           ; Print New Line
mov ah,2
int 21h

jmp while_

kingg:
call king_cls              ; calling proc


queenn:
call queen_cls                    
                         ; calling proc

twinn:
call twin_cls            ; calling proc


end_:
mov ah,4ch
int 21h

main endp




king_cls proc 
    
    lea dx,msg13
    mov ah,9
    int 21h
cmp count,'8'
jle justification

lea dx,msg1
mov ah,9
int 21h
jmp while_
jmp end_
          
          
justification:

mov dl,10
mov ah,2
int 21h
mov dl,13             ;Print New Line
mov ah,2
int 21h

mov ah,1
int 21h
mov bl,al 

 

cmp bl,'1'
 
je king                                        


mov dl,10
mov ah,2
int 21h
mov dl,13                 ; Print New Line
mov ah,2
int 21h


lea dx,msg2
mov ah,9                 ; printing msg
int 21h

mov dl,10
mov ah,2
int 21h
mov dl,13                ; Print New Line
mov ah,2
int 21h  

jmp while_

king:

lea dx,msg14
mov ah,9                   ; printing msg
int 21h  



mov dl,10
mov ah,2
int 21h                  ; Print New Line
mov dl,13
mov ah,2
int 21h

  



MOV AH,1
INT 21H  
SUB AL,30H
MOV Bl,AL

mov dl,10
mov ah,2
int 21h            ; Print New Line
mov dl,13
mov ah,2
int 21h 




mov ax,200
                   ;SUB ax,30H
MUL bl  

add amount, ax  
mov dx,0            ; remainder is 0
mov bx,10 
mov cx,0  





l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3
inc count
inc k


 



jmp while_
jmp end_

 
queen_cls proc 
    
    lea dx,msg13
    mov ah,9
    int 21h
cmp count,'8'
jle justificationn                              

lea dx,msg1
mov ah,9
int 21h
jmp while_
jmp end_
          
          
justificationn:

mov dl,10
mov ah,2
int 21h            ; Print New Line
mov dl,13
mov ah,2
int 21h

mov ah,1
int 21h
mov bl,al 

 

cmp bl,'1'
 
je queen

mov dl,10
mov ah,2
int 21h                ; Print New Line
mov dl,13
mov ah,2
int 21h


lea dx,msg2
mov ah,9                ; printing msg
int 21h

mov dl,10
mov ah,2
int 21h
mov dl,13                 ; Print New Line
mov ah,2
int 21h  

jmp while_

queen:

lea dx,msg14
mov ah,9
int 21h                   ; printing msg



mov dl,10
mov ah,2
int 21h
mov dl,13                   ; Print New Line
mov ah,2
int 21h

  



MOV AH,1
INT 21H  
SUB AL,30H
MOV Bl,AL

mov dl,10
mov ah,2                   ; Print New Line
int 21h
mov dl,13
mov ah,2
int 21h 




mov ax,180
;SUB ax,30H
MUL bl  

add amount, ax  
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0 
         
         
l02:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l02
   
l03:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l03
inc count
inc q





jmp while_
jmp end_


twin_cls proc 
    
    lea dx,msg13
    mov ah,9
    int 21h
cmp count,'8'
jle justificationnn

lea dx,msg1
mov ah,9
int 21h
jmp while_
jmp end_
          
          
justificationnn:

mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2             ;Print New Line
int 21h

mov ah,1
int 21h
mov bl,al 

 

cmp bl,'1'
 
je twin 


mov dl,10
mov ah,2          ; Print New Line
int 21h
mov dl,13
mov ah,2
int 21h


lea dx,msg2
mov ah,9          ;printing msg
int 21h

mov dl,10
mov ah,2
int 21h             ; Print New Line
mov dl,13
mov ah,2
int 21h  

jmp while_

twin:

lea dx,msg14
mov ah,9
int 21h            ;printing msg



mov dl,10
mov ah,2
int 21h         ; Print New Line
mov dl,13
mov ah,2
int 21h

  



MOV AH,1
INT 21H  
SUB AL,30H
MOV Bl,AL

mov dl,10
mov ah,2          ; Print New Line
int 21h
mov dl,13
mov ah,2
int 21h 




mov ax,150
                 ;SUB ax,30H
MUL bl 

add amount, ax
mov dx,0          ; remainder is 0
mov bx,10 
mov cx,0 



l022:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l022
   
l033:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l033
inc count
inc t




 
jmp while_
jmp end_
 
 
rec proc

lea dx,msg7
mov ah,9
int 21h


                  ; print here the whole amount
mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
      ;  mov ah,0
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h                        ; Print New Line
mov dx,13
mov ah,2
int 21h







lea dx,msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h                 ; Print New Line
mov dx,13
mov ah,2
int 21h


lea dx,msg9
mov ah,9
int 21h

mov dx,k
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13              ; Print New Line
mov ah,2
int 21h



lea dx,msg10
mov ah,9
int 21h


mov dl,q
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13              ; Print New Line
mov ah,2
int 21h



lea dx,msg11
mov ah,9
int 21h

mov dl,t
mov ah,2
int 21h

jmp while_




del proc

mov k,'0'
mov q,'0'
mov t,'0'
mov amount,0
mov count,'0'

mov dx,10
mov ah,2
int 21h
mov dx,13                   ; Print New Line
mov ah,2
int 21h

lea dx,msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h                    ; Print New Line
mov dx,13
mov ah,2
int 21h

jmp while_
jmp end_




          exit:       ; return to dos
     mov ah, 4ch
     int 21h 





end main




