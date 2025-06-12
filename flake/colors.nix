{
  hypr = {
    rosewater = "rgb(9d7cd8)";
    pink = "rgb(bb9af7)";
    red = "rgb(f7768e)";
    blue = "rgb(7aa2f7)";
    text = "rgb(c0caf5)";
    surface0 = "rgb(414868)";
    base = "rgb(1a1b26)";
    crust = "rgb(16161e)";
  };
  hex = {
    rosewater = "#9d7cd8";
    pink = "#bb9af7";
    red = "#f7768e";
    blue = "#7aa2f7";
    text = "#c0caf5";
    surface0 = "#414868";
    base = "#1a1b26";
    crust = "#16161e";
  };
  rgba = {
    rosewater = "rgba(157,124,216,1)";
    pink = "rgba(187,154,247,1)";
    red = "rgba(247,118,142,1)";
    blue = "rgba(122,162,247,1)";
    text = "rgba(192,202,245,1)";
    surface0 = "rgba(65,72,104,1)";
    base = "rgba(26,27,38,1)";
    crust = "rgba(22,22,30,1)";
  };
  setRgbaOpacity =
    newOpacity: color: builtins.replaceStrings [ ",1)" ] [ ",${toString newOpacity})" ] color;
}
