# BPSK Communication System with PRN Code Synchronization

## Overview
This MATLAB-based project implements a **Binary Phase Shift Keying (BPSK) communication system** with **Pseudo-Random Noise (PRN) code synchronization**. The system consists of a **transmitter** and a **receiver**, allowing for data transmission over an audio channel. It supports multiple PRN codes for synchronization and identification, making it suitable for applications such as satellite communication and spread spectrum systems.

## Features
- **BPSK Modulation and Demodulation**
- **PRN Code Generation (Gold Codes)**
- **Audio Transmission via `soundsc`**
- **Cross-Correlation-Based PRN Synchronization**
- **Bit Error Rate (BER) Calculation**
- **Support for Multiple PRN Codes (Simulated Satellites)**

## System Components
### 1. Transmitter (`transmitter.m`)
The transmitter generates random binary data, modulates it using BPSK, and prepends a PRN code for synchronization. The signal is then transmitted via the computer's audio output.

#### **Key Functions:**
- `bpsk_modulate(data, fc, fs, data_rate)`: BPSK modulation
- `generateGoldCode(length)`: Generates PRN codes
- **Signal Transmission:** Uses `soundsc` for audio-based transmission
- **Data Storage:** Saves transmitted signal and PRN codes for receiver use

### 2. Receiver (`receiver.m`)
The receiver loads a recorded signal, identifies the transmitted PRN code using **cross-correlation**, extracts the modulated data, and performs BPSK demodulation to recover the original binary sequence.

#### **Key Functions:**
- `bpsk_demodulate(signal, fc, fs, data_rate)`: BPSK demodulation
- **PRN Synchronization:** Cross-correlation with stored PRN codes
- **Bit Error Rate Calculation**
- **Recovered Data Output**

## Installation & Usage
### **Prerequisites**
- MATLAB (Tested on R2023a, but compatible with earlier versions)
- A sound card and speakers (for transmission)
- A microphone (for receiving audio signals)

### **Running the Transmitter**
1. Open `transmitter.m` in MATLAB.
2. Set parameters like `fs`, `fc`, `data_rate`, and `prn_length` if needed.
3. Run the script. It will:
   - Generate random data
   - Modulate data using BPSK
   - Prepend a PRN code for synchronization
   - Transmit the signal using `soundsc`
   - Save the transmitted signal (`transmitted_signal.mat`)

### **Running the Receiver**
1. Record the transmitted signal (e.g., using an external microphone or MATLAB's `audiorecorder`).
2. Load the recorded `.wav` file in MATLAB.
3. Run `receiver.m`. It will:
   - Load the recorded signal
   - Identify the correct PRN code using cross-correlation
   - Extract and demodulate the BPSK signal
   - Display the recovered data and compute the BER

## Performance Considerations
- **Works well for data lengths < 50 bits**
- **For data > 50 bits, potential errors up to 50% may occur**
  - Likely due to synchronization drift or PRN misalignment
  - Requires debugging PRN correlation and data extraction
- **Improving synchronization and error correction needed for longer transmissions**

## Future Improvements
- **Enhancing PRN synchronization robustness**
- **Implementing error correction (e.g., Hamming codes, Viterbi decoding)**
- **Expanding to Quadrature Phase Shift Keying (QPSK) for higher data rates**
- **Improving audio transmission reliability**

## License
This project is released under the MIT License. Feel free to use and modify it for research or educational purposes.

## Author
[Your Name]  
GitHub: [Your GitHub Profile]  
Email: [Your Email]

---
If you encounter any issues or have suggestions for improvement, feel free to open an issue or contribute to the repository!

