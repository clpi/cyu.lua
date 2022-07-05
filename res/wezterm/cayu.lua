-- NOTE: cayu wezterm theem
--
-- @by By chris p 2022
-- @date 07/04/22 20:50 

return {
  colors = {
    color_scheme = "cayu",
    foreground = "#d9d7ce" ,
    background = "#101920" ,

    cursor_fg = "#151a22"
    cursor_bg = "#faa06f"
    cursor_border = "#ffda7f",

    selection_fg = "#171c26",
    selection_bg = "#c0ff90"

    scrollbar_thumb = "#526370"

    split = "#303a4f",

    ansi = ["#171c26","#fa708a","#aaf070","#faa06f","#7fd0da","#cfafff","#8feaef","#c3c0ba"],
    brights = ["#526370","#ffaaaa","#c0ff90","#ffda7f","#bfdfff","#f0caff","#bfFFF0","#d9d7ce"],

    compose_color= "#7fd0da",

    tab_bar = {
      background = "#141a24",
      active_tab = {
        bg_color = "#303a4f",
        fg_color = "#d9d7ce",
        intensity = "Normal"
      },
      inactive_tab = {
        bg_color = "#171c26",
        fg_color = "#8a92aa",
        intensity = "Normal",
      },
      new_tab = {
        bg_color = "#101b22",
        fg_color = "#c0ff90",
        intensity = "Bold",
      },
      new_tab_hover = {
        bg_color = "#4d525a",
        fg_color = "#c0ff90",
        intensity = "Normal",
      }
    }
  }
}
