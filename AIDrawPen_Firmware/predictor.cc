#include "predictor.h"
#include "constants.h"
#include "accelerometer.h"
#include <cstdio>
#include "sl_imu.h"


//
static model_output_t history[PREDICTION_HISTORY_LEN] = {};
static int history_index = 0;
static int suppression_count = 0;
static int previous_prediction = N_GESTURE;
float prediction_sum1 = 0.0f;
float prediction_average1 = 0.0;

int predict_gesture(const model_output_t* output, acc_data_t *dst, int n)
{
  history[history_index] = *output;

  ++history_index;
  if (history_index >= PREDICTION_HISTORY_LEN) {
    history_index = 0;
  }
  int max_predict_index = -1;
  float max_predict_score = 0.0f;

  for (int i = 0; i < GESTURE_COUNT; i++) {
    float prediction_sum = 0.0f;
    for (int j = 0; j < PREDICTION_HISTORY_LEN; ++j) {
      prediction_sum += history[j].gesture[i];
      prediction_sum1 += history[j].gesture[i];
    }
    const float prediction_average = prediction_sum / PREDICTION_HISTORY_LEN;
    prediction_average1 = prediction_sum / PREDICTION_HISTORY_LEN;
    if ((max_predict_index == -1) || (prediction_average > max_predict_score)) {
      max_predict_index = i;
      max_predict_score = prediction_average;

    }
  }
  if (suppression_count > 0) {
    --suppression_count;
  }
  if ((max_predict_index == N_GESTURE)
      || (max_predict_score < DETECTION_THRESHOLD)
      || ((max_predict_index == previous_prediction) && (suppression_count > 0))) {
    return N_GESTURE;
  } else {
    suppression_count = PREDICTION_SUPPRESSION;
    previous_prediction = max_predict_index;
    return max_predict_index;
  }
}
