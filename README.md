# 📡 BPSK Communication System with PRN Code Synchronization

## 📋 Table of Contents
1. [Overview](#-overview)
2. [Features](#-features)
3. [Repository Structure](#-repository-structure)
4. [How It Works](#-how-it-works)
   - [Transmitter](#-transmitter)
   - [Receiver](#-receiver)
5. [Installation & Usage](#-installation--usage)
6. [Performance Considerations](#-performance-considerations)
7. [Future Improvements](#-future-improvements)
8. [License](#-license)
9. [Author](#-author)

---

## 🌟 Overview
This MATLAB-based project implements a **Binary Phase Shift Keying (BPSK) communication system** with **Pseudo-Random Noise (PRN) code synchronization**. The system includes a **transmitter** and a **receiver**, allowing for data transmission over an audio channel. It supports multiple PRN codes for synchronization and identification, making it suitable for applications like satellite communication and spread spectrum systems. 🚀

---

## ✨ Features
✅ **BPSK Modulation and Demodulation**  
✅ **PRN Code Generation (Gold Codes)**  
✅ **Audio Transmission via `soundsc`**  
✅ **Cross-Correlation-Based PRN Synchronization**  
✅ **Bit Error Rate (BER) Calculation**  
✅ **Support for Multiple PRN Codes (Simulated Satellites)**  

---

## 🗂 Repository Structure
```
BPSK-PRN-Synchronization
├── Transmitter/                # Transmitter code
│   ├── transmitter.m           # MATLAB script for BPSK modulation
│   ├── generateGoldCode.m      # Function to generate PRN codes
│   ├── bpsk_modulate.m         # Function for BPSK modulation
├── Receiver/                   # Receiver code
│   ├── receiver.m              # MATLAB script for BPSK demodulation
│   ├── bpsk_demodulate.m       # Function for BPSK demodulation
│   ├── recorded_signal.wav     # Example recorded signal (optional)
├── README.md                   # Project documentation
└── LICENSE                     # License file
```

---

## 🛠 How It Works
### 📤 Transmitter (`transmitter.m`)
1. Generates random binary data. 🎲
2. Appends a PRN code to the beginning of the data for synchronization. 🔗
3. Modulates the data using BPSK. 📡
4. Broadcasts the signal using `soundsc`. 🔊

#### **Key Functions:**
- `bpsk_modulate(data, fc, fs, data_rate)`: BPSK modulation
- `generateGoldCode(length)`: Generates PRN codes

### 📥 Receiver (`receiver.m`)
1. Records the transmitted signal (or loads a pre-recorded signal). 🎤
2. Uses cross-correlation with the PRN code to find the start of the signal. 🔍
3. Extracts and demodulates the BPSK signal to recover the original data. 📟
4. Calculates the bit error rate (BER) to evaluate performance. 📊

#### **Key Functions:**
- `bpsk_demodulate(signal, fc, fs, data_rate)`: BPSK demodulation
- **PRN Synchronization:** Cross-correlation with stored PRN codes
- **Bit Error Rate Calculation**

---

## 🚀 Installation & Usage
### **Prerequisites**
- MATLAB (Tested on R2023a, but compatible with earlier versions) 🖥️
- A sound card and speakers (for transmission) 🔊
- A microphone (for receiving audio signals) 🎙️

### **Running the Transmitter**
1. Open `transmitter.m` in MATLAB. 💻
2. Set parameters like `fs`, `fc`, `data_rate`, and `prn_length`. ⚙️
3. Run the script to generate and broadcast the BPSK-modulated signal. 📡
4. The transmitted signal is saved in `transmitted_signal.mat`. 💾

### **Running the Receiver**
1. Record the transmitted signal (e.g., using an external microphone or MATLAB's `audiorecorder`). 🎤
2. Load the recorded `.wav` file in MATLAB. 📂
3. Run `receiver.m` to:
   - Identify the correct PRN code using cross-correlation. 🔍
   - Extract and demodulate the BPSK signal. 📟
   - Display the recovered data and compute the BER. 📊

---

## 📊 Performance Considerations
⚠️ **Works well for data lengths < 50 bits**  
⚠️ **For data > 50 bits, potential errors up to 50% may occur**  
✅ **Requires improved synchronization and error correction**  

---

## 🔮 Future Improvements
🚀 **Enhancing PRN synchronization robustness**  
🚀 **Implementing error correction (e.g., Hamming codes, Viterbi decoding)**  
🚀 **Expanding to Quadrature Phase Shift Keying (QPSK) for higher data rates**  
🚀 **Improving audio transmission reliability**  

---

## 📜 License
This project is open-source under the **MIT License**. Feel free to use, modify, and contribute! 🤝

---

## 👨‍💻 Author
**[Saba_abiri]**  
🔗 GitHub: [Saba Abiri](https://github.com/Saba-abiri)

📧 Email: [Saba0abiri@gmail.com]  

---
💡 **If you encounter any issues or have suggestions, feel free to open an issue or contribute to the repository!** 🚀

