Github：[SwiftfulThinking-FirebaseBootcamp](https://github.com/RainBowT0506/SwiftfulThinking-FirebaseBootcamp)
# Connect Firebase to Xcode: A Step-by-Step Tutorial
## Firebase 介紹與用途
- Firebase 是 Google 提供的一個強大 SDK，包含多種子 SDK
- 常用作為應用程式的後端服務
- 不僅提供資料庫功能，還包括分析、Crashlytics、A/B 測試等多種工具
- 跨平台支援，包括 iOS、Android 和 Web 應用

## Firebase 相較於其他服務的優勢
- 與 Apple 提供的 Core Data 和 CloudKit 不同，Firebase 支援跨平台
- Firebase 方便進行應用程式的擴展和可伸縮性管理
- 提供免費方案，適合開發和測試使用，亦有按使用量付費的方案

## 建立與連接 Firebase 專案
### 設置 Xcode 專案
- 使用 Xcode 14.2 建立一個新專案
- 設定專案名稱、組織標識符、使用 Swift UI 介面和 Swift 語言

### 設置 Firebase 專案
![CleanShot 2024-07-18 at 11.23.41](https://hackmd.io/_uploads/r1O05bIdR.png)

- 登錄 Firebase 網站並創建新專案
![CleanShot 2024-07-18 at 11.24.29](https://hackmd.io/_uploads/BkuWi-IuR.png)
![CleanShot 2024-07-18 at 11.25.31](https://hackmd.io/_uploads/rysNoW8OA.png)

- 將 Firebase 專案名稱設定為 "Swiftful Firebase Bootcamp"
- 啟用 Google Analytics 進行應用程式分析

### 下載並添加 Firebase 設定文件
- 下載 `GoogleService-Info.plist` 文件
- 將該文件拖入 Xcode 專案中，確保名稱正確無誤
![CleanShot 2024-07-18 at 11.29.31](https://hackmd.io/_uploads/BJ3NhW8OA.png)

### 添加 Firebase SDK
- 使用 Swift Package Manager 添加 Firebase SDK
![CleanShot 2024-07-18 at 11.32.32](https://hackmd.io/_uploads/ryEl6bI_C.png)
![CleanShot 2024-07-18 at 11.34.04](https://hackmd.io/_uploads/H11rab8dR.png)

Dependency Rule

![CleanShot 2024-07-18 at 11.34.49](https://hackmd.io/_uploads/ryIKpWU_0.png)

到 Github 查看最新版本

![CleanShot 2024-07-18 at 11.37.49](https://hackmd.io/_uploads/Hy0zA-8_R.png)

選擇版本
![CleanShot 2024-07-18 at 11.38.37](https://hackmd.io/_uploads/BJTLCbI_R.png)


- 確保選擇需要的 SDK，如 Firebase Analytics
![CleanShot 2024-07-18 at 11.48.39](https://hackmd.io/_uploads/rysogGL_A.png)

- 配置 Firebase SDK，導入 Firebase 並在應用啟動時進行初始化

## Firebase 初始化設置
### 無需使用 App Delegate
- 在應用的 `init` 方法中調用 `FirebaseApp.configure()`

### 使用 App Delegate
- 創建 App Delegate 類並在 `didFinishLaunchingWithOptions` 方法中配置 Firebase
- 在主應用程式中初始化 App Delegate 並確認配置成功
![CleanShot 2024-07-18 at 12.09.50](https://hackmd.io/_uploads/rk6qBMU_C.png)


## 總結
- 成功將 Xcode 專案連接至 Firebase
- 接下來將學習 Firebase 的各項功能，從用戶驗證開始，逐步涵蓋資料庫及其他工具

---

這段整理涵蓋了視頻中的各個關鍵步驟及重點，使讀者能夠清晰了解如何設置並連接 Firebase 專案。

# iOS Firebase Authentication: Sign In With Email & Password Tutorial (1/2) 
### 介紹 Firebase 驗證

- 下載應用程式後通常會看到「登入或創建帳戶」的畫面。
- 我們將使用 Firebase SDK 的驗證框架來實現用戶登入和登出功能。
- 我們將從使用電子郵件和密碼的基本驗證開始，這樣可以手動重寫代碼，理解更深。
- 將來會介紹更複雜的驗證方法，如使用 Google、Apple 登入以及匿名登入。

### Firebase 項目設置

- 在上一個視頻中，我們設置了 Firebase 項目並將其連接到 Xcode 項目。
- 我們在 `AppDelegate` 中調用了 `FirebaseApp.configure`。
- 我們已將 Firebase Swift package 添加到 Xcode 項目中。

### 開始使用 Firebase 驗證

#### 啟用電子郵件和密碼登入
![CleanShot 2024-07-18 at 16.49.15](https://hackmd.io/_uploads/SyYQD8U_A.png)

- 進入 Firebase 控制台，選擇「Authentication」標籤。
- 啟用「Email/Password」登入，不啟用無密碼登入。
- 保存設置後，您可以在「Users」標籤中看到所有用戶。

#### 將驗證功能添加到代碼

- 在 Xcode 項目中，添加 `FirebaseAuth` 庫。
- 確保已初始化 SDK 並進行 Firebase 配置。
- 使用 `FirebaseAuth` 進行用戶註冊和登入。

### 設置登入界面

#### 創建 Authentication 視圖

- 在 Xcode 中創建一個名為 `AuthenticationView` 的新視圖。
- 在視圖中設置導航堆棧並添加一個按鈕，該按鈕用於導航到電子郵件和密碼登入界面。
- 按鈕設置包括標題、顏色、背景和圓角等屬性。

#### 創建 Sign In Email 視圖

- 創建 `SignInEmailView` 視圖，並設置導航堆棧。
- 添加兩個文本框：一個用於輸入電子郵件，另一個用於輸入密碼。
- 添加一個「登入」按鈕，按鈕設置類似於前一視圖中的按鈕。

#### 創建 ViewModel

- 創建 `SignInEmailViewModel` 類，繼承 `ObservableObject`。
- 在 `ViewModel` 中定義兩個 `@Published` 屬性：`email` 和 `password`。

#### 連接視圖與 ViewModel

- 在 `SignInEmailView` 中初始化 ViewModel，並將文本框與 ViewModel 的屬性綁定。
- 在 `AuthenticationView` 中設置導航鏈接，使其指向 `SignInEmailView`。
 
### 建立 Authentication Manager

#### 創建 Authentication Manager 類

- 為了將所有與 Authentication SDK 相關的代碼分離，我們將創建一個獨立的類。
- 新建一個 Swift 文件，命名為 `AuthenticationManager`。
- 使用 `final class` 關鍵字，表示該類不會被繼承，有助於性能提升。

#### 實現單例模式

- 使用單例模式來創建唯一的 `AuthenticationManager` 實例。
- 創建一個 `static let shared` 變量並初始化 `AuthenticationManager`。
- 將初始化函數設為私有，確保該類只有一個實例。

#### 引入 Firebase 驗證庫

- 在文件頂部引入 `FirebaseAuth`。
- 使用 `async` 和 `await` 關鍵字來實現異步函數。

#### 創建 AuthDataResultModel

- 為了將 Firebase 返回的用戶數據進行封裝，我們創建一個數據模型。

### 修改 SignInEmailViewModel

#### 添加簽名函數

- 在 `SignInEmailViewModel` 中創建 `signIn` 函數，並檢查電子郵件和密碼是否有效。

### 更新 SignInEmailView

- 在 `SignInEmailView` 中綁定 ViewModel 並調用 `signIn` 函數。

### 測試與驗證

- 將 `AuthenticationView` 設為應用的第一個視圖。
- 在 `AuthenticationView` 中設置導航鏈接，指向 `SignInEmailView`。
- 運行應用並測試用戶創建功能。

這樣，我們就完成了用電子郵件和密碼進行用戶驗證的基本設置。接下來，我們可以進行更多驗證方法的實現，如 Google、Apple 登入以及匿名登入。

### 驗證用戶並更新 UI

#### 查看 Firebase 控制台中的用戶

- 重新載入驗證控制台，你會看到新創建的用戶。
- 可以查看用戶的登入方式、用戶 ID 等詳細信息。
- Firebase 控制台提供了重設密碼、禁用帳戶、刪除帳戶等功能。

#### 創建 Root View

- 創建一個新的 RootView 作為應用的第一個視圖。
- 在 RootView 中設置導航堆棧和初始狀態變量 `showSignInView`。

#### 驗證當前用戶

- 在 `AuthenticationManager` 中創建 `getAuthenticatedUser` 函數，用於檢查本地已認證用戶。

#### 創建 Settings View

- 創建 `SettingsView`，添加登出按鈕和相應的登出邏輯。

#### 在應用啟動時檢查驗證狀態

- 在 `RootView` 的 `onAppear` 方法中檢查用戶的驗證狀態，決定是否顯示登入界面。

### 測試應用

- 運行應用，檢查登入、登出功能是否正常。
- 在 Firebase 控制台中查看用戶詳細信息，確保用戶的唯一性和驗證狀態。 


# iOS Firebase Authentication: Sign In With Email & Password Tutorial (2/2)
### 簽名和忘記密碼功能

#### 簽名功能

- 更新現有的 `signIn` 方法，處理用戶已經存在的情況。
- 如果註冊失敗，嘗試使用 `signIn` 方法進行登入。

#### 添加忘記密碼功能
- 在 `AuthenticationManager` 中創建 `resetPassword` 方法。
- 在 `SignInEmailViewModel` 中添加 `resetPassword` 方法。
- 更新 `SignInEmailView`，添加忘記密碼按鈕。

#### 更新 RootView
- 在 `RootView` 中管理登錄狀態，確保顯示正確的視圖。

### 測試和驗證

- 運行應用並測試註冊、登入、忘記密碼功能。
- 檢查 Firebase 控制台中的用戶信息，確保用戶唯一性和驗證狀態。 

### 進一步的電子郵件和密碼功能

#### 添加重置密碼功能

- 在 `AuthenticationManager` 中創建 `resetPassword` 方法。
- 在 `SettingsViewModel` 中添加 `resetPassword` 方法。
- 更新 `SettingsView`，添加重置密碼按鈕。

#### 更新電子郵件和密碼功能
![CleanShot 2024-07-18 at 18.22.46](https://hackmd.io/_uploads/rJvBpwUu0.png)
- 在 `AuthenticationManager` 中創建 `updateEmail` 和 `updatePassword` 方法。


- 在 `SettingsViewModel` 中添加對應的方法。

```swift
final class SettingsViewModel: ObservableObject {
    func updateEmail() async throws {
        try await AuthenticationManager.shared.updateEmail(newEmail: "newemail@example.com")
    }

    func updatePassword() async throws {
        try await AuthenticationManager.shared.updatePassword(newPassword: "newpassword")
    }
}
```

#### 設置完成後的測試

- 確保所有功能正常運行，包括登入、登出、重置密碼、更新電子郵件和密碼。

### 測試
- 運行應用並測試所有功能，包括登入、登出、重置密碼、更新電子郵件和密碼。
- 在 Firebase 控制台中檢查用戶信息，確保用戶唯一性和驗證狀態。

### 優化和整理代碼

- 將設置視圖中的按鈕提取到單獨的函數中，以保持代碼清晰。
- 添加錯誤處理和用戶反饋。

這樣，我們就完成了電子郵件和密碼相關的所有基本功能，包括註冊、登入、登出、重置密碼和更新電子郵件。接下來，我們可以實現其他驗證方法，如使用 Google 和 Apple 進行登入。

# iOS Firebase Authentication: Sign In With Google Tutorial 
### 簡介

- 已經完成了使用電子郵件和密碼的登錄功能，現在要實現更複雜的登錄方式——使用 Google 登錄。
- 使用 Google 登錄是非常普遍且方便的。
- 需要額外添加 Google SDK 並將其與 Firebase SDK 連接。

### 準備工作

- 我們需要添加 Google SDK 到專案中，並學習如何連接 Google SDK 與 Firebase SDK。

### Firebase 設定

- 打開 Firebase 控制台，進入「Sign-in method」頁面。
- 啟用 Google 登錄，設定公開名稱和支援電子郵件。

### 添加 Google SDK
[google GoogleSignIn-iOS](https://github.com/google/GoogleSignIn-iOS)
- 由於使用的是 Swift Package Manager，而不是 pod，所以需要找到 Google Sign-in SDK 的 GitHub 倉庫。
- 將 Google Sign-in SDK 添加到專案中。

### 設定 URL Scheme

- 打開 Xcode 專案，進入目標設置，添加 URL Types。
![CleanShot 2024-07-18 at 22.10.42](https://hackmd.io/_uploads/BJbufoIOR.png)

- 使用 GoogleService-Info.plist 中的 Reversed client ID 作為 URL Scheme。
![CleanShot 2024-07-18 at 22.09.57](https://hackmd.io/_uploads/SksrGiI_0.png)

### App Delegate 設置

- 配置 Firebase，添加處理 URL 的方法。
- 使用 Swift concurrency 簡化代碼，不使用傳統的處理方法。

### Google 登錄流程

- 獲取客戶端 ID，創建 Google 配置，並進行登錄。
- 使用 Google SDK 的認證結果進行 Firebase 登錄。

### UI 設置

- 使用 Google 提供的登錄按鈕，設置按鈕樣式和動作。
- 在視圖中添加 Google 登錄按鈕。

### ViewModel 設置

- 創建一個 AuthenticationViewModel 並在視圖中初始化。
- 實現 Google 登錄功能。

### 獲取頂層視圖控制器

- 創建 Utilities 類來獲取頂層視圖控制器。
- 在 Swift concurrency 中使用頂層視圖控制器進行 Google 登錄。

### 實現代碼

- 在 Utilities 類中實現獲取頂層視圖控制器的方法。
- 在 AuthenticationViewModel 中使用這個方法進行 Google 登錄。

### 總結

- 連接 Google SDK 和 Firebase SDK 需要一些額外的設置和代碼。
- 使用 Swift concurrency 和 Utilities 類來簡化代碼。
- 使用 Google 提供的登錄按鈕來符合設計規範。
### 簡介

- 獲得 `GIDSignInResult` 物件，包含使用者和伺服器授權碼。
- 從 `GIDSignInResult` 中取得使用者的認證和 ID Token，並用於 Firebase 登錄。

### 獲取 ID Token 和 Access Token

- 取得 `ID Token`：
  - `let idToken = gidSignInResult.user.idToken?.tokenString`
  - 驗證 ID Token 並解開選項值。
- 取得 `Access Token`：
  - `let accessToken = gidSignInResult.user.accessToken.tokenString`
  - 驗證 Access Token 並確保其為字串。

### 認證 Firebase

- 將 ID Token 和 Access Token 轉換為 Firebase 認證。
- 建立 Firebase 認證並嘗試登錄。

### 修改 Firebase 管理員

- 在 `AuthenticationManager` 中添加新函數 `signInWithGoogle` 和 `signInWithCredential`。
- 分離 SSO 和 Email 函數，使代碼更整潔。
- 保持 Firebase 認證邏輯集中於 `AuthenticationManager`。

### Google 登錄按鈕

- 在視圖中添加 Google 登錄按鈕，設置按鈕樣式和動作。
- 使用 Swift concurrency 簡化代碼。

### 錯誤處理與調試

- 確保 `GID Client ID` 設置於 `info.plist` 中。
```
Thread 1: "No active configuration.  Make sure GIDClientID is set in Info.plist."
```
![CleanShot 2024-07-19 at 09.43.49](https://hackmd.io/_uploads/HJNxBrwdC.png)
![CleanShot 2024-07-19 at 09.45.17](https://hackmd.io/_uploads/HJ0NrBvOC.png)

- 進行錯誤處理，並在遇到錯誤時提供適當的錯誤訊息。
- 測試應用程序，確保 Google 登錄流程正常運行。
![CleanShot 2024-07-19 at 09.54.37](https://hackmd.io/_uploads/Bk8uDHvdC.png)

### 重構代碼

- 分離 Google 登錄邏輯到單獨的類別，增強代碼可重用性和可維護性。
- 優化代碼結構，保持代碼清晰易讀。

### 簡介

- 提取 Google 登錄邏輯，封裝到獨立的幫助類中
- 確保代碼可重用性和易維護性，增強應用結構的整潔性

### 創建 SignInGoogleHelper 類

- 新建文件，命名為 SignInGoogleHelper
- 創建類，封裝 Google 登錄邏輯
- 確保登錄邏輯在主線程上執行

### 更新 AuthenticationViewModel

- 導入 SignInGoogleHelper 類
- 更新 signInWithGoogle 方法，調用 SignInGoogleHelper 類的方法
- 測試應用程序，確保 Google 登錄功能正常運行

### 獲取用戶資訊

- 獲取用戶姓名和電子郵件，顯示在應用中
- 更新 GoogleSignInResultModel，包含姓名和電子郵件欄位
- 在 SignInGoogleHelper 類中更新 signIn 方法，獲取姓名和電子郵件

### 更新 UI

- 根據用戶的登錄方式顯示或隱藏特定功能
- 在 AuthenticationManager 中添加 getProviders 方法
- 在 SettingsView 中根據登錄方式顯示或隱藏功能

### 總結

- 將 Google 登錄邏輯提取到獨立幫助類中，確保代碼可重用性
- 更新視圖模型以使用新的幫助類
- 添加用戶資訊顯示，優化用戶體驗
- 根據登錄方式顯示或隱藏特定功能，提升應用靈活性

# iOS Firebase Authentication: Sign In With Apple Tutorial 
### 簡介

- Apple 要求所有 iOS 應用程式如果支持其他登入方法，必須也包含 Apple 登入。
- Apple 登入允許用戶使用其 iCloud 帳戶登錄，大多數 iPhone 用戶都擁有 iCloud 帳戶。
- 在 SwiftUI 中，雖然有 Apple 提供的登錄按鈕，但它目前不兼容 Firebase 認證，需要額外編寫一些代碼。

### 設置 Firebase 和 Apple 開發者帳戶

- 在 Firebase 控制台中啟用 Apple 登錄提供者。
- 在 Apple 開發者帳戶中設置簽名憑證和標識符。
- 在 Xcode 專案中啟用 Apple 登錄功能，並確保使用的團隊擁有開發者權限。
![CleanShot 2024-07-19 at 15.36.33](https://hackmd.io/_uploads/SJR3P5vdA.png)

只使用個人開發者帳戶支持的功能。如果有高級功能，如“Sign in with Apple”，需要移除它們。
使用None作為Team設置是不行的，因為這會導致簽名失敗。需要選擇一個有效的開發者帳戶來進行應用的簽名和部署。
![CleanShot 2024-07-19 at 15.42.56](https://hackmd.io/_uploads/BJ2WFqP_0.png)

將 BUNDLE_ID 新增應用程式
![CleanShot 2024-07-19 at 16.04.11](https://hackmd.io/_uploads/S1rzRcv_C.png)
![CleanShot 2024-07-19 at 16.05.30](https://hackmd.io/_uploads/Sk9v0cvuC.png)

但是我是使用個人開發者帳戶，所以我的 BUNDLE_ID 沒有改變
![CleanShot 2024-07-19 at 16.07.03](https://hackmd.io/_uploads/HJ0n09DuR.png)

![CleanShot 2024-07-19 at 16.06.41](https://hackmd.io/_uploads/HyuoC5wdC.png)

手動將AuthenticationServices框架新增至專案
* 選擇你的專案文件。
* 在「Targets」清單中選擇你的應用程式目標。
* 轉到“General”選項卡。
* 在「Frameworks, Libraries, and Embedded Content」部分，點選加號（+）按鈕。
* 搜尋並新增AuthenticationServices框架。
![CleanShot 2024-07-19 at 16.18.05](https://hackmd.io/_uploads/BkCS-sPOC.png)

出現錯誤 
```
請稍後再試。 Failed to load Info.plist from bundle at path /Users/user/Library/Developer/CoreSimulator/Devices/3A1FBA10-0402-4CA7-BC29-8FB0BB3E9C0D/data/Library/Caches/com.apple.mobile.installd.staging/temp.mSzdpa/extracted/Payload/SwiftfulThinking-FirebaseBootcamp.app/Frameworks/AuthenticationServices.framework; Extra info about "/Users/user/Library/Developer/CoreSimulator/Devices/3A1FBA10-0402-4CA7-BC29-8FB0BB3E9C0D/data/Library/Caches/com.apple.mobile.installd.staging/temp.mSzdpa/extracted/Payload/SwiftfulThinking-FirebaseBootcamp.app/Frameworks/AuthenticationServices.framework/Info.plist": Couldn't stat /Users/user/Library/Developer/CoreSimulator/Devices/3A1FBA10-0402-4CA7-BC29-8FB0BB3E9C0D/data/Library/Caches/com.apple.mobile.installd.staging/temp.mSzdpa/extracted/Payload/SwiftfulThinking-FirebaseBootcamp.app/Frameworks/AuthenticationServices.framework/Info.plist: No such file or directory
```

Team 選擇個人帳戶就沒有 Sign in with Apple
None 才有 Sign in with Apple
![CleanShot 2024-07-19 at 16.54.45](https://hackmd.io/_uploads/rJnbciwuA.png)


### 添加 SignInWithApple 按鈕

- 使用 `ASAuthorizationAppleIDButton` 添加 Apple 登錄按鈕。
- 根據 Apple 的人機界面指南設置按鈕的外觀和行為。
- 由於 SwiftUI 的 `SignInWithAppleButton` 目前無法直接用於 Firebase 認證，需要將 UIKit 的按鈕轉換為 SwiftUI 使用。

### 創建 SignInWithAppleButton 視圖

- 使用 `UIViewRepresentable` 將 `ASAuthorizationAppleIDButton` 轉換為 SwiftUI 視圖。
- 設置按鈕的類型和樣式，以符合應用的設計需求。
- 將按鈕設置為不可點擊，並添加一個 SwiftUI 按鈕來處理點擊事件。

### 處理 Apple 登錄邏輯

- 當用戶點擊按鈕時，調用 `viewModel.signInWithApple()` 方法處理登錄邏輯。
- 使用 Apple 的 `ASAuthorizationController` 進行身份驗證。
- 獲取用戶的認證信息並將其轉換為 Firebase 認證。

### 重點

- 確保應用設計符合 Apple 的要求，避免應用被拒絕上架。
- 將登錄邏輯封裝在 ViewModel 中，以保持代碼清晰和可重用。
- 測試應用程序，確保登錄流程正常運行，並能正確處理用戶信息。

### 簡介

- Apple 規定所有支援其他登入方法的 iOS 應用必須包含 Apple 登入。
- 由於大多數 iPhone 用戶都有 iCloud 帳戶，Apple 登入是一種方便的登錄方式。
- 目前，Apple 的 SwiftUI 登錄按鈕不兼容 Firebase 認證，因此需要編寫額外的代碼來實現這一功能。

### 設置 Firebase 和 Apple 開發者帳戶

- 在 Firebase 控制台中啟用 Apple 登錄提供者。
- 在 Apple 開發者帳戶中設置簽名憑證和標識符。
- 在 Xcode 專案中啟用 Apple 登錄功能，並確保使用的團隊擁有開發者權限。

### 添加 SignInWithApple 按鈕

- 使用 `ASAuthorizationAppleIDButton` 添加 Apple 登錄按鈕。
- 根據 Apple 的人機界面指南設置按鈕的外觀和行為。
- 將 UIKit 的按鈕轉換為 SwiftUI 使用，以解決兼容性問題。

### 創建 SignInWithAppleButton 視圖

- 使用 `UIViewRepresentable` 將 `ASAuthorizationAppleIDButton` 轉換為 SwiftUI 視圖。
- 設置按鈕的類型和樣式，以符合應用的設計需求。
- 將按鈕設置為不可點擊，並添加一個 SwiftUI 按鈕來處理點擊事件。

### 處理 Apple 登錄邏輯

- 當用戶點擊按鈕時，調用 `viewModel.signInWithApple()` 方法處理登錄邏輯。
- 使用 Apple 的 `ASAuthorizationController` 進行身份驗證。
- 獲取用戶的認證信息並將其轉換為 Firebase 認證。

### 提取重用代碼

- 將 Apple 登錄邏輯提取到獨立的幫助類中，增強代碼的模組化和重用性。
- 在新的幫助類中處理所有的 Apple 登錄相關邏輯，包括隨機 Nons 生成和 SHA 256 哈希計算。

### 重點

- 確保應用設計符合 Apple 的要求，避免應用被拒絕上架。
- 將登錄邏輯封裝在 ViewModel 中，以保持代碼清晰和可重用。
- 測試應用程序，確保登錄流程正常運行，並能正確處理用戶信息。

按下 Apple 登入出現錯誤
```
Authorization failed: Error Domain=AKAuthenticationError Code=-7026 "(null)" UserInfo={AKClientBundleID=com.rainbowt.SwiftfulThinking-FirebaseBootcamp}
ASAuthorizationController credential request failed with error: Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1000 "(null)"
Sign in with Apple errored: Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1000 "(null)"
```

於是改了 Team 並加了 Sign in with Apple，
雖然成功實現了 Apple 登入，但還是有出現錯誤。
![CleanShot 2024-07-20 at 01.09.31](https://hackmd.io/_uploads/SyW-CGO_A.png)


![CleanShot 2024-07-20 at 01.07.23](https://hackmd.io/_uploads/BkHiaf_OC.png)


### 簡介

- 我們要將 Apple 登錄邏輯提取到獨立的幫助類中，與 Google 登錄幫助類相似，這樣可以提高代碼的模組化和重用性。
- 為此，我們將創建一個新的文件 `SignInWithAppleHelper`，並將相關的邏輯移動到該文件中。

### 創建 SignInWithAppleHelper 類

- 創建新文件 `SignInWithAppleHelper`，並將 SignInWithAppleResult 和 SignInWithAppleButton 視圖移動到該文件中。
- 在該文件中導入 `AuthenticationServices`、`CryptoKit` 和 `SwiftUI`。

### 移動隨機 Nons 和 SHA 函數

- 將生成隨機 Nons 和 SHA 哈希值的函數移動到 `SignInWithAppleHelper` 類中，確保其在新的類中正確運行。

### 設置 Delegate 方法

- 將處理 Apple 登錄的 Delegate 方法移動到 `SignInWithAppleHelper` 類中，並使該類符合 `ASAuthorizationControllerDelegate` 和 `ASAuthorizationControllerPresentationContextProviding` 協議。
- 確保新類中有 `currentNons` 和 `completionHandler` 變量，以便在不同方法之間共享數據。

### 添加 Completion Handler

- 在 `SignInWithAppleHelper` 類中添加一個 `completionHandler`，用於在登錄流程完成後通知調用方。
- 在 `startSignInWithAppleFlow` 方法中設置 `completionHandler`，並在適當的地方調用它來返回結果或錯誤。

### 更新 AuthenticationViewModel

- 更新 `AuthenticationViewModel`，調用 `SignInWithAppleHelper` 類的 `startSignInWithAppleFlow` 方法，並處理返回的結果。
- 使用 `Swift Concurrency`，將帶有 `completionHandler` 的方法轉換為使用 `async/await`。

### 處理返回的結果

- 在 `AuthenticationViewModel` 中，根據 `SignInWithAppleHelper` 返回的結果進行相應的處理。
- 將成功登錄後的處理邏輯放入 `do-catch` 塊中，確保代碼的健壯性。

### 測試和驗證

- 測試應用程序，確保 Apple 登錄流程正常運行。
- 驗證用戶是否成功登錄並正確返回用戶信息。

# 
 
# 問題
## Google
實作 Google 登入時出現錯誤
```
Thread 1: "You must specify |clientID| in |GIDConfiguration|"
```
Rebuild 完就好了，如果還是有問題可以看 info 是否沒設定
![CleanShot 2024-07-19 at 09.43.49](https://hackmd.io/_uploads/HJNxBrwdC.png)
![CleanShot 2024-07-19 at 09.45.17](https://hackmd.io/_uploads/HJ0NrBvOC.png)

## Apple
### -7003 & 1001
```
Authorization failed: Error Domain=AKAuthenticationError Code=-7003 "(null)" UserInfo={AKClientBundleID=com.rainbowt.SwiftfulThinking-FirebaseBootcamp}
ASAuthorizationController credential request failed with error: Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1001 "(null)"
Sign in with Apple errored: Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1001 "(null)"
Error Domain=NSURLErrorDomain Code=-1003 "(null)"
```
---
您在 iOS 應用程式中遇到的登入錯誤可能有多種原因。以下是幾個常見的錯誤訊息及其可能的解決方法：

1. **Error Domain=AKAuthenticationError Code=-7003**
   - 此錯誤通常與應用程式的 Bundle ID 有關。請確認您在 Apple 開發者平台上註冊的應用程式 Bundle ID 與您專案中的設定一致。
   - 檢查您的 Apple ID 是否已登入 Xcode，並確保您的簽署憑證和設定檔都正確。

2. **Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1001**
   - 這個錯誤表示認證服務授權失敗。請確保您已在 Apple 開發者平台上為應用程式啟用「Sign in with Apple」功能。
   - 檢查您的網路連線，確保設備能夠連上 Apple 的認證服務。

3. **Error Domain=NSURLErrorDomain Code=-1003**
   - 這個錯誤表示無法連接到指定的伺服器。請檢查您的網路連線，並確保設備可以連接到互聯網。
   - 確認您的應用程式中所使用的 URL 是否正確無誤。

#### 解決步驟

1. **檢查 Bundle ID**
   - 開啟 Xcode，選擇您的專案目標（Target），在 General 標籤下確認 Bundle Identifier 是否正確。
   - 登入 [Apple 開發者平台](https://developer.apple.com/account/)，檢查您的應用程式 ID 是否與專案中的設定一致。

2. **啟用「Sign in with Apple」**
   - 在 Apple 開發者平台上，導航到「Certificates, Identifiers & Profiles」部分，找到您的應用程式 ID，並確認已啟用「Sign in with Apple」功能。

3. **網路檢查**
   - 確認您的設備連接到穩定的網路。
   - 在模擬器或真機上測試您的應用程式，確保其能夠正常訪問互聯網。

4. **調試與日誌**
   - 在 Xcode 中使用斷點和日誌輸出來調試您的應用程式，找出具體錯誤發生的位置。
   - 使用 `print` 語句來輸出更多的錯誤訊息和變數值，幫助您定位問題。

如果以上方法仍然無法解決您的問題，建議您查看 [Apple 開發者論壇](https://developer.apple.com/forums/) 或相關的技術文件，尋求更多幫助。
### -7026 & 1000 & -1003
```
Authorization failed: Error Domain=AKAuthenticationError Code=-7026 "(null)" UserInfo={AKClientBundleID=com.rainbowt.SwiftfulThinking-FirebaseBootcamp}
ASAuthorizationController credential request failed with error: Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1000 "(null)"
Sign in with Apple errored: Error Domain=com.apple.AuthenticationServices.AuthorizationError Code=1000 "(null)"
Error Domain=NSURLErrorDomain Code=-1003 "(null)"
```

---
在 iOS 開發中，遇到 Apple 登入錯誤碼的情況可能會讓人感到困惑。以下是針對您提供的錯誤碼的一些可能解決方法，繁體中文說明：

#### 1. 確認 Apple 登入設定

首先，請確保您在 Apple 開發者後台（Apple Developer Console）中已正確設定了 Apple 登入。檢查以下內容：

- 確認您的 App ID 已啟用了 "Sign In with Apple" 功能。
- 在 App ID 中新增合適的回調 URL。
- 檢查您的 App Bundle ID 與 Apple Developer Console 上設定的是否一致。

#### 2. 檢查證書和配置檔

確認您在 Xcode 中使用的開發和發佈證書都是最新的，並且已正確配置。具體步驟：

- 開啟 Xcode，選擇您的專案。
- 點選 "Signing & Capabilities" 頁籤。
- 確認 "Team" 選項已選擇了正確的 Apple Developer 帳號。
- 確認您的 provisioning profiles 和 certificates 都是最新且有效的。

#### 3. 處理特定錯誤碼

#### Error Code: -7026
這通常與身份驗證相關的問題有關。可能是您的應用程序設置有問題或是 Apple 的服務臨時性問題。您可以：

- 確認您的應用是否有正確配置 Apple 登入。
- 確認您的 Apple Developer 帳號和密鑰是否正確。
- 嘗試重新生成或更新您的密鑰。

#### Error Code: 1000
這表示 Apple 身份驗證服務的授權錯誤。解決方法包括：

- 檢查網絡連接是否正常。
- 確認 Apple 登入的設定是否正確。
- 如果問題持續，可能是 Apple 的服務臨時性問題，可以稍後再試。

#### Error Code: -1003
這表示無法連接到伺服器，可能的原因包括：

- 確認設備是否連接到互聯網。
- 確認您的伺服器 URL 是否正確。
- 檢查您的網絡設置或防火牆配置是否阻擋了連接。

#### 4. 調試與日誌

如果上述方法無法解決問題，建議在您的應用中添加更多的日誌記錄，以便更好地了解問題的具體原因。您可以使用以下方法：

- 使用 Xcode 的 Console 來查看詳細的錯誤訊息。
- 在相關的錯誤處理代碼中添加更多的日誌輸出，幫助您了解問題的發生情況。

#### 結論

Apple 登入錯誤可能由多種原因引起，建議您逐步檢查設定和配置，並嘗試上述方法解決問題。如果問題依然存在，可以考慮向 Apple 開發者支持請求幫助。

---
# 關鍵字 
- **Firebase**：Google提供的一個後端服務SDK集合，包含多種工具和功能。
- **SDK（Software Development Kit）**：軟體開發工具包，提供了構建應用程序所需的工具和資源。
- **Expo**：一個開放源碼平台，旨在幫助開發者使用React Native更快地構建應用程序。
- **Xcode**：Apple提供的開發環境，用於開發iOS、macOS、watchOS和tvOS應用。
- **Swift Package Manager**：Apple提供的依賴管理工具，方便在Swift項目中添加和管理第三方庫。
- **Authentication**：用於處理用戶登錄和身份驗證的功能。
- **Firestore**：Firebase提供的一個可擴展的雲端數據庫。
- **Crashlytics**：Firebase的一部分，用於監測應用崩潰並收集相關數據。
- **Performance Monitoring**：監測應用性能的工具，幫助開發者優化應用性能。
- **Analytics**：分析工具，用於收集和分析應用使用數據。
- **Remote Config**：允許開發者在不需要發布新版本的情況下，動態更改應用配置。
- **A/B Testing**：一種測試方法，通過比較不同變量的效果來優化應用。
- **Cloud Messaging**：用於發送推送通知的服務。
- **App Delegate**：在iOS開發中，一個處理應用生命周期事件的對象。 
- **Authentication（身份驗證）**：讓用戶登入和登出應用程式的一個平台。
- **Email and Password Sign-In（郵箱和密碼登入）**：用戶通過郵箱和密碼創建帳號並登入應用。
- **Google SDK**：Google 提供的一組開發工具，用於實現各種功能，如身份驗證。
- **Firebase Authentication**：Firebase 提供的身份驗證框架，用於管理用戶登入和登出的功能。
- **Secure Field**：一種用於輸入密碼的安全文本字段。
- **Async/Await**：Swift 中的異步編程語法，用於處理非同步操作。
- **Guard Let**：Swift 中的一種語法，用於確保某個可選值不為空。
- **Firebase SDK**：Firebase 提供的軟體開發工具包，包含多種功能模塊，如身份驗證、數據庫等。
- **Singleton（單例）**：一種設計模式，保證一個類在應用中只有一個實例。
- **Main Actor**：Swift 中的一種並發模式，保證在主線程上執行操作。
- **URL Error**：用於表示 URL 相關錯誤的錯誤類型。
- **Auth Data Result Model**：自定義的數據模型，用於封裝 Firebase 身份驗證返回的用戶數據。 
- **Authentication（身份驗證）**：讓用戶登入和登出應用程式的一個平台。
- **Email and Password Sign-In（郵箱和密碼登入）**：用戶通過郵箱和密碼創建帳號並登入應用。
- **Google SDK**：Google 提供的一組開發工具，用於實現各種功能，如身份驗證。
- **Firebase Authentication**：Firebase 提供的身份驗證框架，用於管理用戶登入和登出的功能。
- **Secure Field**：一種用於輸入密碼的安全文本字段。
- **Async/Await**：Swift 中的異步編程語法，用於處理非同步操作。
- **Guard Let**：Swift 中的一種語法，用於確保某個可選值不為空。
- **Firebase SDK**：Firebase 提供的軟體開發工具包，包含多種功能模塊，如身份驗證、數據庫等。
- **Singleton（單例）**：一種設計模式，保證一個類在應用中只有一個實例。
- **Main Actor**：Swift 中的一種並發模式，保證在主線程上執行操作。
- **URL Error**：用於表示 URL 相關錯誤的錯誤類型。
- **Auth Data Result Model**：自定義的數據模型，用於封裝 Firebase 身份驗證返回的用戶數據。 
- **Authentication SDK**：身份驗證軟體開發套件，用於管理應用程式中的用戶登入和註冊流程。
- **ViewModel**：視圖模型，負責處理視圖的數據邏輯，使視圖與數據分離。
- **final class**：最終類，這類無法被繼承，有助於提升效能並防止不必要的繼承。
- **main actor**：主要執行緒，在 Swift 並發性中，確保特定代碼在主執行緒上運行。
- **Singleton**：單例設計模式，確保一個類在應用程式中只有一個實例。
- **Firebase**：由 Google 提供的後端即服務，用於開發高品質應用程式，包含資料庫、身份驗證等功能。
- **create user with email and password**：Firebase 認證方法，用戶透過電子郵件和密碼註冊。
- **async/await**：非同步編程方式，允許代碼在等待完成後繼續執行。
- **completion handler**：完成處理器，用於非同步操作完成時的回調。
- **throw**：拋出錯誤，指代碼執行過程中可能發生的錯誤。
- **Auth Data Result**：身份驗證數據結果，包含用戶的身份驗證信息。
- **convenience initializer**：便捷初始化方法，提供簡化的初始化方式。
- **guard**：守護語句，用於條件檢查，如果條件不滿足則退出當前作用域。
- **try/await**：嘗試執行非同步操作並等待結果，如果失敗則拋出錯誤。
- **do/catch**：用於處理可能拋出錯誤的代碼塊，捕獲並處理錯誤。
- **task**：任務，在 Swift 並發性中用於執行非同步操作。
- **UID (User ID)**：用戶標識符，唯一標識一個用戶。
- **navigation stack**：導航堆疊，用於管理視圖的導航層級。
- **build and run**：編譯並運行，指編譯程式碼並執行應用程式。
- **console**：主控台，用於顯示應用程式運行狀態和輸出資訊。
- **user ID (UID)**：用戶標識符，唯一標識每個用戶，有助於去重。
- **de-duplicate**：去重，防止創建重複的用戶帳戶。
- **reset password**：重置密碼，允許用戶重置其忘記的密碼。
- **disable account**：禁用帳戶，禁止用戶使用其帳戶。
- **delete account**：刪除帳戶，移除用戶的所有相關數據。
- **root view**：根視圖，應用程式的首個視圖。
- **navigation stack**：導航堆疊，用於管理視圖的導航層級。
- **ZStack**：Z 堆疊，SwiftUI 中用於堆疊視圖。
- **full screen cover**：全屏覆蓋，用於顯示全屏視圖。
- **State**：狀態屬性，用於追蹤 SwiftUI 中視圖的狀態變化。
- **Boolean**：布林值，表示真或假。
- **async**：非同步，用於標示非同步操作。
- **throws**：拋出錯誤，用於表示可能發生錯誤的函數。
- **optional**：可選類型，用於表示變量可能為空。
- **guard**：守護語句，用於條件檢查，如果條件不滿足則退出當前作用域。
- **URL error**：URL 錯誤，用於表示 URL 相關的錯誤。
- **try/await**：嘗試執行非同步操作並等待結果，如果失敗則拋出錯誤。
- **task**：任務，在 Swift 並發性中用於執行非同步操作。
- **sync**：同步，指操作在同一時間執行。
- **sign out**：登出，退出當前用戶帳戶。
- **throws**：拋出錯誤，用於表示可能發生錯誤的函數。
- **navigation title**：導航標題，用於設置視圖的標題。
- **Settings View**：設置視圖，顯示應用程式的設置選項。
- **ObservableObject**：可觀察對象，用於綁定數據和視圖。
- **Binding**：綁定，用於在 SwiftUI 中綁定數據和視圖。
- **constant**：常量，用於表示固定不變的值。
- **sign in**：登入，用戶通過其帳戶進入應用程式。
- **existing account**：現有帳戶，用戶已經創建的帳戶。
- **Authentication Console**：身份驗證控制台，用於管理和監控應用程式中的用戶身份驗證。
- **user ID (UID)**：用戶標識符，唯一標識每個用戶，防止重複帳戶。
- **reset password**：重置密碼，允許用戶重設其忘記的密碼。
- **dismiss view**：關閉視圖，從屏幕上移除當前顯示的視圖。
- **binding**：綁定，在 SwiftUI 中用於綁定數據和視圖，以實現雙向數據流。
- **State**：狀態屬性，用於追蹤 SwiftUI 中視圖的狀態變化。
- **asynchronous (async)**：非同步，允許操作在等待完成後繼續執行。
- **throws**：拋出錯誤，用於表示可能發生錯誤的函數。
- **guard**：守護語句，用於條件檢查，如果條件不滿足則退出當前作用域。
- **optional**：可選類型，用於表示變量可能為空。
- **do/catch**：用於處理可能拋出錯誤的代碼塊，捕獲並處理錯誤。
- **try/await**：嘗試執行非同步操作並等待結果，如果失敗則拋出錯誤。
- **task**：任務，在 Swift 並發性中用於執行非同步操作。
- **sign out**：登出，退出當前用戶帳戶。
- **discardable result**：可丟棄的結果，允許函數返回值被忽略。
- **full screen cover**：全屏覆蓋，用於顯示全屏視圖。
- **navigation stack**：導航堆疊，用於管理視圖的導航層級。
- **Settings View**：設置視圖，顯示應用程式的設置選項。
- **ObservableObject**：可觀察對象，用於綁定數據和視圖。
- **sign in**：登入，用戶通過其帳戶進入應用程式。
- **existing account**：現有帳戶，用戶已經創建的帳戶。
- **sign in**：登入，通過用戶的電子郵件和密碼進入應用程式。
- **sign out**：登出，退出當前用戶帳戶。
- **log out**：登出，用戶退出當前會話。
- **reset password**：重置密碼，允許用戶重設其忘記的密碼。
- **email verification**：電子郵件驗證，通過發送驗證郵件確保用戶的電子郵件地址有效。
- **update email**：更新電子郵件，允許用戶更改其電子郵件地址。
- **update password**：更新密碼，用戶在應用程式中更改其密碼。
- **async/await**：非同步編程方式，允許代碼在等待完成後繼續執行。
- **throws**：拋出錯誤，用於表示可能發生錯誤的函數。
- **binding**：綁定，在 SwiftUI 中用於綁定數據和視圖，以實現雙向數據流。
- **State**：狀態屬性，用於追蹤 SwiftUI 中視圖的狀態變化。
- **ObservableObject**：可觀察對象，用於綁定數據和視圖。
- **guard**：守護語句，用於條件檢查，如果條件不滿足則退出當前作用域。
- **optional**：可選類型，用於表示變量可能為空。
- **do/catch**：用於處理可能拋出錯誤的代碼塊，捕獲並處理錯誤。
- **try/await**：嘗試執行非同步操作並等待結果，如果失敗則拋出錯誤。
- **task**：任務，在 Swift 並發性中用於執行非同步操作。
- **discardable result**：可丟棄的結果，允許函數返回值被忽略。
- **full screen cover**：全屏覆蓋，用於顯示全屏視圖。
- **navigation stack**：導航堆疊，用於管理視圖的導航層級。
- **section**：部分，SwiftUI 中用於將視圖組織在一起的區域。
- **Settings View**：設置視圖，顯示應用程式的設置選項。
- **sign in**：登入，通過用戶的電子郵件和密碼進入應用程式。
- **sign out**：登出，退出當前用戶帳戶。
- **log out**：登出，用戶退出當前會話。
- **reset password**：重置密碼，允許用戶重設其忘記的密碼。
- **update email**：更新電子郵件，允許用戶更改其電子郵件地址。
- **update password**：更新密碼，用戶在應用程式中更改其密碼。
- **Google sign-in SDK**：Google 登入軟體開發套件，用於實現 Google 登入功能。
- **Firebase SDK**：Firebase 軟體開發套件，用於身份驗證、數據存儲等。
- **client ID**：客戶端標識符，用於識別應用程式。
- **URL scheme**：URL 模式，用於啟動應用程式並傳遞數據。
- **App Delegate**：應用程式委託，負責處理應用程式的生命週期事件。
- **async/await**：非同步編程方式，允許代碼在等待完成後繼續執行。
- **ObservableObject**：可觀察對象，用於綁定數據和視圖。
- **State**：狀態屬性，用於追蹤 SwiftUI 中視圖的狀態變化。
- **binding**：綁定，在 SwiftUI 中用於綁定數據和視圖，以實現雙向數據流。
- **Google Sign-In button**：Google 登入按鈕，用於啟動 Google 登入流程。
- **navigation controller**：導航控制器，用於管理應用程式中的視圖導航。
- **main thread**：主執行緒，負責處理應用程式的 UI 更新。
- **UIViewController**：UI 視圖控制器，用於管理 iOS 應用程式的視圖。
- **sign in**：登入，通過用戶的電子郵件和密碼進入應用程式。
- **sign out**：登出，退出當前用戶帳戶。
- **log out**：登出，用戶退出當前會話。
- **reset password**：重置密碼，允許用戶重設其忘記的密碼。
- **update email**：更新電子郵件，允許用戶更改其電子郵件地址。
- **update password**：更新密碼，用戶在應用程式中更改其密碼。
- **Google sign-in SDK**：Google 登入軟體開發套件，用於實現 Google 登入功能。
- **Firebase SDK**：Firebase 軟體開發套件，用於身份驗證、數據存儲等。
- **client ID**：客戶端標識符，用於識別應用程式。
- **URL scheme**：URL 模式，用於啟動應用程式並傳遞數據。
- **App Delegate**：應用程式委託，負責處理應用程式的生命週期事件。
- **async/await**：非同步編程方式，允許代碼在等待完成後繼續執行。
- **ObservableObject**：可觀察對象，用於綁定數據和視圖。
- **State**：狀態屬性，用於追蹤 SwiftUI 中視圖的狀態變化。
- **binding**：綁定，在 SwiftUI 中用於綁定數據和視圖，以實現雙向數據流。
- **Google Sign-In button**：Google 登入按鈕，用於啟動 Google 登入流程。
- **navigation controller**：導航控制器，用於管理應用程式中的視圖導航。
- **main thread**：主執行緒，負責處理應用程式的 UI 更新。
- **UIViewController**：UI 視圖控制器，用於管理 iOS 應用程式的視圖。
- **GIDSignInResult**：Google 登入結果，包含用戶信息和身份驗證令牌。
- **GID signed in result**：Google 登入結果，包含用戶資訊和伺服器驗證碼。
- **GID Google user**：Google 用戶，表示通過 Google 登入的用戶資訊。
- **ID token**：身份驗證令牌，用於驗證用戶身份的字符串。
- **access token**：存取令牌，用於授權存取資源的字符串。
- **Firebase Auth**：Firebase 身份驗證，用於處理應用程式中的用戶身份驗證。
- **auth credential**：身份驗證憑證，用於與 Firebase 進行身份驗證的憑證。
- **extension**：擴展，Swift 中用於擴展現有類別或結構的功能。
- **SSO (Single Sign-On)**：單一登入，允許用戶使用一組憑證登入多個應用程式。
- **main actor**：主要執行緒，負責處理應用程式的 UI 更新。
- **discardable result**：可丟棄的結果，允許函數返回值被忽略。
- **GID client ID**：Google 客戶端標識符，用於識別應用程式。
- **info.plist**：應用程式資訊屬性列表文件，用於配置應用程式設定。
- **top view controller**：頂層視圖控制器，當前顯示的最高層次的視圖控制器。
- **sign in with Google**：使用 Google 登入，允許用戶通過 Google 帳戶登入應用程式。
- **sign in with Google**：使用 Google 登入，允許用戶通過 Google 帳戶登入應用程式。
- **GID signed in result**：Google 登入結果，包含用戶資訊和伺服器驗證碼。
- **GID Google user**：Google 用戶，表示通過 Google 登入的用戶資訊。
- **ID token**：身份驗證令牌，用於驗證用戶身份的字符串。
- **access token**：存取令牌，用於授權存取資源的字符串。
- **Firebase Auth**：Firebase 身份驗證，用於處理應用程式中的用戶身份驗證。
- **auth credential**：身份驗證憑證，用於與 Firebase 進行身份驗證的憑證。
- **Google sign-in SDK**：Google 登入軟體開發套件，用於實現 Google 登入功能。
- **info.plist**：應用程式資訊屬性列表文件，用於配置應用程式設定。
- **top view controller**：頂層視圖控制器，當前顯示的最高層次的視圖控制器。
- **extension**：擴展，Swift 中用於擴展現有類別或結構的功能。
- **SSO (Single Sign-On)**：單一登入，允許用戶使用一組憑證登入多個應用程式。
- **main actor**：主要執行緒，負責處理應用程式的 UI 更新。
- **discardable result**：可丟棄的結果，允許函數返回值被忽略。
- **URL scheme**：URL 模式，用於啟動應用程式並傳遞數據。
- **client ID**：客戶端標識符，用於識別應用程式。
- **App Delegate**：應用程式委託，負責處理應用程式的生命週期事件。
- **assertionFailure()**：是 Swift 中用來在執行時期表示程式碼中遇到了不可預期的錯誤或不應該發生的狀況，並中止程式執行，通常用於偵錯。
- **sign in with Apple**：使用 Apple 登入，允許用戶通過 Apple 帳戶登入應用程式。
- **iCloud account**：iCloud 帳戶，用於 Apple 裝置上的雲端服務。
- **Apple Developer Program**：Apple 開發者計畫，需要註冊才能獲取開發者功能和權限。
- **Firebase authentication**：Firebase 身份驗證，用於處理應用程式中的用戶身份驗證。
- **authentication services framework**：身份驗證服務框架，用於實現 Apple 的身份驗證功能。
- **nonce (NONS)**：隨機字符串，用於加密和身份驗證。
- **CryptoKit**：Apple 提供的加密工具包，用於實現加密操作。
- **delegate functions**：委託函數，用於處理身份驗證過程中的回調。
- **ASAuthorizationAppleIDButton**：Apple 提供的標準化登入按鈕，用於實現 Apple 登入功能。
- **UI view representable**：SwiftUI 中用於將 UIKit 視圖轉換為 SwiftUI 視圖的協議。
- **button type**：按鈕類型，用於設置 Apple 登入按鈕的顯示文本，如登入、註冊或繼續。
- **button style**：按鈕樣式，用於設置 Apple 登入按鈕的顏色和外觀。
- **hit testing**：點擊測試，用於檢測用戶點擊事件。
- **coordinator**：協調器，在 SwiftUI 中用於處理複雜的視圖邏輯和事件。
- **ViewModel**：MVVM 設計模式的一部分，負責處理與 View 相關的邏輯並保持應用程序狀態。
- **Nonce**：加密學中的隨機數，用於防止重播攻擊，每次請求都會生成一個新的 nonce。
- **CryptoKit**：Apple 提供的框架，用於加密和散列等加密操作。
- **SHA256**：一種安全的散列算法，用於生成數據的唯一哈希值。
- **ASAuthorizationControllerDelegate**：Apple 認證控制器的委託協議，處理認證過程中的回調。
- **guard**：Swift 中的語法，用於提前退出函數，如果某些條件不滿足則返回，通常用於錯誤處理。
- **OAuthProvider**：Firebase 提供的一種身份驗證提供者，用於處理第三方登入如 Google 或 Apple。
- **Sign in with Apple**：Apple 提供的身份驗證方式，允許用戶使用其 Apple ID 登入應用程序。
- **Delegate**：設計模式，用於將事件或行為委託給另一個對象處理。
- **PresentationAnchor**：Apple 認證控制器需要的一個協議，用於提供顯示認證 UI 的視圖控制器。
- **@Published**：Swift 中的一個屬性包裝器，將變量設置為可觀察的，當其值改變時會通知觀察者。
- **ViewModel**：MVVM 設計模式的一部分，負責處理與 View 相關的邏輯並保持應用程序狀態。
- **Nonce**：加密學中的隨機數，用於防止重播攻擊，每次請求都會生成一個新的 nonce。
- **CryptoKit**：Apple 提供的框架，用於加密和散列等加密操作。
- **SHA256**：一種安全的散列算法，用於生成數據的唯一哈希值。
- **ASAuthorizationControllerDelegate**：Apple 認證控制器的委託協議，處理認證過程中的回調。
- **guard**：Swift 中的語法，用於提前退出函數，如果某些條件不滿足則返回，通常用於錯誤處理。
- **OAuthProvider**：Firebase 提供的一種身份驗證提供者，用於處理第三方登入如 Google 或 Apple。
- **Sign in with Apple**：Apple 提供的身份驗證方式，允許用戶使用其 Apple ID 登入應用程序。
- **Delegate**：設計模式，用於將事件或行為委託給另一個對象處理。
- **PresentationAnchor**：Apple 認證控制器需要的一個協議，用於提供顯示認證 UI 的視圖控制器。
- **@Published**：Swift 中的一個屬性包裝器，將變量設置為可觀察的，當其值改變時會通知觀察者。
- **Main actor**：Swift Concurrency 中的一個特性，確保某些操作在主線程上運行，通常與 UI 更新相關。
- **NS object**：Swift 和 Objective-C 之間的橋樑，允許 Swift 類繼承並使用 Objective-C 的特性和功能。
- **UIKit**：Apple 提供的一個框架，用於構建和管理 iOS 應用程序的用戶界面。
- **SwiftUI**：Apple 提供的一個框架，用於構建 iOS 應用程序的用戶界面，使用宣告式語法。
- **Checked throwing continuation**：Swift Concurrency 的一部分，允許將基於回調的非同步代碼轉換為基於 async/await 的代碼，處理可能的錯誤。
- **Escaping closure**：在 Swift 中，一種閉包，允許在函數返回後仍然可以被調用，常用於非同步操作。
