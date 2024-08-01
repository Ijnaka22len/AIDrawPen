

#ifndef AIDRAWPEN_H
#define AIDRAWPEN_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************************************************************//**
 * @brief
 *   Initialize the application.
 ******************************************************************************/
void AIDrawPen_init(void);

/***************************************************************************//**
 * @brief
 *   Runs the data gathering and inference loop. This should be called
 *   repeatedly from the main function.
 ******************************************************************************/
void AIDrawPen_loop(void);
//
void printAbout(void);


#ifdef __cplusplus
}
#endif

#endif // AIDRAWPEN_H
