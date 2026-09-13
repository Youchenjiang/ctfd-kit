# 每週研討導讀與 Writeup 撰寫準則 (Weekly Digest & Writeup Guidelines)

本目錄存放資安讀書會每週之主題導讀文件、共筆筆記與實戰靶場題目 Writeup。

---

## 📁 週次檔案命名慣例

每週資料請以 `week-XX.md` 命名（兩位數格式）：
- `week-01.md`: Week 01 研討筆記與題目解法
- `week-02.md`: Week 02 研討筆記與題目解法
- ...以此類推。

---

## 📑 標準每週筆記範本 (Template)

撰寫各週內容時，建議遵循以下結構（以保持團隊共筆風格統一）：

```markdown
# Week XX: [主題名稱，例如：Web 安全 — SQL Injection 與認證繞過]

- **研討日期**：YYYY-MM-DD
- **導讀主講人**：[主講人姓名/代號]
- **記錄人**：[記錄官姓名/代號]
- **關聯難度**：基礎 / 進階 / 專家

---

## 📖 核心觀念與理論研讀

### 1. 概念背景
- 漏洞原理、威脅模型與成因簡述。

### 2. 重要機制 / 防禦標準
- 例如：OWASP Cheat Sheet, RFC 規格, 現代框架防禦機制（Prepared Statements, CSP 等）。

---

## 🔬 實戰題目拆解 (Hands-on CTFd Labs)

### 題目 1: [題目名稱，例如：Login Bypass 101]
- **分類 (Category)**：Web / Reverse / Pwn / Crypto
- **難度 (Difficulty)**：Easy / Medium / Hard
- **題目環境**：本地 CTFd 題目 ID 或 Docker 容器埠號

#### 1. 偵查與原始碼分析 (Reconnaissance & Source Code Review)
- 說明觀察到的異常邏輯或脆弱點：
```python
# 脆弱程式碼片段展示
```

#### 2. 漏洞利用 (Exploitation & PoC)
- 完整的解題步驟與攻擊腳本：
```python
import requests
# PoC 腳本
```

#### 3. 取得 Flag
- 截圖或文字記錄取得之 Flag 格式：`FLAG{...}`。

#### 4. 安全修補建議 (Remediation & Defense)
- 展示修復此漏洞的標準程式碼範例。

---

## 💡 本週討論精華與延伸閱讀
- 討論過程中的 Q&A、非預期解法與坑點記錄。
- 推薦論文、國外研討會 (DEF CON, Black Hat, HITCON) 議程影片。
```
