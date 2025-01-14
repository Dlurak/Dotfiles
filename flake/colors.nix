{
  hypr = {
    rosewater = "rgb(f2d5cf)";
    flamingo = "rgb(eebebe)";
    pink = "rgb(f4b8e4)";
    mauve = "rgb(ca9ee6)";
    red = "rgb(e78284)";
    maroon = "rgb(ea999c)";
    peach = "rgb(ef9f76)";
    yellow = "rgb(e5c890)";
    green = "rgb(a6d189)";
    teal = "rgb(81c8be)";
    sky = "rgb(99d1db)";
    sapphire = "rgb(85c1dc)";
    blue = "rgb(8caaee)";
    lavender = "rgb(babbf1)";
    text = "rgb(c6d0f5)";
    subtext1 = "rgb(b5bfe2)";
    subtext0 = "rgb(a5adce)";
    overlay2 = "rgb(949cbb)";
    overlay1 = "rgb(838ba7)";
    overlay0 = "rgb(737994)";
    surface2 = "rgb(626880)";
    surface1 = "rgb(51576d)";
    surface0 = "rgb(414559)";
    base = "rgb(303446)";
    mantle = "rgb(292c3c)";
    crust = "rgb(232634)";
  };
  hex = {
    rosewater = "#f2d5cf";
    flamingo = "#eebebe";
    pink = "#f4b8e4";
    mauve = "#ca9ee6";
    red = "#e78284";
    maroon = "#ea999c";
    peach = "#ef9f76";
    yellow = "#e5c890";
    green = "#a6d189";
    teal = "#81c8be";
    sky = "#99d1db";
    sapphire = "#85c1dc";
    blue = "#8caaee";
    lavender = "#babbf1";
    text = "#c6d0f5";
    subtext1 = "#b5bfe2";
    subtext0 = "#a5adce";
    overlay2 = "#949cbb";
    overlay1 = "#838ba7";
    overlay0 = "#737994";
    surface2 = "#626880";
    surface1 = "#51576d";
    surface0 = "#414559";
    base = "#303446";
    mantle = "#292c3c";
    crust = "#232634";
  };
  rgba = {
    rosewater = "rgba(242,213,207,1)";
    flamingo = "rgba(238,190,190,1)";
    pink = "rgba(244,184,228,1)";
    mauve = "rgba(202,158,230,1)";
    red = "rgba(231,130,132,1)";
    maroon = "rgba(234,153,156,1)";
    peach = "rgba(239,159,118,1)";
    yellow = "rgba(229,200,144,1)";
    green = "rgba(166,209,137,1)";
    teal = "rgba(129,200,190,1)";
    sky = "rgba(153,209,219,1)";
    sapphire = "rgba(133,193,220,1)";
    blue = "rgba(140,170,238,1)";
    lavender = "rgba(186,187,241,1)";
    text = "rgba(198,208,245,1)";
    subtext1 = "rgba(181,191,226,1)";
    subtext0 = "rgba(165,173,206,1)";
    overlay2 = "rgba(148,156,187,1)";
    overlay1 = "rgba(131,139,167,1)";
    overlay0 = "rgba(115,121,148,1)";
    surface2 = "rgba(98,104,128,1)";
    surface1 = "rgba(81,87,109,1)";
    surface0 = "rgba(65,69,89,1)";
    base = "rgba(48,52,70,1)";
    mantle = "rgba(41,44,60,1)";
    crust = "rgba(35,38,52,1)";
  };
  setRgbaOpacity = newOpacity: color: builtins.replaceStrings [ ",1)" ] [ ",${toString newOpacity})" ] color;
}
