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
