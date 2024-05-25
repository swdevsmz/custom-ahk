#Requires AutoHotkey v2.0

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
;#MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
{
    Return
}

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send "{Blind}{vk07}"
*~RAlt::Send "{Blind}{vk07}"

; 左 Alt 空打ちで IME を OFF
LAlt up::
    {if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return
    }

; 右 Alt 空打ちで IME を ON
RAlt up::
    {if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return
    }

SC03A::Return              ; CapsLock単独キーの無効化
;+SC03A::+SC03A             ; Shift(+) + CapsLock -> IME ON/OFF
;^SC03A::Send "{CapsLock}"  ; Ctrl(^) + CapsLock -> CapsLock
; SC03A & f::Return  ; CapsLock + fの無効化
; SC03A & g::Return  ; CapsLock + gの無効化

; 以下iキーの割り当て。jklも同様に割り当てる
SC03A & i:: {
    if GetKeyState("Shift", "P")
        Send "+{Up}"
    else if GetKeyState("Ctrl", "P")
        Send "^{Up}"
    else
        Send "{Up}"
}
SC03A & j:: {
    ; if GetKeyState("F", "P")
    if GetKeyState("Shift", "P")
        Send "+{Left}"
    else if GetKeyState("Ctrl", "P")
        Send "^{Left}"
    else
        Send "{Left}"
}
SC03A & l:: {
    if GetKeyState("Shift", "P")
        Send "+{Right}"
    else if GetKeyState("Ctrl", "P")
        Send "^{Right}"
    else
        Send "{Right}"
}
SC03A & k:: {
    if GetKeyState("Shift", "P")
        Send "+{Down}"
    else if GetKeyState("Ctrl", "P")
        Send "^{Down}"
    else
        Send "{Down}"
}

SC03A & h::{
    if GetKeyState("Shift", "P")
        Send "+{Home}"
    else if GetKeyState("Ctrl", "P")
        Send "^{Home}"
    else
        Send "{Home}"
}
SC03A & n::{
    if GetKeyState("Shift", "P")
        Send "+{End}"
    else if GetKeyState("Ctrl", "P")
        Send "^{End}"
    else
        Send "{End}"
}
SC03A & u::{
    if GetKeyState("Shift", "P")
        Send "+{PgUp}"
    else if GetKeyState("Ctrl", "P")
        Send "^{PgUp}"
    else
        Send "{PgUp}"
}
SC03A & o::{
    if GetKeyState("Shift", "P")
        Send "+{PgDn}"
    else if GetKeyState("Ctrl", "P")
        Send "^{PgDn}"
    else
        Send "{PgDn}"
}

SC03A & `;::Send "{Ins}"
SC03A & Backspace::Send "{Del}"
SC03A & p::Send "{PrintScreen}"

SC03A & 1::Send "{F1}"
SC03A & 2::Send "{F2}"
SC03A & 3::Send "{F3}"
SC03A & 4::Send "{F4}"
SC03A & 5::Send "{F5}"
SC03A & 6::Send "{F6}"
SC03A & 7::Send "{F7}"
SC03A & 8::Send "{F8}"
SC03A & 9::Send "{F9}"
SC03A & 0::Send "{F10}"
SC03A & -::Send "{F11}"
SC03A & =::Send "{F12}"

; SC03A & Esc::Send "{`}"
; +SC03A & Esc::Send "{^}"