#include "pico/stdlib.h"
#include "buttons.h"
#include "pins.h"

const int BUTTONS[] = {
	BTN_GPIO02_PHYS04, BTN_GPIO03_PHYS05, BTN_GPIO04_PHYS06, BTN_GPIO05_PHYS07,
	BTN_GPIO06_PHYS09, BTN_GPIO07_PHYS10, BTN_GPIO08_PHYS11, BTN_GPIO09_PHYS12
};

void button_init_all(const int gpio_pins[], int count) {
	for(int i = 0; i < count; i++) {
		gpio_init(gpio_pins[i]);
		gpio_set_dir(gpio_pins[i], GPIO_IN);
		gpio_pull_down(gpio_pins[i]);
	}
}