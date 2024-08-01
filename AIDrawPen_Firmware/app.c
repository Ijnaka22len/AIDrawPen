#include "stdio.h"

#include "app.h"
#include "AIDrawPen.h"
#include "sl_simple_button.h"
#include "sl_simple_button_instances.h"
#include "sl_led.h"
#include "constants.h"

// BLE
#include "sl_bluetooth.h"
#include "app_assert.h"
#include "gatt_db.h"
#include "em_common.h"


// The advertising set handle allocated from Bluetooth stack.
static uint8_t advertising_set_handle = 0xff;

/***************************************************************************//**
 * Initialize application.
 ******************************************************************************/
void app_init(void)
{
  printAbout();
  sl_led_turn_on(&LEDR);
  AIDrawPen_init();
  sl_simple_button_init(&sl_button_btn0);
}

/***************************************************************************//**
 * App Process function.
 ******************************************************************************/
uint8_t adc_data;
int counter =0, count_threshold = 1000, count_time=0;
sl_status_t sc;
void app_process_action(void)
{

  if (sl_simple_button_get_state(&sl_button_btn0) == SL_SIMPLE_BUTTON_PRESSED) {
      sl_led_turn_on(&LEDR);
      AIDrawPen_loop();
  }else{
      sl_led_turn_off(&LEDR);
  }
}


void sl_bt_on_event(sl_bt_msg_t *evt)
{
  sl_status_t sc;

  switch (SL_BT_MSG_ID(evt->header)) {
    // -------------------------------
    // This event indicates the device has started and the radio is ready.
    // Do not call any stack command before receiving this boot event!
    case sl_bt_evt_system_boot_id:
      // Create an advertising set.
      sc = sl_bt_advertiser_create_set(&advertising_set_handle);
      app_assert_status(sc);

      // Generate data for advertising
      sc = sl_bt_legacy_advertiser_generate_data(advertising_set_handle,
                                                 sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      // Set advertising interval to 100ms.
      sc = sl_bt_advertiser_set_timing(
        advertising_set_handle,
        160, // min. adv. interval (milliseconds * 1.6)
        160, // max. adv. interval (milliseconds * 1.6)
        0,   // adv. duration
        0);  // max. num. adv. events
      app_assert_status(sc);
      // Start advertising and enable connections.
      sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                         sl_bt_legacy_advertiser_connectable);
      app_assert_status(sc);
      break;

    // -------------------------------
    // This event indicates that a new connection was opened.
    case sl_bt_evt_connection_opened_id:
      break;

    // -------------------------------
    // This event indicates that a connection was closed.
    case sl_bt_evt_connection_closed_id:
      // Generate data for advertising
      sc = sl_bt_legacy_advertiser_generate_data(advertising_set_handle,
                                                 sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      // Restart advertising after client has disconnected.
      sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                         sl_bt_legacy_advertiser_connectable);
      app_assert_status(sc);
      break;

    ///////////////////////////////////////////////////////////////////////////
    // Add additional event handlers here as your application requires!      //
    ///////////////////////////////////////////////////////////////////////////
    case sl_bt_evt_gatt_server_user_write_request_id:
         break;

     case sl_bt_evt_gatt_server_user_read_request_id:
       break;

    // -------------------------------
    // Default event handler.
    default:
      break;
  }
}




