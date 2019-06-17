# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Transaction.delete_all
User.delete_all
User.create(
  [
    {id: 1, email: '1@gmail.com', password: '1@gmail', first_name: '1first_name', last_name: '1last_name', dob: DateTime.parse('30.12.1999 11:00:00').to_time, status: 'standard', points: 0, created_at: Time.now - 1.day, updated_at: Time.now, month_points: 0, new: 'registered', last_year_points: 1500 },
    {id: 2, email: '2@gmail.com', password: '2@gmail', first_name: '2first_name', last_name: '2last_name', dob: DateTime.parse('30.12.1995 11:00:00').to_time, status: 'standard', points: 350, created_at: Time.now, updated_at: Time.now, month_points: 250, new: 'registered', last_year_points: 2500},
    {id: 3, email: '3@gmail.com', password: '3@gmail', first_name: '3first_name', last_name: '3last_name',
     dob: DateTime.parse('30.12.1985 11:00:00').to_time, status: 'standard', points: 200, created_at: Time.now, updated_at: Time.now, month_points: 100, new: 'registered', last_year_points: 600 }
  ]
)



Transaction.create(
  [
    {id: 1, user_id: 1, sum: 250, country: 'Russia', created_at: Time.now, updated_at: Time.now },
    {id: 2, user_id: 2, sum: 450, country: 'Italy', created_at: Time.now, updated_at: Time.now }
  ]
)

# Rewards.delete_all
#
# Rewards.create(
#   [
#     {id: 1, user_id: 2, type: 'coffee', start_date: Time.now, end_date: Time.now + 7.day}
#   ]
#
# )
