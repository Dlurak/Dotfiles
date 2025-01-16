const pad = (number: number, size = 60) => {
    const desiredDigits = size.toString().length;
    return number.toString().padStart(desiredDigits, '0');
};

type Unit = "second" | "minute" | "hour" | "day";

const maxSizeForUnit = (unit: Unit) => {
    switch (unit) {
        case "second":
        case "minute":
            return 60;
        case "hour":
            return 24;
        case "day":
            return Infinity;
    }
};

const getNextUnit = (unit: Unit): Unit => {
    switch (unit) {
        case "second":
            return "minute";
        case "minute":
            return "hour";
        case "hour":
            return "day";
        case "day":
            throw new Error("Cannot process units larger than days");
    }
};

export const length = (unit: Unit) => (time: number): string => {
    const size = maxSizeForUnit(unit);

    if (time < size) {
		const timeStr =  pad(Math.floor(time), size);
        return unit === "second" ? `00:${timeStr}` : timeStr
    }

    const remaining = Math.floor(time % size);
    const higher = Math.floor(time / size);

    return `${length(getNextUnit(unit))(higher)}:${pad(remaining, size)}`;
};

