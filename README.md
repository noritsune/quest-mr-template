# quest-mr-template
Meta QuestでMRアプリを作るためのUnityのテンプレートプロジェクトです。

# Unityバージョン
2022.3.46f1以降

# 機能
- 頭とコントローラー/手のトラッキング
- 視界全体のパススルー表示
- ルーム設定に基づくオクルージョン
  - 家具
  - 壁、床、天井
- 現実にCGの影を落とす
- コントローラーのトリガーを押すと玉と豆腐を発射する
  - おまけ機能

![Demo GIF](ReadmeSrc/demo.gif)

# 使い方
1. GitHubのページの緑の「Use this template」ボタンからリポジトリを作成する
2. 作成されたリポジトリをローカルにcloneする
3. Unity Hubにプロジェクトを登録する
4. プロジェクトを開く
5. ビルド対象プラットフォームをAndroidに変更する
    - アセットをたくさん追加したあとにやると時間が掛かるので先にやる
6. App/Scenes/MrTemplate.unityを開く
7. 色々追加していく


# 注意点
- Unityバージョンは2022.3.46以降をおすすめします
    - 2022.3.2で試したところ、以下のエラーが表示されてビルドに失敗しました
        - `変更できないフォルダーにプレハブを保存することはできません。Packages/com.meta.xr.sdk.interaction.ovr/Editor/Blocks/Interactors/Prefabs/[BB] Hand Ray.prefab`
- 動的オクルージョン
    - 機能として導入しましたが、適用はおすすめしません
        - 境界がジラジラして不自然な見た目になるためです
    - 対象にしたいオブジェクトのマテリアルには`EnviromentDepth/OcclusionLit`シェーダーを適用する必要があります
- OS側の機能によるリセンターが効かなくなりました
    - MRUKの仕様上、OS側の機能によるリセンターをしてしまうとシーンメッシュの位置が現実とずれてしまうためです
    - MRUKの設定で無効化してあります

# 使用しているライブラリ
- [unity-reference-viewer](https://github.com/ina-amagami/unity-reference-viewer/blob/master/LICENSE.txt)
  - 開発が便利になる
  - 必須ではないので消してもOK
