#include "pico/stdlib.h"
#include "hardware/pwm.h"
#include "sound.h"

void play_tone(uint gpio, float frequency, int duration_ms) {
    gpio_set_function(gpio, GPIO_FUNC_PWM);

    uint slice_num = pwm_gpio_to_slice_num(gpio);
    uint chan = pwm_gpio_to_channel(gpio);
    
    uint32_t clock = 125000000;
    int32_t wrap = (uint32_t)((float)clock / frequency);
    
    pwm_set_wrap(slice_num, wrap);
    pwm_set_chan_level(slice_num, chan, wrap);
    pwm_set_enabled(slice_num, true);

    sleep_ms(duration_ms);
    
    pwm_set_enabled(slice_num, false);
}