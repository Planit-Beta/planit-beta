# Planit - 旅程提案アプリ
<div align="center">
  <img width="80%" alt="スクリーンショット 2024-03-18 15 34 54" src="https://github.com/haruto318/FAG_Planit/assets/103641225/6e2d15ab-da15-4ddc-aedb-105cb743e6d8">
</div>

## 開発環境
- Swift  
- Xcode

## 使用API
- ChatGPT API
- Google Map Place API

## プロンプト

##作成要件
・\(viewModel.option.time)時間分のスケジュールを[junre]/[time]/[location]/[other]/[description]/[lat]の各項目について出力形式に基づいて日本語で出力。
・観光地の地理的な位置関係も考慮して、移動が必要な場合は、移動もjunreで出力する。
・食事のスケジュールは、具体的な店名を提案する。
・junreが移動の場合は、どこからどこまで移動するかを10字以内でdescriptionで出力する。（例：千寿庵から清水寺へ） 
・スケジュールのポイントについて解説を出力する。
・解説、予算、入場料について不確かな情報は出力しない。
・正確な場所や営業時間、入場料などの詳細が不明な場合は、web検索して正確で具体的な情報を出力する 
・locationの緯度経度を出力する(福岡城の緯度経度など) 

#作成項目 
\(viewModel.option.start)を出発に\(viewModel.option.time)時間分の予定を生成します。\(viewModel.option.detail1)を\(viewModel.option.withWho)過ごし、\(viewModel.option.detail2)や\(viewModel.option.detail3)スポットにも周りたいです。以下の条件を考慮し、行き先を選び、その行き先と食事を含んだ楽しめる予定を提案してください。予定の中でそこで過ごす時間も書いてください。なお、食事は昼食、夕食それぞれに関して、\(viewModel.option.foodType)を中心に選んでください。

#出力形式 
{ \"out\":[ {\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}, {\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列} ,{\"junre\": 文字列, \"time\": 文字列,  \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}, ...]}
