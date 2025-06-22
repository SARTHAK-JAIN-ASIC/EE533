# EE533 – Advanced Computer Architecture Projects
**Sarthak Jain**  
🧠 Master's in Electrical Engineering – Computer Architecture | USC  
📧 sarthakj84@gmail.com | [LinkedIn](http://linkedin.com/in/sarthak-jain-ms-ee) | [Project Demos (YouTube)](https://youtube.com/playlist?list=PLLlDYTD17uuSVnh_l-IZ8kwdkERV3T-qU)  

---

## 📘 Overview

This repository contains my advanced projects from **EE533: Advanced Computer Architecture** at the University of Southern California. The coursework emphasized RTL design, simulation, and architectural modeling across CPUs, memory hierarchies, and AI-accelerated systems.

All implementations were built with a strong emphasis on **microarchitectural correctness**, **hardware-software co-design**, and **performance optimization**.

---

## 🧩 Projects in This Repo

### 1. 🔹 AI-Accelerated Network Traffic Classifier
**SystemVerilog, Python, NetFPGA, ARM Cortex, DMA**

- Designed and deployed a Neural Processing Unit (NPU) integrated with an ARM-based CPU for live traffic classification
- Offloaded MLP-based inference from CPU to FPGA, cutting latency by 25% vs. Snort
- Achieved complete packet capture → DMA → inference → output loop on NetFPGA
- Evaluated using Wireshark and iperf workloads

### 2. 🔹 ARMv7-Compatible Pipelined CPU
**SystemVerilog, Vivado, Questasim, NetFPGA**

- Designed a 5-stage pipelined ARMv7 CPU with forwarding, hazard detection, and branch prediction
- Added a custom CAM-based associative cache with LRU replacement policy
- Timing closure and validation using static timing analysis (STA)
- Executed real software (e.g., Bubble Sort) to demonstrate functional correctness

### 4. 🔹 Async FIFO with Internal Low-Latency Buffer
**SystemVerilog, VHDL, CDC-safe**

- Built a BRAM-backed dual-clock FIFO with 4×16 internal buffer for burst-mode reads
- Ensured CDC safety via pointer synchronization and testbench-based metastability checks
- Latency reduced by ~27% on burst reads

---

## 📂 Directory Structure
EE533/
├──


---

## 🛠️ Tools & Platforms Used

- RTL Design: **SystemVerilog, Verilog, VHDL**
- Simulators: **Questasim, ModelSim, Vivado**
- Modeling: **GEM5, GPGPU-sim**
- FPGA Platforms: **NetFPGA (Xilinx Virtex-2 Pro), AMD Artix-7**
- OS/Infra: **Ubuntu (WSL), Docker, Python, Wireshark**

---

## 🧠 Learning Outcomes

- Gained hands-on understanding of microarchitectural tradeoffs
- Bridged RTL and software performance measurement (e.g., cycle-level IPC tuning)
- Deployed AI hardware accelerators for real-world classification problems
- Explored memory subsystems and bottlenecks in CPU and GPU contexts

---

## 📬 Contact

Feel free to reach out for collaborations, research discussions, or questions:
- 📧 **sarthakj84@gmail.com**
- 🌐 [LinkedIn](http://linkedin.com/in/sarthak-jain-ms-ee)
- 📹 [YouTube Project Playlist](https://youtube.com/playlist?list=PLLlDYTD17uuSVnh_l-IZ8kwdkERV3T-qU)

---

⭐ If you found this repo useful, consider starring it or checking out my [GitHub profile](https://github.com/SARTHAK-JAIN-ASIC) for more!


