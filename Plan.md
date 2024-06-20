# AIDrawPen: A Wireless Gesture-Based Drawing device for Kids' Rehabilitation

## Project Overview
The Gesture-Based Drawing Application aims to provide an engaging and interactive tool specifically designed for children's rehabilitation. By leveraging TinyML and BLE technology, the project focuses on detecting physical gestures with an EFR32MG24 development kit and translating them into digital drawings on a mobile application. This innovative approach turns therapy exercises into fun activities, helping children improve their motor skills, coordination, and cognitive abilities in a playful manner.

## Objectives
1. Implement TinyML on the EFR32MG24 to detect gestures accurately.
2. Develop a child-friendly mobile application to draw structures (Stage 1: circle, L) based on detected gestures.
3. A Mobile App: Create a customizable and interactive therapy UI suitable for children's rehabilitation programs.

## Requirements

### Hardware
- EFR32MG24 Development Kit([EFR32MG24B310F1536IM48-B](https://www.digikey.com/en/products/detail/silicon-labs/XG24-DK2601B/16184039?utm_adgroup=&utm_source=google&utm_medium=cpc&utm_campaign=PMax%20Shopping_Product_Low%20ROAS%20Categories&utm_term=&utm_content=&utm_id=go_cmp-20243063506_adg-_ad-__dev-c_ext-_prd-16184039_sig-Cj0KCQjwxqayBhDFARIsAANWRnQfgMTzgP86MRddp-77fYlwHySYL0fMVkaOqx001dWaH0p5y5KPSfUaAqKzEALw_wcB&gad_source=4&gclid=Cj0KCQjwxqayBhDFARIsAANWRnQfgMTzgP86MRddp-77fYlwHySYL0fMVkaOqx001dWaH0p5y5KPSfUaAqKzEALw_wcB))
- 6-axis inertial sensor (accelerometer and gyroscope)
- Debugging tools:  SEGGER J-Link

### Software
- Simplicity Studio
- TensorFlow and Keras
- Python (for data preprocessing)
- Bluetooth SDK
- Mobile app development framework ( Flutter)

## Project Timeline

### Week 1-2: Project Setup and Data Collection
1. Set up the development environment and configure the EFR32MG24 development board.
2. Collect and label gesture data for training the ML model.

### Week 3-4: Model Training and Integration
1. Train a gesture classification model using TensorFlow and Keras.
2. Integrate the trained model into the EFR32MG24 firmware.

### Week 5-6: BLE Communication Setup
1. Configure BLE services and characteristics on the EFR32MG24.
2. Develop firmware to send BLE notifications upon detecting gestures.

### Week 7-8: Mobile App Development and Testing
1. Develop a child-friendly mobile application to receive BLE notifications and draw structures.
2. Test the complete system for accuracy and reliability.

## Deliverables
1. TinyML model(Stage 1 model) for gesture detection optimized for children's rehabilitation.
2. Embedded firmware for the EFR32MG24 with integrated gesture detection and BLE communication.
3. Child-friendly mobile application capable of connecting to the EFR32MG24 and drawing structures based on gestures(Stage 1).
4. Project documentation including code, schematics, and user manual.

## Conclusion
The Gesture-Based Drawing Application for Kids' Rehabilitation offers a novel approach to therapy exercises, making them engaging and enjoyable for children. By combining TinyML and BLE technology, this project has the potential to become an effective tool in pediatric rehabilitation programs, helping children achieve their therapy goals while having fun.



---

This `README.md` file focuses on the main goal of the project, which is children's rehabilitation, and provides a concise overview of the project objectives, requirements, timeline, deliverables, and contact information.
```