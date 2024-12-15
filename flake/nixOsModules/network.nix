{...}: {
  networking.hostName = "homie";
  networking.networkmanager.enable = true;
  # Allow for `http://👻` thx to @elmo@chaos.social
  networking.hosts = {
    "127.0.0.1" = ["xn--9q8h" "localghost"];
  };
}
