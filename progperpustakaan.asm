.model small
.code 
org 100h
jmp mulai
        
        
;VARIABEL
nama	 db 0dh, 0ah, 0dh, 0ah,"Masukkan nama Anda     :",'$'
id 	     db 0dh, 0ah,"Masukkan kartu ID Anda :",'$'
psn1	 db "PROGRAM PERPUSTAKAAN ONLINE SEDERHANA",0dh, 0ah,"-------------------------------------", '$'
psn2	 db 0dh, 0dh, 0dh, 0ah, 0dh, 0ah,"Selamat Datang di Perpustakaan Lingkar Mimpi", '$'
psn3	 DB 0dh, 0ah,"Buku yang tersedia saat ini:",0dh,0ah
	     db "=========================",0dh, 0ah 
	     db "=	1. Buku Dongeng    =",0dh, 0ah
	     db "=	2. Buku Novel      =",0dh, 0ah
	     db "=	3. Buku Pelajaran  =",0dh, 0ah 
	     db "=========================",0dh, 0ah
	     db 0dh, 0ah, 'Buku apa yang ingin kamu baca? $'
psn4	 db 0dh, 0ah, 'Silahkan pilih buku...$'              
psn5	 db 0dh, 0ah, "Terima kasih telah berkunjung di Perustakaan Lingkar Mimpi", '$'
psn6	 db 0dh, 0ah, 0dh,0ah, "Ingin membaca buku lain? (Y/N) ", '$'
eror	 db 0dh, 0ah, "Masukkan kode dengan benar!", '$'    

msg1:    db 0dh, 0ah, 0dh, 0ah, "======= Buku Dongeng ========", 0dh, 0ah
         db "a. Cinderella",0dh, 0ah
         db "b. Putri Salju",0dh, 0ah
         db "c. Bawang Merah Bawang Putih",0dh, 0ah
         db "silahkan pilih: ", '$'
msg2:    db 0dh, 0ah, 0dh, 0ah, "======= Buku Novel ========", 0dh, 0ah
         db "a. Ayat-ayat Cinta",0dh, 0ah
         db "b. Sang Pemimpi",0dh,0ah
         db "c. Bidadari Bermata Bening",0dh,0ah, "silahkan pilih: ", '$'
msg3:    db 0dh, 0ah, 0dh, 0ah, "======= Buku Pelajaran ========", 0dh, 0ah
         db "a. Kalkulus", 0dh, 0ah
         db "b. Bahasa Indonesia", 0dh, 0ah
         db "c. Rumus Matematika", 0dh, 0ah, "silahkan pilih: ",'$' 
dnga     db 0dh, 0ah, 0dh, 0ah, "~~~~~Buku Dongeng Cinderella~~~~~",0dh,0ah
         db 0dh, 0ah, "ini adalah contoh dari isi cerita untuk dongeng Cinderella", '$'
dngb     db 0dh, 0ah, 0dh, 0ah, "~~~~~Buku Dongeng Putri salju~~~~~",0dh,0ah
         db 0dh, 0ah, "ini adalah contoh dari isi cerita untuk dongeng Putri Salju", '$'
dngc     db 0dh, 0ah, 0dh, 0ah, "~~~~~Buku Dongeng Bawang Putih Bawang Merah~~~~~",0dh,0ah
         db 0dh, 0ah, "ini adalah contoh dari isi cerita untuk dongeng Bawang Putih Bawang Merah", '$'      
nvla     db 0dh, 0ah, 0dh, 0ah, "*****Buku Novel Ayat-ayat Cinta*****",0dh, 0ah 
         db 0dh, 0ah, "ini adalah contoh dari isi novel Ayat-ayat Cinta", '$'
nvlb     db 0dh, 0ah, 0dh, 0ah, "*****Buku Novel Sang Pemimpi*****",0dh, 0ah 
         db 0dh, 0ah, "ini adalah contoh dari isi novel Sang Pemimpi", '$'
nvlc     db 0dh, 0ah, 0dh, 0ah, "*****Buku Novel Bidadari Bermata Bening*****",0dh, 0ah 
         db 0dh, 0ah, "ini adalah contoh dari isi novel Bidadari Bermata Bening", '$'
plja     db 0dh, 0ah, 0ah, 0ah, "-----Buku Peajaran Kalkulus-----",0dh,0ah
         db 0dh, 0ah, "ini adalah contoh dari buku pelajaran Kalkulus", '$'
