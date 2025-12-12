{pkgs}: {
  input = {
    kb_layout = "de";
    kb_options = "caps:escape";
    kb_variant = "nodeadkeys";
    #kb_variant = "colemark";
    kb_model = "";
    kb_rules = "";
    follow_mouse = 1;
    sensitivity = 0;
    touchpad.natural_scroll = false;
  };
  gesture = [
	"3, horizontal, workspace"
	"3, up, scale: 1.5, fullscreen"
	"3, down, scale: 1.5, dispatcher, exec, ${pkgs.nwg-drawer}/bin/nwg-drawer"
	"4, down, close"
  ];
  gestures = {
    workspace_swipe_cancel_ratio = 0.25;
    workspace_swipe_distance = 100;
  };
}
