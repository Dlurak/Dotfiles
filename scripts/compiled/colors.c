#include <stdio.h>

// ANSI escape codes for 256 colors
#define FG_COLOR "\x1b[38;5;%dm"
#define BG_COLOR "\x1b[48;5;%dm"
#define RESET_COLOR "\x1b[0m"

int main() {
    for (short i = 0; i <= 15; i++) {
        if (i < 10) {
			printf(FG_COLOR "Color  %d" RESET_COLOR "   " BG_COLOR "  Color  %d  " RESET_COLOR "\n", i, i, i, i);
        } else {
			printf(FG_COLOR "Color %d" RESET_COLOR "   " BG_COLOR "  Color %d  " RESET_COLOR "\n", i, i, i, i);
        }
    }

    return 0;
}
