# ios 練習その2

## 内容
- GCDを使った並列プログラミング（キューを使った非同期処理） 
- WKWebViewの表示（今後アップデート予定）


## GCDを使った並列プログラミング（キューを使った非同期処理）
iOS(macOS)は並列プログラミングをするときにキューを使った非同期処理として実装出来るようになっています。
自分でスレッド管理をしなくてよくなります。JavaScriptで非同期処理になれていればほぼほぼ違和感なく使えます。

デモでは実行すると「計算中...」と出ます。これはフィボナッチ数列の計算をサブスレッドで行い、メインスレッドで表示を制御しているためです。（多分）
直列の処理でコメントアウトしている方にして実行すると表示されません。

### 参考URL

- https://qiita.com/shoheiyokoyama/items/433ff8e6612d8d368875
- https://dev.classmethod.jp/smartphone/iphone/swift-3-how-to-use-gcd-api-1/
- https://qiita.com/marty-suzuki/items/f0547e40dc09e790328f
- https://developer.apple.com/jp/documentation/ConcurrencyProgrammingGuide.pdf

## Demo
![demo](https://github.com/taichi0529/ios-practice02/blob/media/demo.gif)
