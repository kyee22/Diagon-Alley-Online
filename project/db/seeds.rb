# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin1 = User.find_or_create_by(email: 'admin@buaa.edu.cn') do |user|
  user.password = '123456'              # 密码
  user.password_confirmation = '123456' # 确认密码
  user.role = 'admin'                         # 角色为管理员
end

admin2 = User.find_or_create_by(email: 'super@buaa.edu.cn') do |user|
  user.password = '789456132'              # 密码
  user.password_confirmation = '789456132' # 确认密码
  user.role = 'admin'                         # 角色为管理员
end


