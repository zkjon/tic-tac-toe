.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\masm32.lib

.data
    board           db 9 dup(' ')
    current_player  db 'X'
    empty_cell      equ ' '
    player_x        equ 'X'
    player_o        equ 'O'

    win_patterns    dd 0,1,2
                    dd 3,4,5
                    dd 6,7,8
                    dd 0,3,6
                    dd 1,4,7
                    dd 2,5,8
                    dd 0,4,8
                    dd 2,4,6

    consoleOutHandle dd ?
    consoleInHandle  dd ?

    bytesWritten    dd ?
    bytesRead       dd ?
    buffer          db 16 dup(0)

    title_x         db "Tic Tac Toe - Player X's turn",13,10,0
    title_o         db "Tic Tac Toe - Player O's turn",13,10,0

    board_template  db 13,10
                    db " %c | %c | %c      1 | 2 | 3",13,10
                    db "---+---+---    ---+---+---",13,10
                    db " %c | %c | %c      4 | 5 | 6",13,10
                    db "---+---+---    ---+---+---",13,10
                    db " %c | %c | %c      7 | 8 | 9",13,10,13,10,0

    prompt          db "Choose a cell (1-9): ",0
    invalid_input   db "Invalid input. Please enter a number between 1 and 9.",13,10,0
    cell_taken      db "Cell already taken. Please choose another cell.",13,10,0
    win_message_x   db 13,10,"Player X wins! Congratulations!",13,10,0
    win_message_o   db 13,10,"Player O wins! Congratulations!",13,10,0
    draw_message    db 13,10,"It's a draw!",13,10,0

    out_buffer      db 256 dup(0)

.code
start:
    invoke GetStdHandle, STD_OUTPUT_HANDLE
    mov consoleOutHandle, eax

    invoke GetStdHandle, STD_INPUT_HANDLE
    mov consoleInHandle, eax

    ; Clear board
    mov ecx, 9
    mov edi, offset board
    mov al, empty_cell
    rep stosb

game_loop:
    ; Show player title
    cmp current_player, player_x
    je show_x
    invoke WriteConsoleA, consoleOutHandle, addr title_o, sizeof title_o - 1, addr bytesWritten, NULL
    jmp show_board

show_x:
    invoke WriteConsoleA, consoleOutHandle, addr title_x, sizeof title_x - 1, addr bytesWritten, NULL

show_board:
    invoke wsprintf, addr out_buffer, addr board_template, \
        board[0], board[1], board[2], \
        board[3], board[4], board[5], \
        board[6], board[7], board[8]
    invoke WriteConsoleA, consoleOutHandle, addr out_buffer, eax, addr bytesWritten, NULL

get_input:
    invoke WriteConsoleA, consoleOutHandle, addr prompt, sizeof prompt - 1, addr bytesWritten, NULL
    invoke ReadConsoleA, consoleInHandle, addr buffer, sizeof buffer, addr bytesRead, NULL

    xor eax, eax
    mov al, buffer
    cmp al, '1'
    jb invalid
    cmp al, '9'
    ja invalid

    sub al, '1'
    movzx ebx, al
    cmp board[ebx], empty_cell
    jne cell_taken

    mov al, current_player
    mov board[ebx], al

    call check_winner
    cmp eax, 1
    je game_over

    call check_draw
    cmp eax, 1
    je game_over

    cmp current_player, player_x
    je switch_to_o
    mov current_player, player_x
    jmp game_loop

switch_to_o:
    mov current_player, player_o
    jmp game_loop

invalid:
    invoke WriteConsoleA, consoleOutHandle, addr invalid_input, sizeof invalid_input - 1, addr bytesWritten, NULL
    jmp get_input

cell_taken:
    invoke WriteConsoleA, consoleOutHandle, addr cell_taken, sizeof cell_taken - 1, addr bytesWritten, NULL
    jmp get_input

game_over:
    invoke ExitProcess, 0

; ----- check_winner -----
check_winner proc
    mov esi, offset win_patterns
    mov ecx, 8

next_pattern:
    push ecx

    mov eax, [esi]
    mov ebx, [esi+4]
    mov edx, [esi+8]

    mov cl, board[eax]
    cmp cl, empty_cell
    je not_winner

    cmp cl, board[ebx]
    jne not_winner
    cmp cl, board[edx]
    jne not_winner

    invoke wsprintf, addr out_buffer, addr board_template, \
        board[0], board[1], board[2], \
        board[3], board[4], board[5], \
        board[6], board[7], board[8]
    invoke WriteConsoleA, consoleOutHandle, addr out_buffer, eax, addr bytesWritten, NULL

    cmp cl, player_x
    je player_x_wins
    invoke WriteConsoleA, consoleOutHandle, addr win_message_o, sizeof win_message_o - 1, addr bytesWritten, NULL
    mov eax, 1
    ret

player_x_wins:
    invoke WriteConsoleA, consoleOutHandle, addr win_message_x, sizeof win_message_x - 1, addr bytesWritten, NULL
    mov eax, 1
    ret

not_winner:
    add esi, 12
    pop ecx
    dec ecx
    jnz next_pattern

    xor eax, eax
    ret
check_winner endp

; ----- check_draw -----
check_draw proc
    mov ecx, 9
    mov esi, offset board

check_loop:
    cmp byte ptr [esi], empty_cell
    je not_draw
    inc esi
    loop check_loop

    invoke wsprintf, addr out_buffer, addr board_template, \
        board[0], board[1], board[2], \
        board[3], board[4], board[5], \
        board[6], board[7], board[8]
    invoke WriteConsoleA, consoleOutHandle, addr out_buffer, eax, addr bytesWritten, NULL
    invoke WriteConsoleA, consoleOutHandle, addr draw_message, sizeof draw_message - 1, addr bytesWritten, NULL
    mov eax, 1
    ret

not_draw:
    xor eax, eax
    ret
check_draw endp

end start
