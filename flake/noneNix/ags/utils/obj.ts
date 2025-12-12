export const keys = <T extends object>(obj: T): Array<Extract<keyof T, string>> =>
  Object.keys(obj) as Array<Extract<keyof T, string>>;

