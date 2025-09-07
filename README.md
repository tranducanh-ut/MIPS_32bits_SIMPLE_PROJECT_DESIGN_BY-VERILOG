<!-- Banner -->
<h1 align="center">⚡ MIPS_32BIT_SIMPLE_PROJECT ⚡</h1>
<p align="center">
  <b>A Simple 32-bit MIPS CPU in Verilog</b><br>
  📅 Public: 09/07/2025 | 👤 Personal Project
</p>

---

## 🌟 Overview
This project implements a **simple 32-bit MIPS processor** in Verilog.  
👉 Supports a subset of instructions: `ADD`, `SUB`, `AND`, `OR`, `SLT`, `ADDI`, `LW`, `SW`  
⚠️ *Currently, jump instructions are not supported.*

---
## ⚡ Processor Design Style: Single-Cycle (No Pipeline)

This project implements a **Single-Cycle MIPS Processor**, meaning all **5 classic stages** of instruction execution are completed **within one clock cycle**:

1. **IF (Instruction Fetch)** – Fetch instruction from instruction memory  
2. **ID (Instruction Decode & Register Read)** – Decode opcode, read registers  
3. **EX (Execute / ALU)** – Perform arithmetic or logical operation  
4. **MEM (Memory Access)** – Load or store data from/to memory  
5. **WB (Write Back)** – Write result back into the register file  

🕐 In this model, the **entire instruction finishes in exactly one clock cycle**, regardless of instruction type.

---

### ✅ Advantages of Single-Cycle Design
- **Simplicity** – The control unit is straightforward since every instruction completes in one cycle.  
- **Easy Debugging** – No hazards (data, control, or structural) because instructions do not overlap.  
- **Fast for Simple Programs** – For small programs with few instructions, single-cycle execution feels immediate.  
- **Clear Instruction Flow** – Easy for students or beginners to visualize the datapath since all stages happen sequentially inside one cycle.  
- **Deterministic Timing** – Each instruction always takes exactly one cycle → predictable performance.  
- **No Hazard Handling Logic Needed** – Unlike pipelined processors, no forwarding, stalling, or branch prediction is required.  
- **Great for Learning** – Serves as an excellent educational model to understand the fundamentals of processor architecture.  

---

### ❌ Disadvantages of Single-Cycle Design
- **Long Clock Period** – The cycle time must be long enough to accommodate the slowest instruction (e.g., `lw` which includes memory access).  
- **Wasted Potential** – Simple instructions like `add` finish quickly but must still wait for the long cycle time.  
- **Poor Scalability** – As more complex instructions are added, the clock period must increase, slowing down the entire processor.  
- **Inefficient Hardware Utilization** – Functional units (ALU, Memory, etc.) are only used once per cycle, leaving them idle most of the time.  
- **Low Performance** – Compared to pipelined designs, throughput is significantly lower since only one instruction is processed at a time.  
- **Difficult for Real Applications** – While educationally useful, single-cycle CPUs are not practical for large-scale computing tasks.  
- **Inflexibility** – Cannot easily adapt to advanced features such as caches, interrupts, or superscalar execution.  
- **Instruction Latency Uniformity** – Forces all instructions, regardless of complexity, to share the same execution time, leading to inefficiency.  

---

📌 **Summary:**  
The **Single-Cycle design** is simple, clean, and ideal for educational use, but it comes with **serious performance limitations**. Modern processors almost always use pipelining (or even deeper optimizations) to overcome these bottlenecks.  

---

## 📂 Project Structure

📦 MIPS_32BIT_SIMPLE_PROJECT  
┣ 📁 test_case # Contains .hex files generated from Assembly  
┣ 📁 source1 # Contains 5 Verilog source files  
┃ ┣ 📄 MIPS_TOP.v # Top-level module, integrates all pipeline stages  
┃ ┣ 📄 FETCH.v # Instruction Fetch stage (loads from Instruction Memory)  
┃ ┣ 📄 Decode.v # Instruction Decode + Register File  
┃ ┣ 📄 ALU.v # Arithmetic and Logic Unit  
┃ ┗ 📄 MEM.v # Memory stage (Load/Store + Writeback)  
┣ 📁 simulation # Testbench files for program execution  
┣ 📷 wave_form.png # Example waveform from one of the test cases  
┗ 📄 README.md  



## 🛠️ How to Run

### 1️⃣ Run with existing test_case
- Open `FETCH.v` inside `source1`  
- Update the `$readmemh("...");` path with your `.hex` file  
- Run simulation → check the waveform (`wave_form.png` shows an example output).

### 2️⃣ Generate a new test_case using **MARS MIPS**
1. Write your Assembly program in **MARS**  
2. Click **Run → Assemble**  
3. Go to **File → Dump Memory → Hexadecimal file** → Save as `.hex`  
4. Update the `$readmemh("your_path/file.hex");` in `FETCH.v`  
5. Run simulation again

---



## 📬 Connect with Me

<p align="center">
  <a href="https://www.facebook.com/anh.tran.78639?locale=vi_VN">
    <img src="https://img.shields.io/badge/Facebook-%231877F2.svg?&style=for-the-badge&logo=facebook&logoColor=white" />
  </a>
  <a href="https://www.linkedin.com/in/anh-tr%E1%BA%A7n-%C4%91%E1%BB%A9c-84116b368/">
    <img src="https://img.shields.io/badge/LinkedIn-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />
  </a>
  <a href="mailto:anh.trananhbk@hcmut.edu.vn">
    <img src="https://img.shields.io/badge/Email-D14836?&style=for-the-badge&logo=gmail&logoColor=white" />
  </a>
</p>

---

<p align="center">⭐ If you find this project helpful, feel free to give it a star! ⭐</p>
