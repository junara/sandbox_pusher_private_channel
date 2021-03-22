# README
PUSHERとRailsを使ってチャットを作ります。

PUSHERはprivateチャネルをsubscribeしています。

## チャットイメージ
![Kapture 2021-03-21 at 18 12 13](https://user-images.githubusercontent.com/17272426/111941671-e2772d00-8b14-11eb-9a39-6646e581af69.gif)


## SETUP
### PUSHER準備
1. PUSHERのアカウントを作成

https://pusher.com/

2. PUSHERの App keysで情報を入手

`.env_sample.env` ファイルを `.env` ファイルにコピーする

PUSHERのApp keys の情報を入力する
![image](https://user-images.githubusercontent.com/17272426/111941800-3550e480-8b15-11eb-97a1-8c4a99b583ff.png)


### Rails準備

migrationする

```
rails db:migrate
```

seedを実行する

```console
rails db:seed
```

### Rails起動

```
rails s
```

### チャットしてみる
冒頭の動画を参考に、下記を別ウィンドウでそれぞれログインしてチャットしてみてください。

