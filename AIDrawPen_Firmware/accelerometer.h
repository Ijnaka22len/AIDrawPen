#ifndef ACCELEROMETER_H
#define ACCELEROMETER_H

#include "sl_status.h"
//
typedef struct acc_data {
  float x;
  float y;
  float z;
} acc_data_t;
//
sl_status_t accelerometer_setup(void);
//
sl_status_t accelerometer_read(acc_data_t* dst, int n);

#endif // ACCELEROMETER_H
