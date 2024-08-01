# AIDrawPen Firmware

## Introduction

The AIDrawPen Firmware is designed to control the AIDrawPen, a smart drawing pen that assists children with developmental disorders such as ADHD, ASD, and DCD in improving their fine motor skills. This project integrates advanced technology with therapeutic exercises, creating an engaging and interactive platform for children to develop their motor and cognitive skills.

## Features

- **Wireless Connectivity**: Uses Bluetooth Low Energy (BLE) for wireless communication.
- **Motion Sensing**: Equipped with an Inertial Measurement Unit (IMU) for accurate gesture recognition.
- **Edge AI**: Incorporates a custom-trained AI model for real-time gesture interpretation.
- **Real-time Feedback**: Provides immediate feedback to users through a connected mobile app.
- **Progress Tracking**: Records and monitors historical data for tracking improvement over time.

## Hardware Components

- **BLE Microcontroller**: EFR32MG32
- **Inertial Measurement Unit**: ICM-20689
- **Power Supply**: Coin-cell battery
- **Custom PCB**: Integrates all components

## Prerequisites

### Hardware

- AIDrawPen device with the specified components
- Programming tool compatible with EFR32MG32

### Software

- Simplicity Studio (for firmware development)
- Python (for data processing and model training)
- Mobile app (for user interface and feedback)

## Getting Started

### Cloning the Repository

```bash
git clone https://github.com/ijnaka22len/AIDrawPen.git
cd AIDrawPen/AIDrawPen_Firmware
```

## Setting Up Development Environment

### 1. Install Simplicity Studio

- **Download and Install:** Download Simplicity Studio from the [official website](https://www.silabs.com/developers/simplicity-studio).
- **Install:** Follow the installation instructions provided on the website.

### 2. Import the Project

- **Open Simplicity Studio:** Launch Simplicity Studio.
- **Import Project:** Import the `AIDrawPen_Firmware` project into Simplicity Studio.

### 3. Connect the Hardware

- **Connect Device:** Connect the AIDrawPen device to your development machine using a compatible programming tool.

## Building and Flashing the Firmware

### 1. Build the Project

- **Select Project:** In Simplicity Studio, select the `AIDrawPen_Firmware` project.
- **Build:** Click on the build button to compile the project.

### 2. Flash the Firmware

- **Successful Build:** Ensure the build is successful.
- **Flash Firmware:** Use the programming tool to flash the firmware onto the AIDrawPen device.

## Running the AIDrawPen

### 1. Power On

- **Insert Battery:** Insert the coin-cell battery into the AIDrawPen device.
- **Power On:** Power on the device.

### 2. Connect to Mobile App

- **Open App:** Launch the AIDrawPen mobile app on your smartphone.
- **Connect via BLE:** Connect to the AIDrawPen device via Bluetooth Low Energy (BLE).

### 3. Start Drawing

- **Begin Drawing:** Start drawing with the AIDrawPen.
- **Real-Time Feedback:** Receive real-time feedback and progress tracking on the mobile app.

---
