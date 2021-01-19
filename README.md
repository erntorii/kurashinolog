# Ruby on Rails によるWebアプリケーション

## 使用している技術
バックエンド言語: Ruby  
フレームワーク: Rails  
テスト: RSpec  
データベース: MySQL  
インフラ: AWS(ECS on EC2, RDS, Route53, 他)  
インフラのコード化: Terraform([GitHubページ](https://github.com/erntorii/kurashinolog_terraform.git))  
CI/CD: CircleCI  
開発環境: Docker  
フロントエンド: HTML/CSS, Bootstrap, JavaScript

<br>

## アプリケーションの機能一覧

### ユーザ周り
認証機能(devise使用)  
かんたんログイン(ゲストログイン)機能  
プロフィール編集機能  
アカウント削除機能

### 記事周り
記事投稿機能  
記事編集機能  
記事削除機能

### その他
ページネーション(kaminari使用)  
画像アップロード(Active Storage使用)  
画像リサイズ(mini_magick使用)

<br>

## アプリケーションの概要

### どんな用途？
料理、掃除などの家事全般における備忘録を自分用に記録しておいたり、  
思いついたアイディアなどを他の人と共有することができる。

### 作った理由
日々の暮らしには工夫がたくさん詰まっている。  
こなしていく中で出会った発見や、いいなと思ったアイディアなどを他者と共有することによって、  
生活全般の効率を上げる手助けをしたり、真似をして新しいことに挑戦できるような機会を設ける。  
