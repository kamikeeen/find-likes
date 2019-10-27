# file_name = Dir.glob("/Users/kamiyakentarou/Desktop/画像/*")
# 100.times do |n|
#   password = "11111111"
#   User.create(nickname: Faker::Lorem.characters(number: 8),
#               email: Faker::Internet.email,
#               avatar: File.open(file_name.sample),
#               password: password,
#               password_confirmation: password
#               )
# end

# 150.times do |n|
#   like = Like.new(name: Faker::Lorem.unique.word,
#                   genre_id: Faker::Number.within(range: 1..5))
#   if Like.where(name: like.name, genre_id: like.genre_id).empty?
#     like.save
#   end
# end

# user_ids = User.ids
# users = User.all
# users.each do |user|
#   num = rand(100)
#   User.where(id: user_ids.sample(num)).where.not(id: user.id).each do |following|
#     unless user.followings.include?(following)
#       user.followings << following
#     end
#   end
# end

# 5000.times do |n|
#   user = User.all.sample
#   like = Like.all.sample
#   user_like = UserLike.new( user_id: user.id,
#                             like_id: like.id)
#   if UserLike.where(user_id: user_like.user_id, like_id: user_like.like_id).empty?
#     user_like.save
#   end
# end

