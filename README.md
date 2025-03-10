# STM32F103C8T6 Blink (Without IDE)

This repository demonstrates how to blink an LED on an STM32F103C8T6 microcontroller from scratch, without using any Integrated Development Environment (IDE). All the code is written using the Vim editor and relies on manual toolchain setup.

## Project Description

This project is designed for developers and hobbyists who want to learn how to set up and program an STM32F103C8T6 microcontroller without using an IDE such as STM32CubeIDE. The goal is to demonstrate a simple "blink" LED program that toggles an LED on and off using the STM32 hardware peripherals. The program is written using a minimal toolchain setup with `vim` as the editor and relies on `make` for building the project and `OpenOCD` for programming the STM32F103C8T6.

## Features

- Blink an LED connected to the STM32F103C8T6
- No IDE required
- Uses Vim as the editor and manual toolchain setup
- Cross-compiling with ARM GCC
- Flashing with OpenOCD

## System Requirements

- STM32F103C8T6 microcontroller (commonly known as "Blue Pill")
- ARM GCC toolchain (`arm-none-eabi-gcc`)
- OpenOCD for flashing and debugging
- Make utility for managing builds
- Vim or your preferred text editor

## Installation

Follow these steps to set up the project and compile the code.

### Step 1: Install Required Tools

Before you can start, you need to install some required tools. On a Linux-based system, you can install them using the package manager:

```bash
sudo apt-get update
sudo apt-get install gcc-arm-none-eabi openocd make vim
```
### Step 2: Clone the Repository

Clone this repository to your local machine

```bash
git clone https://github.com/jeerawatboe/f103_blink.git
```
### Step 3: Build the Project

Once you've cloned the repository, navigate to the project folder and compile the code using make

```bash
make
```
### Step 4: Flash the Firmware

To flash the firmware onto the STM32F103C8T6, use OpenOCD. The following command assumes you're using an ST-Link programmer/debugger

```bash
make flash
```
### Step 5: Observe the LED

After flashing the firmware, the LED connected to the STM32F103C8T6 will begin blinking. You can connect an LED to the appropriate GPIO pin (e.g., PC13) through a current-limiting resistor to see it blink.