pljb     db 0dh, 0ah, 0ah, 0ah, "-----Buku Peajaran Bahasa Indonesia-----",0dh,0ah
         db 0dh, 0ah, "ini adalah contoh dari buku pelajaran Bahasa Indonesia", '$'
pljc     db 0dh, 0ah, 0ah, 0ah, "-----Buku Rumus Matematika-----",0dh,0ah
         db 0dh, 0ah, "ini adalah contoh dari buku Rumus Matematika", '$'         
         
tampung_nama	DB 30, ?, 30 dup(?)
tampung_id      DB 30, ?, 30 dup(?)
          
          
MULAI: 
lea DX,psn1
mov AH,9           
int 21h
                                                                     
lea DX,nama 
mov AH,9
int 21h 

mov AH,0AH 
lea DX,tampung_nama
int 21h
push DX

lea DX,id 
mov AH,9
int 21h

mov AH,0AH
lea DX,tampung_id
int 21h
push DX 

lea DX,psn2
mov AH,9
int 21h
   
   
MULAI2:
lea DX,psn3
mov AH,9
int 21h
       
       
proses:
mov AH, 01
int 21H

cmp AL, '1'
je buku_1

cmp AL, '2'
je buku_2  

cmp AL, '3'
je buku_3
   
jne psn_eror 

proses2:
lea DX,psn6
mov AH,9
int 21h
mov AH, 01
int 21h

cmp AL, 'Y'
je baca_lagi

cmp al, 'y'
je baca_lagi
                    
cmp AL, 'N'
je baca_selesai

cmp al, 'n'
je baca_selesai

jne psn_eror

dongeng: 
mov ah, 01
int 21h

cmp AL, 'a'
je do_a 

cmp al, 'A'
je do_a

cmp al, 'b'
je do_b  

cmp al, 'B'  
je do_b
 
cmp al, 'c'
je do_c  

cmp al, 'C'
je do_c

jmp psn_eror 

novel:
mov ah, 01
int 21h

cmp AL, 'a'
je nov_a
cmp AL, 'A'
je nov_a

cmp al, 'b'  
je nov_b 

cmp AL, 'B'
je nov_b
 
cmp al, 'c'  
je nov_c 

cmp AL, 'C'
je nov_c

jmp psn_eror

pelajaran:
mov ah, 01
int 21h

cmp al, 'a'
je pel_a 

cmp al, 'A'
je pel_a

cmp al, 'b'
je pel_b 

cmp al, 'B'
je pel_b

cmp al, 'c'
je pel_c

cmp al, 'C'
je pel_c   

jmp psn_eror           
          
buku_1:  
	lea DX,psn4
	mov AH,9
	int 21h
	mov DX,offset msg1 
	mov AH,9
	int 21h  
	jmp dongeng

buku_2:
	lea DX,psn4
	mov AH,9
	int 21h
	mov DX,offset msg2
	mov AH,9
	int 21h 
	jmp novel

buku_3:
	lea DX,psn4
	mov AH,9
	int 21h
	mov DX,offset msg3
	mov AH,9
	int 21h 
	jmp pelajaran

do_a:
    lea dx,dnga
    mov ah,9
    int 21h
    jmp proses2

do_b:
    lea dx,dngb
    mov ah,9
    int 21h
    jmp proses2

do_c:
    lea dx,dngc
    mov ah,9
    int 21h
    jmp proses2

nov_a:
    lea dx,nvla
    mov ah,9
    int 21h
    jmp proses2

nov_b:
    lea dx,nvlb
    mov ah,9
    int 21h
    jmp proses2

nov_c:
    lea dx,nvlc
    mov ah,9
    int 21h
    jmp proses2
    
pel_a:
    lea dx,plja
    mov ah,9
    int 21h
    jmp proses2
    
pel_b:
    lea dx,pljb
    mov ah,9
    int 21h
    jmp proses2
    
pel_c:
    lea dx,pljc
    mov ah,9
    int 21h 
    jmp proses2    
              
baca_lagi:
	jmp MULAI2
               
baca_selesai: 
	lea DX,psn5
	mov AH,9
	int 21h
	int 20h
	jmp exit

psn_eror:
	lea DX,eror
	mov AH,9
	int 21h
	int 20h

jmp EXIT 
EXIT:
RET