#include <stdbool.h>
#include "pico/stdlib.h"
#define DISPLAY_WIDTH  128
#define DISPLAY_HEIGHT  32
#define BUTTON_COUNT 8

const int BUTTONS[BUTTON_COUNT] = { 2, 3, 4, 5, 6, 7, 8, 9 }; // TEMPORARIAMENTE, PODE MUDAR
const float D_OCTAVE_FREQUENCY[BUTTON_COUNT] = {
    261.63, 293.66,  // C4  // D4
    311.13, 349.23,  // Eb4 // F4
    392.00, 415.30,  // G4  // Ab4
    466.16, 523.25   // Bb4 // C5
};

void button_init_all() {
	for(int i = 0; i < BUTTON_COUNT; i++) {
		gpio_init(BUTTONS[i]);
		gpio_set_dir(BUTTONS[i], GPIO_IN);
		gpio_pull_up(BUTTONS[i]);
	}
}

int main() {
	stdio_init_all();
	button_init_all();

	while(true) {

	}
}
