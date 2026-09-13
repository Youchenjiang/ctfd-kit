# 資安研討與實戰讀書會 16 週課程大綱 (Curriculum Syllabus)

本課程大綱旨在為讀書會成員提供為期 16 週的系統性資安攻防研討路徑，將理論知識（RFC、OWASP、安全標準）與 CTFd 靶場實戰操作深度結合。

---

## 🗺️ 學習模組地圖 (Curriculum Roadmap)

```mermaid
flowchart TD
    M1[模組一：資安基礎與靶場環境 (W1-W2)] --> M2[模組二：Web 應用程式安全 (W3-W6)]
    M2 --> M3[模組三：現代密碼學與資料安全 (W7-W9)]
    M3 --> M4[模組四：逆向工程與程式分析 (W10-W12)]
    M4 --> M5[模組五：二進位漏洞利用與記憶體保護 (W13-W15)]
    M5 --> M6[模組六：綜合攻防模擬沙盒實戰 (W16)]
```

---

## 📅 每週主題規劃與 CTFd 靶場對照

### 模組一：資安基礎與靶場環境 (Weeks 1 - 2)

#### Week 01: 讀書會啟航與 CTFd 靶場架設
- **核心觀念**：資訊安全三要素 (CIA Triad)、威脅建模、Docker 容器化靶場架構。
- **研讀清單**：Docker Compose 官方手冊、CTFd 開源架構與外掛原理。
- **實戰任務 (Lab)**：
  - 本地部屬 CTFd 容器環境與 MySQL 資料庫。
  - 驗證 `plugins/dynamic_shuffle_flag/` 動態 Flag 置換外掛。
  - 完成首道 Onboarding 簽到題目。

#### Week 02: 網路通訊協定安全與封包分析
- **核心觀念**：OSI 7 層模型、TCP/IP 三向交握、TLS/SSL 握手協商機制、常見未加密協定風險。
- **研讀清單**：RFC 8446 (TLS 1.3)、Wireshark User Guide。
- **實戰任務 (Lab)**：
  - PCAP 封包分析：提取 HTTP 明文認證、還原 FTP 傳輸檔案。
  - 分析 TLS SNI 與憑證鏈結構。

---

### 模組二：Web 應用程式安全 (Weeks 3 - 6)

#### Week 03: Injection 弱點專題 (SQLi & Command Injection)
- **核心觀念**：未過濾之使用者輸入拼接、SQL 語意結構破壞、OS 指令注入與跳脫技巧。
- **研讀清單**：OWASP Top 10 (A03:2021-Injection)、PortSwigger Web Security Academy - SQL Injection。
- **實戰任務 (Lab)**：
  - Union-based、Error-based 與 Blind (Boolean/Time-based) SQLi 實戰。
  - 使用 sqlmap 自動化工具輔助與撰寫自動化 PoC 腳本。

#### Week 04: 認證機制與授權漏洞 (Broken Authentication & BOLA/IDOR)
- **核心觀念**：Session 管理、JWT (JSON Web Token) 安全缺陷（None 演算法、弱密鑰爆破）、BOLA/IDOR 水平與垂直越權。
- **研讀清單**：RFC 7519 (JSON Web Token)、OWASP API Security Top 10。
- **實戰任務 (Lab)**：
  - 偽造非授權 JWT 提權至管理員角色。
  - 繞過前端存取控制取得未授權資料。

#### Week 05: 客戶端安全 (XSS, CSRF & CORS)
- **核心觀念**：Stored/Reflected/DOM XSS、Same-Origin Policy (SOP)、Cross-Origin Resource Sharing (CORS) 錯誤配置、CSRF Token 防禦原理。
- **研讀清單**：OWASP XSS Prevention Cheat Sheet、Content Security Policy (CSP) Level 3 Specification。
- **實戰任務 (Lab)**：
  - 構造 XSS Payload 竊取模擬 Admin 瀏覽器的 Session Cookie。
  - 突破寬鬆 CSP 策略（JSONP bypass、CDN script gadget）。

#### Week 06: 進階伺服端漏洞 (SSRF & 不安全反序列化)
- **核心觀念**：Server-Side Request Forgery (SSRF) 繞過過濾存取雲端 Metadata API (AWS/GCP)、Python/PHP 不安全反序列化機制。
- **研讀清單**：PortSwigger SSRF Guide、Python `pickle` / `yaml` 不安全解析論文。
- **實戰任務 (Lab)**：
  - SSRF 探測內部私有網路服務與 Redis 未授權存取。
  - 構造 Python `pickle.loads()` RCE Payload。

---

### 模組三：現代密碼學與資料安全 (Weeks 7 - 9)

#### Week 07: 對稱式密碼與區塊加密模式
- **核心觀念**：AES 運算結構、區塊加密模式 (ECB, CBC, CTR, GCM)、ECB 企鵝圖像特徵、CBC 密文翻轉攻擊 (Bit-flipping Attack)。
- **研讀清單**：NIST SP 800-38A、Cryptopals Crypto Challenges (Set 1 & 2)。
- **實戰任務 (Lab)**：
  - 利用 CBC Bit-flipping 修改 Token 中的使用者權限。
  - 撰寫 Padding Oracle 攻擊腳本逐步解密密文。

