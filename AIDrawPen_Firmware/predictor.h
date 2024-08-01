#ifndef PREDICTOR_H
#define PREDICTOR_H

#include "constants.h"
#include "accelerometer.h"

typedef struct model_output {
  float gesture[GESTURE_COUNT];
} model_output_t;
int predict_gesture(const model_output_t* output, acc_data_t *dst,int n);
#endif // PREDICTOR_H
