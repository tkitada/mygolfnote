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

#ユーザーデータ作成
fullswing = User.find_or_create_by!(email:"fullswing@example.com") do |user|
  user.name = "Fullswing"
  user.password = "password"
  user.best_score = "95"
  user.average_score = "100"
  user.golf_experience = "2"
  user.golf_goals = "ショットもスコアも安定させたい。"
end

unless fullswing.profile_image.attached?
  fullswing.profile_image.attach(
    io: File.open(Rails.root.join("app/assets/images/sports_golf_yips.png")),
    filename: "sports_golf_yips.png",
    content_type: "image/png"
  )
end

enjoygolfer = User.find_or_create_by!(email:"enjoygolfer@example.com") do |user|
  user.name = "Enjoygolfer"
  user.password = "password"
  user.best_score = "110"
  user.average_score = "125"
  user.golf_experience = "1"
  user.golf_goals ="スコア100を切るために鍛錬中。ゴルフ好きと繋がりたい。"
end

unless enjoygolfer.profile_image.attached?
  enjoygolfer.profile_image.attach(
    io: File.open(Rails.root.join("app/assets/images/job_caddie_golf.png")),
    filename: "job_caddie_golf.png",
    content_type: "image/png"
  )
end

drawhitter = User.find_or_create_by!(email:"drawhitter@example.com") do |user|
  user.name = "Drawhitter"
  user.password = "password"
  user.best_score = "82"
  user.average_score = "90"
  user.golf_experience = "5"
end

unless drawhitter.profile_image.attached?
  drawhitter.profile_image.attach(
    io: File.open(Rails.root.join("app/assets/images/kasa_golf.png")),
    filename: "kasa_golf.png",
    content_type: "image/png"
  )
end

#投稿データ
posts_data = [
  {
    user: fullswing,
    focus: "スライス矯正",
    date: "2025-10-15",
    hits: "100",
    content: "グリップにずっと違和感がありスライスが止まらなかった。握りを調整して球が捕まるようになった。",
    tags: ["スライス", "グリップ"]
  },
  {
    user: enjoygolfer,
    focus: "50yard以内アプローチ",
    date: "2025-10-16",
    hits: "150",
    content: "・50yard以内を狙うとき -拳一つ分短く持つ。-足のスタンスはなるべく狭く。",
    tags: ["アプローチ", "距離感", "短い距離"]
  },
  {
    user: drawhitter,
    focus: "フォーム修正",
    date: "2025-10-17",
    hits: "80",
    content: "肩の力と腕の力を抜いてアドレスする。特に肩に力が入っていると手打ちになってしまうため。",
    tags: ["フォーム", "基礎練習"]
  }
]

# 投稿 + タグ作成ループ
posts_data.each do |data|
  post = PracticePost.find_or_create_by!(practice_focus: data[:focus]) do |p|
    p.practice_date = data[:date]
    p.shot_hits = data[:hits]
    p.content = data[:content]
    p.user = data[:user]
  end

  # タグを作成または検索して関連付ける
  tag_records = data[:tags].map { |name| Tag.find_or_create_by!(name: name) }
  post.tags << tag_records.reject { |t| post.tags.include?(t) }
end

#グループデータ
groups_data = [
  {
    name: "100切りプロジェクト",
    introduction: "目指せ100切り！目標のために切磋琢磨できる仲間を募集。",
    owner: enjoygolfer,
    members: [enjoygolfer, drawhitter],
    image_path: "app/assets/images/golf_cart.png"
  }
]
#グループ作成
groups_data.each do |data|
  group = Group.find_or_create_by!(name: data[:name]) do |g|
    g.introduction = data[:introduction]
    g.owner = data[:owner]
  end

  #画像添付
  if data[:image_path].present? && !group.group_image.attached?
    group.group_image.attach(
      io: File.open(Rails.root.join(data[:image_path])),
      filename: File.basename(data[:image_path]),
      content_type: "image/png" 
    )
  end

  #メンバー登録
  data[:members].each do |member|
    unless group.users.include?(member)
      group.users << member
    end
  end
end


puts "seedの実行が完了しました"