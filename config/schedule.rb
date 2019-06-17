every 1.year, at: '0:01 am' do
  runner "User.add_birthday_reward"
end

every 1.year, at: '0:01 am' do
  runner "User.add_month_coffee_reward"
end

every 1.year, at: '0:05 am' do
  runner "User.reset_points"
end

every 1.month, at: '0:05 am' do
  runner "User.reset_month_points"
end

every 3.month, at: '0:01 am' do
  runner "User.add_quarter_reward"
end

every 1.day, at: '0:01 am' do
  runner "User.remove_expired_rewards"
end

