# EC_Kubernetes
## 概要
Spring BootとThymeleafを使用したECサイトをDockerコンテナ内でKubernetesで動作するようにしたものです。

## システム構成
システム構成は以下の通りです。
|概要|詳細|ポート番号|
|:--|:--|:--|
| ウェブサーバー | nginx（ver:latest）| 80 |
| アプリケーションサーバー | Tomcat（ver:9.0.50）| 8080 |
| データベースサーバー | MySQL（ver:8.0.26）| 3306 |
| セッションサーバー | Redis（ver:6.2.5）| 6379 |

## 実行前の前提条件
- Docker Desktopがインストールされていること。

- Dockerコンテナ内でKubernetesクラスタ作成できるツールのkindがインストールされていること。

- Kubernetesコマンドラインツールのkubectlがインストールされていること。

- 80番ポートが使用されていないこと。

## Windowsでの実行方法
1. このレポジトリを任意の場所にダウンロードします。

2. PowerShellを起動して、cdコマンドでダウンロードしたフォルダに移動します。

3. dockerが起動していることを確認してから、Kubernetesクラスタを作成します。
   ``` sh
   kind create cluster --config .\config.yaml
   ```
   
4. KubernetesクラスタにDockerコンテナをデプロイします。
   ``` sh
   .\deploy.ps1
   ```

5. Webブラウザーに http://localhost/ec/home を入力すると、ECサイトが表示されます。

6. Kubernetesクラスタを削除します。
   ``` sh
   kind delete cluster
   ```

## ユーザー一覧
ECサイトにログインできるユーザーは以下の通りです。
|ユーザーID|パスワード|権限|
|:--|:--|:--|
| admin | admin | 管理者 |
| general | general | 一般 |