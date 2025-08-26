#ifndef BUTTONS_H
#define BUTTONS_H

#define BUTTON_COUNT 8

void button_init_all(const int gpio_pins[], int count);

extern const int BUTTONS[BUTTON_COUNT];

#endif