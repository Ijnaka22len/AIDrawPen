
#ifndef CONSTANTS_H
#define CONSTANTS_H

#include "sl_simple_led.h"
#include "sl_simple_led_instances.h"
////LEDs
extern sl_led_t LEDB;
extern sl_led_t LEDG;
extern sl_led_t LEDR;

#define ACCELEROMETER_FREQ        45
#define ACCELEROMETER_CHANNELS    3
#define LED_DELAY_MS              2000
#define ACC_SEQUENCE_LENGTH       128
#define INFERENCE_PERIOD_MS       200
//Supported gestures.
#define GESTURE_COUNT             4
#define V_GESTURE                 0
#define SQUARE_GESTURE            1
#define L_GESTURE                 2
#define N_GESTURE                 3
//Algorithm sensitivity constants.
#define DETECTION_THRESHOLD       0.9f
#define PREDICTION_HISTORY_LEN    5
#define PREDICTION_SUPPRESSION    18
// Constants for BLE notifications
#define BLE_GESTURE_V             1
#define BLE_GESTURE_SQUARE        2
#define BLE_GESTURE_L             3



/* FIRMWARE WORKING MECHANISM
ACCELEROMETER_FREQ = 45  # Hz (readings per second)
ACC_SEQUENCE_LENGTH = 128
INFERENCE_PERIOD_MS = 200

time_per_reading = 1 / ACCELEROMETER_FREQ  # seconds per reading
total_time_for_sequence = ACC_SEQUENCE_LENGTH * time_per_reading  # seconds
last_trigger_time = total_time_for_sequence*1000 #time between each trigger
amount_of_triggers = int(last_trigger_time/INFERENCE_PERIOD_MS)
print(f"Time per reading: {time_per_reading:.2f} seconds")
print(f"Total time for {ACC_SEQUENCE_LENGTH} readings: {total_time_for_sequence:.2f} seconds")
print(f"Expected Time for last trigger: {last_trigger_time:.2f} milliseconds")
print(f"Complete triggers: {amount_of_triggers:.0f} ")
print(f"Actual Time for last trigger: {(INFERENCE_PERIOD_MS*amount_of_triggers):.0f} ")
---------------------------------------
Time per reading: 0.02 seconds
Total time for 128 readings: 2.84 seconds
Expected Time for last trigger: 2844.44 milliseconds
Complete triggers: 14
Actual Time for last trigger: 2800
So the  IMU produces data at the 20ms that is fed to a buffer for predictions
The buffer takes 2840ms to fill up the complete 128 sequence length.
However, predictions are simultaneously triggered every 200ms.
So for a complete 2840ms, 14 (2840ms/200ms) complete triggers or prediction attempts are made.
Predictions data(buffer) keeps filling up until 2840ms.
Typical case:W-shape. assume W===\/\/
assuming buffer data=\  at 710ms, there will be int(710/200)=3 predictions
next buffer data=\/  at 710*2= 1420ms, there will be int(1420/200)=7 predictions attempts at this time
....
Last buffer data=\/\/  at 710*4= 2840ms, there will be int(2840ms/200)=14 predictions attempts at this time.
at this point the prediction is valid for W-shape


 */




#endif // CONSTANTS_H
