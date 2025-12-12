import { monitorFile, readFileAsync } from "ags/file";
import { exec, execAsync } from "ags/process";
import GObject, { register, property, setter, getter } from "ags/gobject";


const screen = exec("bright meta").split("\n")[0].split(" ")[1];

@register({ GTypeName: "Brightness" })
export default class Brightness extends GObject.Object {
  static instance: Brightness;
  static get_default() {
    if (!this.instance) this.instance = new Brightness();

    return this.instance;
  }

  #screenMax = Number(exec("bright meta")
	  .split('\n')
	  .find((line) => line.startsWith("Max brightness: "))!
	  .split(": ")[1]);

  #screen = Number(exec("bright meta")
	  .split('\n')
	  .find((line) => line.startsWith("Current"))!
	  .split(" ")[2]);

  @getter(Number)
  get screen() {
    return this.#screen;
  }

  @setter(Number)
  set screen(val) {
    val = Math.max(val, 1)
    val = Math.min(val, this.#screenMax)
	val = Math.round(val)

    execAsync(`bright set ${val}`)
  }

  @getter(Number)
  get screenMax() {
   return this.#screenMax;
  }

  constructor() {
    super();
    monitorFile(`/sys/class/backlight/${screen}/brightness`, async (f) => {
      const v = await readFileAsync(f);
      this.#screen = Number(v);
      this.notify("screen");
    });
  }
}
