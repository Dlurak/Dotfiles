import { Astal, Gdk } from "astal/gtk3";

// From hyprpanel <3

/**
 * Checks if an event is a primary click.
 *
 * This function determines if the provided event is a primary click based on the button property.
 *
 * @param event The click event to check.
 *
 * @returns True if the event is a primary click, false otherwise.
 */
export const isPrimaryClick = (event: Astal.ClickEvent): boolean => event.button === Gdk.BUTTON_PRIMARY;

/**
 * Checks if an event is a secondary click.
 *
 * This function determines if the provided event is a secondary click based on the button property.
 *
 * @param event The click event to check.
 *
 * @returns True if the event is a secondary click, false otherwise.
 */
export const isSecondaryClick = (event: Astal.ClickEvent): boolean => event.button === Gdk.BUTTON_SECONDARY;
