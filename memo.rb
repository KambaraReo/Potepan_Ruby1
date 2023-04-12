require "csv" # CSVファイルを扱うためのライブラリ読み込み

p "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i # ユーザーの入力値を取得し，数字へ変換

# 1と2以外が入力される場合，再入力
while memo_type != 1 && memo_type !=2 do
  p "再入力してください（1 → 新規でメモを作成する / 2 → 既存のメモを編集する）"
  memo_type = gets.to_i
end

# 1が入力される時の処理
if memo_type == 1
  p "ファイル名を入力してください（拡張子を除く）"
  newfile_name = gets.chomp # ファイル名取得
  newfile = CSV.open("#{newfile_name}.csv", "w+")

  p "メモしたい内容を記入してください（完了したら「Ctrl + D」）"
  input = readlines # メモ内容取得
  newfile.puts(input)
  newfile.close
  p "完了しました"
# 2が入力される時の処理 
else
  p "編集するファイル名を入力してください（拡張子を除く）"
  existingfile_name = gets.chomp
  existingfile = CSV.open("#{existingfile_name}.csv", "a+")

  puts "-----------編集前-----------"
  puts existingfile.read # 編集前のファイル内容表示
  puts "-----------------------------"

  p "追記したい内容を記入してください（完了したら「Ctrl + D」）"
  input_add = readlines
  existingfile.puts(input_add)
  existingfile.close
  p "更新しました"
end