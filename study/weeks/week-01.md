# Week 01: 讀書會啟航與 CTFd 靶場環境建置

- **主題**：資訊安全攻防思維、威脅模型建立與容器化 CTFd 靶場實作
- **核心領域**：環境建置、Docker 容器架構、動態 Flag 生命週期
- **難度等級**：入門 (Beginner)

---

## 📖 核心觀念與理論研讀

### 1. 資訊安全鐵三角 (CIA Triad)
- **機密性 (Confidentiality)**：確保資料僅有獲授權之實體能存取（例如：對稱/非對稱加密、存取控制 ACL）。
- **完整性 (Integrity)**：確保資料未被未授權窜改（例如：雜湊校驗、數位簽章、HMAC）。
- **可用性 (Availability)**：確保授權實體在需要時皆能正常存取服務（例如：高可用性、防禦 DoS/DDoS、負載平衡）。

### 2. CTFd 演練架構與外掛機制
CTFd 基於 Python Flask + SQLAlchemy 架構，並支援豐富的外掛與事件 Hook：
- **Web 核心**：提供使用者認證、題目展示、計分板（Scoreboard）與即時事件推播。
- **外掛擴充 (Plugin Architecture)**：透過在 `CTFd/plugins/` 目錄下載入自定義 Blueprint，可覆寫題目交付、Flag 驗證與計分演算法。
- **本專案外掛 `plugins/dynamic_shuffle_flag/`**：
  - 突破傳統題目靜態 Flag 容易外洩作弊之限制。
  - 在參賽者下載附件時，即時透過金鑰雜湊計算專屬 Flag，並動態 Patch 至圖片 EXIF 或二進位執行檔中。

---

## 🔬 實戰演練任務 (Hands-on CTFd Labs)

### 任務 1: Docker 容器化靶場快速啟動

#### 步驟 1: 檢驗環境依賴
確認主機已安裝 Docker 與 Docker Compose：
```bash
docker --version
docker compose version
```

#### 步驟 2: 套用本專案外掛與環境
透過本專案提供之一鍵安裝腳本將外掛與修正套用至本機 CTFd：
```bash
# 在 Linux / macOS 或 WSL 環境下執行
./install.sh
```

#### 步驟 3: 驗證服務健康度
啟動後開啟瀏覽器存取 `http://localhost:8000`，確認 CTFd 歡迎頁面正常載入，並檢查後台資料庫容器連線狀態。

---

### 任務 2: 驗證動態 Flag 置換機制

#### 測試驗證步驟
1. 進入 `plugins/dynamic_shuffle_flag/` 目錄。
2. 觀察 `__init__.py` 中之檔案置換邏輯：
   - 二進位檔案（ELF / PE / Mach-O）特定 Offset 字串動態置換。
   - 圖片檔案 EXIF UserComment 標籤寫入專屬 Flag。
3. 模擬不同參賽者 Session 發送下載請求，確認下載之二進位雜湊不同且包含個別 Flag。

---

## 💡 本週討論精華與延伸閱讀

### 關鍵研討提問：
1. **Q: 傳統靜態 CTF 題目最容易發生的作弊問題是什麼？**
   - *A: 參賽者透過社群或未授權管道直接共享 Flag 字串。本專案透過動態 Flag 置換模組，即便共享 Flag 也無法通過他人帳號的驗證。*
2. **Q: 題目二進位檔案進行動態 Patch 時，為什麼需要維持檔案長度一致？**
   - *A: 若置換字串長度不同，會破壞 PE/ELF 標頭結構中的 Section Headers 與虛擬地址映射（Virtual Address Mapping），導致執行檔 Crash。*

### 推薦閱讀：
- [CTFd Official Documentation](https://docs.ctfd.io/)
- [OWASP Security by Design Principles](https://owasp.org/www-project-developer-guide/draft/design/principles/)
- [Docker Security Best Practices](https://docs.docker.com/develop/security-best-practices/)
