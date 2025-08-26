#include "pico/stdlib.h"
#include "buttons.h"
#include "display.h"
#include "notes.h"
#include "pins.h"
#include "sound.h"
#include <stdbool.h>
#include <stdio.h>

int main() {
	stdio_init_all();
  	button_init_all(BUTTONS, BUTTON_COUNT);

	while(1) {
		for(int i = 0; i < BUTTON_COUNT; i++) {
			if(gpio_get(BUTTONS[i]) == 1) {
				printf("GPIO%d pressed!\n", BUTTONS[i]);

				play_tone(BUZZER_PIN, D_OCTAVE_FREQUENCY[i], 200);
			}
    	}
		sleep_ms(1);
	}
}
