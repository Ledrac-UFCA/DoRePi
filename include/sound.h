#ifndef SOUND_H
#define SOUND_H

#include "pico/stdlib.h"

void play_tone(uint gpio, float frequency, int duration_ms);

#endif