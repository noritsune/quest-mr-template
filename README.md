# quest3-mr-template
Meta Quest 3でMRアプリを作るためのUnityのテンプレートプロジェクトです。

# Unityバージョン
2022.1.17f1(起動時に任意のバージョンに変更可)

# 機能
- 頭とコントローラー/手のトラッキング
- 視界全体のパススルー表示
- ルーム設定に基づくオクルージョン
  - 家具
  - 壁、床、天井
  - 深度センサーによってスキャンされたメッシュ

# 使い方
1. このリポジトリーをcloneする
2. プロジェクト名の変更
   1. ルートディレクトリ名を任意のプロジェクト名に変更する
   2. Unity Hubにプロジェクトを登録する
   3. /quest3-mr-template.slnを削除する
3. プロジェクトを開く
   1. 任意のUnityバージョンに変更してもOK
4. ビルド対象プラットフォームをAndroidに変更する
5. 任意の方法でOculus Integrationをインポートする
   - [Asset Store](https://assetstore.unity.com/packages/tools/integration/oculus-integration-82022)が簡単なのでおすすめ
   - 全てのファイルをインポートすると時間が掛かるので一部のみでOK
     - OculusProjectConfig.asset
     - Platformディレクトリ
     - SampleFrameworkディレクトリ
     - VRディレクトリ
6. /App/Scenes/MrSceneを開く
7. 色々追加していく