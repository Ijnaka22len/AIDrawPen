#include <AIDrawPen.h>
#include "accelerometer.h"
#include "constants.h"
#include "predictor.h"
#include "sl_tflite_micro_model.h"
#include "sl_tflite_micro_init.h"
#include "sl_sleeptimer.h"
#include "sl_status.h"
#include "sl_led.h"
#include "constants.h"
#include <cstdio>
// BLE header
#include "sl_bluetooth.h"
#include "app_assert.h"
#include "gatt_db.h"
#include "em_common.h"



// Internal variables
static int input_length;
static volatile bool inference_timeout;
static sl_sleeptimer_timer_handle_t inference_timer;
static sl_sleeptimer_timer_handle_t led_timer;
static TfLiteTensor* model_input;
static tflite::MicroInterpreter* interpreter;
//
void printAbout(void)

{
  printf("\r\n###########################################\r\n");
  printf("\r\n ####    AIDrawPen For kid's Rehab.  #### \r\n");
  printf("\r\n  ####    github.com/Ijnaka22len    #### \r\n");
  printf("\r\n   ####    Leonel Akanji Akanji    #### \r\n");
  printf("\r\n    ####    |__| ,W,  L  Shape    #### \r\n");
  printf("\r\n      ##############################  \r\n");
}
//
static void on_timeout_inference(sl_sleeptimer_timer_handle_t *handle, void* data)
{
    (void)handle; //
    (void)data; //
    inference_timeout = true;
}

void on_timeout_led(sl_sleeptimer_timer_handle_t *led_timer, void *data)
{
    (void)led_timer; // unused
    (void)data; // unused
    sl_led_turn_off(&LEDG);
    sl_led_turn_off(&LEDB);
}

void AIDrawPen_init(void)
{
    printAbout();
    printf("\r\n AIDrawPen Model initialization...\r\n");
    model_input = sl_tflite_micro_get_input_tensor();
    interpreter = sl_tflite_micro_get_interpreter();
    if ((model_input->dims->size != 4) || (model_input->dims->data[0] != 1)
        || (model_input->dims->data[2] != ACCELEROMETER_CHANNELS)
        || (model_input->type != kTfLiteFloat32)) {
        EFM_ASSERT(false);
        return;
    }

    input_length = model_input->bytes / sizeof(float);

    sl_status_t setup_status = accelerometer_setup();

    if (setup_status != SL_STATUS_OK) {
        printf(" Error: accelerometer setup failed \r\n");
        EFM_ASSERT(false);
        return;
    }

    while (true) {
        sl_status_t status = accelerometer_read(NULL, 0);
        if (status == SL_STATUS_OK) {
            break;
        }
    }

    inference_timeout = false;
    sl_sleeptimer_start_periodic_timer_ms(&inference_timer, INFERENCE_PERIOD_MS, on_timeout_inference, NULL, 0, 0);

    printf(" Ready...!\r\n");
}


void send_gesture_via_ble(uint8_t gesture)
{

    printf(" BLE sent byte: %u\r\n", (unsigned int)gesture);
    sl_status_t sc;
    sc = sl_bt_gatt_server_notify_all(gattdb_gesture_data,
                                        sizeof(gesture),
                                        &gesture);
    app_assert_status(sc);

}

static void handle_output(int gesture, acc_data_t *dst)
{
    uint8_t gesture_value = 0;

    if (gesture == V_GESTURE) {
        printf(" Detection= W      ");
        sl_led_turn_on(&LEDG);
        sl_sleeptimer_start_timer_ms(&led_timer,
                                     LED_DELAY_MS,
                                     on_timeout_led, NULL,
                                     0,
                                     SL_SLEEPTIMER_NO_HIGH_PRECISION_HF_CLOCKS_REQUIRED_FLAG);
        gesture_value = BLE_GESTURE_V;
    } else if (gesture == SQUARE_GESTURE) {
        printf(" Detection= |__|      ");
        sl_led_turn_on(&LEDG);
        sl_led_turn_on(&LEDB);
        sl_sleeptimer_start_timer_ms(&led_timer,
                                     LED_DELAY_MS,
                                     on_timeout_led, NULL,
                                     0,
                                     SL_SLEEPTIMER_NO_HIGH_PRECISION_HF_CLOCKS_REQUIRED_FLAG);
        gesture_value = BLE_GESTURE_SQUARE;
    } else if (gesture == L_GESTURE) {
        printf(" Detection= L      ");
        sl_led_turn_on(&LEDB);
        sl_sleeptimer_start_timer_ms(&led_timer,
                                     LED_DELAY_MS,
                                     on_timeout_led, NULL,
                                     0,
                                     SL_SLEEPTIMER_NO_HIGH_PRECISION_HF_CLOCKS_REQUIRED_FLAG);
        gesture_value = BLE_GESTURE_L;
    }else if(gesture==N_GESTURE){
        sl_led_turn_on(&LEDR);
        sl_sleeptimer_start_timer_ms(&led_timer,
                                     LED_DELAY_MS,
                                     on_timeout_led, NULL,
                                     0,
                                     SL_SLEEPTIMER_NO_HIGH_PRECISION_HF_CLOCKS_REQUIRED_FLAG);
        gesture_value = 0;

    }

    if (gesture_value != 0) {
        send_gesture_via_ble(gesture_value);
    }
}

void AIDrawPen_loop(void)
{
    acc_data_t *dst = (acc_data_t *) model_input->data.f;
    size_t n = input_length / 3;
    sl_status_t status = accelerometer_read(dst, n);

    //
    if (status == SL_STATUS_FAIL) {
        return;
    }
    //
    if (inference_timeout) {
        inference_timeout = false;
        TfLiteStatus invoke_status = interpreter->Invoke();
        if (invoke_status != kTfLiteOk) {
            printf("error: inference failed\r\n");
            return;
        }
        //
        const model_output_t *output = (const model_output_t *)interpreter->output(0)->data.f;
        int gesture = predict_gesture(output, dst, n);
        handle_output(gesture,  dst);
    }
}

