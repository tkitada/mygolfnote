# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

#管理者アカウント
Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

#ユーザー作成
fullswing = User.find_or_create_by!(email:"fullswing@example.com") do |user|
  user.name = "Fullswing"
  user.password = "password"
  user.best_score = "95"
  user.average_score = "100"
  user.golf_experience = "2"
end

enjoygolfer = User.find_or_create_by!(email:"enjoygolfer@example.com") do |user|
  user.name = "Enjoygolfer"
  user.password = "password"
  user.best_score = "110"
  user.average_score = "125"
  user.golf_experience = "1"
end

drawhitter = User.find_or_create_by!(email:"drawhitter@example.com") do |user|
  user.name = "Drawhitter"
  user.password = "password"
  user.best_score = "82"
  user.average_score = "90"
  user.golf_experience = "5"
end

#投稿
PracticePost.find_or_create_by!(practice_focus: "スライス矯正") do |practice_post|
  practice_post.practice_date = "2025-10-15"
  practice_post.shot_hits = "100"
  practice_post.content = "グリップにずっと違和感がありスライスが止まらなかった。握りを調整して球が捕まるようになった。"
  practice_post.user = fullswing
end

PracticePost.find_or_create_by!(practice_focus: "50yard以内アプローチ") do |practice_post|
  practice_post.practice_date = "2025-10-16"
  practice_post.shot_hits = "150"
  practice_post.content = "・50yard以内を狙うとき -拳一つ分短く持つ。-足のスタンスはなるべく狭く。 "
  practice_post.user = enjoygolfer
end

PracticePost.find_or_create_by!(practice_focus: "フォーム修正") do |practice_post|
  practice_post.practice_date = "2025-10-17"
  practice_post.shot_hits = "80"
  practice_post.content = "肩の力と腕の力を抜いてアドレスする。特に肩に力が入っていると手打ちになってしまうため。"
  practice_post.user = drawhitter
end


puts "seedの実行が完了しました"