#### Week 08: 非對稱式密碼與 RSA 攻擊面
- **核心觀念**：RSA 原理（歐拉函數、質數分解、同餘運算）、低指數攻擊 (Low Public Exponent)、Fermat 分解法、Common Modulus 攻擊。
- **研讀清單**：Twenty Years of Attacks on the RSA Cryptosystem (Dan Boneh)。
- **實戰任務 (Lab)**：
  - Wiener 攻擊求解小私鑰 \(d\)。
  - Hastad 廣播攻擊利用中國剩餘定理 (CRT) 解密旗標。

#### Week 09: 雜湊函數弱點與偽隨機數生成器 (PRNG)
- **核心觀念**：雜湊抗碰撞性、長度擴展攻擊 (Length Extension Attack)、線性同餘產生器 (LCG) 與 MT19937 狀態還原。
- **研讀清單**：Hash Length Extension Explanation & PoC、Cryptopals Set 3 (Mersenne Twister)。
- **實戰任務 (Lab)**：
  - 利用 HashPump 偽造附加資料與合格 MAC。
  - 預測不安全隨機數種子生成的 Session ID。

---

### 模組四：逆向工程與程式分析 (Weeks 10 - 12)

#### Week 10: 二進位檔案格式與靜態逆向基礎
- **核心觀念**：ELF (Linux)、PE (Windows)、Mach-O (macOS) 格式結構、組合語言 (x86_64 / ARM64) 導讀、Ghidra / IDA Pro 基礎操作。
- **研讀清單**：Practical Reverse Engineering (Bruce Dang et al.)。
- **實戰任務 (Lab)**：
  - 使用 Ghidra 分析本專案題目 `challenges/reverse_graduation/`。
  - 分析 Zig C Compiler 跨平台建置之字串反混淆與分支跳躍邏輯。

#### Week 11: 動態除錯與符號執行
- **核心觀念**：GDB 除錯技巧、GDB-pwndbg 插件、函式呼叫約定 (Calling Conventions)、斷點追蹤與記憶體檢視、Angr 符號執行輔助解題。
- **研讀清單**：GDB Documentation、Symbolic Execution with Angr Quickstart。
- **實戰任務 (Lab)**：
  - 在 GDB 中動態 Patch 程式記憶體跳過授權檢查。
  - 使用 Angr 自動求解複雜字元驗證條件矩陣。

#### Week 12: 程式保護與反逆向技巧
- **核心觀念**：加殼 (Packing - UPX)、反除錯 (ptrace, IsDebuggerPresent)、控制流程平坦化 (Control Flow Flattening) 與虛擬機混淆 (VM Obfuscation)。
- **研讀清單**：The Art of Unpacking (Black Hat Paper)。
- **實戰任務 (Lab)**：
  - 手動脫殼 (Manual UPX Unpack) 與修正 OEP。
  - 識別並修補常見反除錯旗標以恢復正常執行。

---

### 模組五：二進位漏洞利用與記憶體保護 (Weeks 13 - 15)

#### Week 13: 經典堆疊溢位 (Stack Buffer Overflow)
- **核心觀念**：Stack Frame 結構、Return Address 覆寫、Shellcode 注入機制、pwntools 腳本撰寫。
- **研讀清單**：Smashing The Stack For Fun And Profit (Aleph One - Phrack 49)。
- **實戰任務 (Lab)**：
  - 在無保護環境下成功劫持 EIP/RIP 導向自定義 Shellcode。
  - 利用 ret2text 跳轉至程式內建之隱藏後門函式。

#### Week 14: 現代記憶體防禦機制與繞過技術 (ASLR, DEP & Canary)
- **核心觀念**：Stack Canary、Data Execution Prevention (NX/DEP)、Address Space Layout Randomization (ASLR)、PIE (Position Independent Executable)。
- **研讀清單**：Bypassing Non-Executable-Stack Defenses (Solar Designer)。
- **實戰任務 (Lab)**：
  - Canary 洩漏 (Memory Leak) 技巧。
  - 基礎 Return-Oriented Programming (ROP) 構造 gadget 鏈呼叫 `system("/bin/sh")`。

#### Week 15: 進階 ROP 與 ret2libc 實戰
- **核心觀念**：動態連結程式庫 (libc) 基底地址洩漏、GOT (Global Offset Table) 與 PLT (Procedure Linkage Table) 原理、GOT Overwrite 攻擊。
- **研讀清單**：How PLT/GOT Works in ELF (Akash Trehan)。
- **實戰任務 (Lab)**：
  - ret2libc 兩階段攻擊：洩漏 `puts` 實體地址推算 libc 版本，二次觸發 `system("/bin/sh")`。

---

### 模組六：綜合攻防模擬沙盒實戰 (Week 16)

#### Week 16: 專案沙盒 CTF 競賽實戰與復盤
- **核心觀念**：跨領域綜合挑戰、動態計分賽制、解題策略與即時 Writeup 復盤。
- **研讀清單**：DEF CON / HITCON CTF Writeup Review。
- **實戰任務 (Lab)**：
  - 全員參與以 `ctfd-kit` 為基礎的 3 小時沙盒奪旗模擬競賽。
  - 演練 `automation/send_final_top10.py` 賽後自動結算與寄送成績證書。
  - 每人繳交一份完整 Writeup 貢獻至 `study/weeks/`。
