import { clamp } from "../utils.js";

class BrightnessService extends Service {
  static {
    Service.register(
      this,
      { "screen-changed": ["float"] },
      { "screen-value": ["float", "rw"] },
    );
  }

  #interface = Utils.exec("sh -c 'ls -w1 /sys/class/backlight | head -1'");
  #screenValue = 0;
  #max = Number(Utils.exec("brightnessctl max"));

  get screen_value() {
    return this.#screenValue;
  }

  set screen_value(percent) {
    Utils.execAsync(`brightnessctl set ${clamp(0, percent, 1) * 100}% -q`);
  }

  constructor() {
    super();

    const brightness = `/sys/class/backlight/${this.#interface}/brightness`;
    Utils.monitorFile(brightness, () => this.#onChange());

    // initialize
    this.#onChange();
  }

  #onChange() {
    this.#screenValue = Number(Utils.exec("brightnessctl get")) / this.#max;

    // signals have to be explicitly emitted
    this.emit("changed"); // emits "changed"
    this.notify("screen-value"); // emits "notify::screen-value"

    this.emit("screen-changed", this.#screenValue);
  }

  connect(event = "screen-changed", callback) {
    return super.connect(event, callback);
  }
}

const service = new BrightnessService();

export default service;
