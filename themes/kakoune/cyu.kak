# cyu theme

evaluate-commands %sh{
    red=rgb:fa9aca
    light_red=rgb:ff9a9f
    dark_red=rgb:f07a6f
    green=rgb:d5ff80
    yellow=rgb:ffca6f
    dark_yellow=rgb:ffa66f
    blue=rgb:9abff0
    purple=rgb:b0a0f0
    cyan=rgb:7fd0da
    white=rgb:d9d7ce
    black=rgb:171c26
    comment_grey=rgb:526370
    gutter_fg_grey=rgb:343f4c
    cursor_grey=rgb:242b39
    visual_grey=rgb:302e50
    menu_grey=rgb:4d4751
    special_grey=rgb:404e6a
    vertsplit=rgb:181a1f
    visual_black=default

    printf "%s\n" "
    # Code
    face global value         $dark_yellow
    face global type          $yellow
    face global function      $blue
    face global variable      $blue
    face global identifier    $blue
    face global string        $green
    face global error         rgb:c3bf9f+b
    face global keyword       $purple
    face global operator      $cyan
    face global attribute     rgb:eedc82
    face global comment       $comment_grey+i
    face global documentation comment

    # #include <...>
    face global meta       $yellow

    # Markup
    face global title  $blue
    face global header $cyan
    face global mono   $green
    face global block  $purple
    face global link   $cyan
    face global bullet $cyan
    face global list   $yellow

    # Builtin
    face global Default            $white,$black

    face global PrimarySelection   $black,$white+bfg
    face global SecondarySelection $black,$white+fg

    face global PrimaryCursor      white,$purple+bfg
    face global SecondaryCursor    $black,$purple+fg

    face global PrimaryCursorEol   $black,$green+fg
    face global SecondaryCursorEol $black,$green+fg

    face global LineNumbers        $gutter_fg_grey
    face global LineNumberCursor   $yellow,default+b

    # Bottom menu:
    # text + background
    face global MenuBackground     $black,$white
    face global MenuForeground     $black,$purple

    # completion menu info
    face global MenuInfo           $menu_grey,default+i

    # assistant, [+]
    face global Information        $white,$visual_grey

    face global Error              $white,$red
    face global DiagnosticError    $red
    face global DiagnosticWarning  $yellow
    face global StatusLine         $white,$black

    # Status line
    face global StatusLineMode     $black,$purple      # insert, prompt, enter key ...
    face global StatusLineInfo     $white,$visual_grey # 1 sel
    face global StatusLineValue    $visual_grey,$green # param=value, reg=value. ex: \"ey
    face global StatusCursor       white,$purple+bg

    face global Prompt             $purple,$black # :
    face global MatchingChar       $red+b         # (), {}
    face global BufferPadding      $gutter_fg_grey,$black   # EOF tildas (~)

    # Whitespace characters
    face global Whitespace         $gutter_fg_grey,$black+fg
    "
}
