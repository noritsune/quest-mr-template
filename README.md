# quest-mr-template
Meta QuestでMRアプリを作るためのUnityのテンプレートプロジェクトです。

# Unityバージョン
2022.3.2f1(起動時に任意のバージョンに変更可)

# 機能
- 頭とコントローラー/手のトラッキング
- 視界全体のパススルー表示
- ルーム設定に基づくオクルージョン
  - 家具
  - 壁、床、天井
  - 深度センサーによってスキャンされたメッシュ
    - Quest 3のみ(2023-10-16現在)
- 現実にCGの影を落とす
- コントローラーのトリガーを押すと玉と豆腐を発射する
  - おまけ機能

![Demo GIF](demo.gif)

# 使い方
1. 緑の「Use This Template」ボタンからリポジトリを作成する
2. 作成されたリポジトリをローカルにcloneする
3. Unity Hubにプロジェクトを登録する
4. プロジェクトを開く
    - 任意のUnityバージョンに変更してもOK
    - プロジェクトを開いたらコンソールに「'OVRInput' could not be found」エラーが出るがこのあとの手順で消えるため無視でOK
5. ビルド対象プラットフォームをAndroidに変更する
6. 任意の方法でOculus Integrationをインポートする
    - [Asset Store](https://assetstore.unity.com/packages/tools/integration/oculus-integration-82022)が簡単なのでおすすめ
    - 全てのファイルをインポートすると時間が掛かるので一部のみでOK
      - OculusProjectConfig.asset
      - Platformディレクトリ
      - SampleFrameworkディレクトリ
      - VRディレクトリ
7. /App/Scenes/MrSceneを開く
8. 色々追加していく

# 使用しているライブラリ
- [unity-reference-viewer](https://github.com/ina-amagami/unity-reference-viewer/blob/master/LICENSE.txt)
  - 開発が便利になる
  - 必須ではないので消してもOK
