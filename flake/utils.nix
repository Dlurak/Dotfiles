{lib}: {
  entries = attrs:
    builtins.map (key: {
      key = key;
      value = attrs.${key};
    }) (builtins.attrNames attrs);

  transformAttrs = attrs: keyTransform: valueTransform:
    builtins.listToAttrs (
      map (key: let
        entry = {
          key = key;
          value = attrs.${key};
        };
      in {
        name = keyTransform entry;
        value = valueTransform entry;
      }) (builtins.attrNames attrs)
    );

  indent = text:
    lib.concatStringsSep
    "\n"
    (builtins.map (x: "   ${x}") (lib.splitString "\n" text));
}
