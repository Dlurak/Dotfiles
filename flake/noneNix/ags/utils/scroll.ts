// Thanks to https://github.com/Sinomor/delta-shell/blob/main/src/lib/utils.ts <3

import { Gdk, Gtk } from "ags/gtk4";

interface ScrollInfo {
   dx: number;
   dy: number;
   shift: boolean;
}

type ScrollHandler = (info: ScrollInfo) => void;

export function attachHoverScroll(box: Gtk.Box, onScroll: ScrollHandler): void {
   let hovered = false;

   const motion = new Gtk.EventControllerMotion();
   motion.connect("enter", () => (hovered = true));
   motion.connect("leave", () => (hovered = false));
   box.add_controller(motion);

   const scrollCtrl = new Gtk.EventControllerScroll({
      flags:
         Gtk.EventControllerScrollFlags.VERTICAL |
         Gtk.EventControllerScrollFlags.DISCRETE,
   });

   scrollCtrl.connect("scroll", (_ctrl, dx, dy) => {
      if (!hovered) return Gdk.EVENT_PROPAGATE;

      const state = _ctrl.get_current_event_state?.() ?? 0;
      const shift = (state & Gdk.ModifierType.SHIFT_MASK) !== 0;

      onScroll({ dx, dy, shift });

      return Gdk.EVENT_STOP;
   });

   scrollCtrl.set_propagation_phase(Gtk.PropagationPhase.BUBBLE);
   box.add_controller(scrollCtrl);
}
