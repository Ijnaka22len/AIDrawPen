/***************************************************************************//**
 * @file
 * @brief Constants for use in the sample application
 *******************************************************************************
 * # License
 * <b>Copyright 2022 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

#ifndef CONSTANTS_H
#define CONSTANTS_H

// The expected accelerometer data sample frequency
#define ACCELEROMETER_FREQ      25
#define ACCELEROMETER_CHANNELS   3

// LEDs are active for this amount of time before they are turned off
#define TOGGLE_DELAY_MS       2000

// Inference it triggered by a periodic timer, this configuration is the time
// between each trigger
#define INFERENCE_PERIOD_MS    200

// Length of the accelerator input sequence expected by the model
#define SEQUENCE_LENGTH         90

#endif // CONSTANTS_H
