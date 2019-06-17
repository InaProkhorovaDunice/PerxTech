require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  setup do
    @dob = Date.today - 25.years
    @age = 25
    @user = User.create({email: 'user1@gmail.com', password: '12345', dob: @dob})
    @start_month = Date.today.beginning_of_month
    @end_month = Date.today.end_of_month
  end

  test 'check accrual points for transactions' do
  transaction1 = @user.transactions.create({sum: 150, country: 'Russia'})
  transaction2 = @user.transactions.create({sum: 200, country: 'USA'})
  @user.add_points_per_transaction(transaction1.sum, transaction1.country)
  @user.add_points_per_transaction(transaction2.sum, transaction2.country)
  assert_equal 50, @user.points
  assert_equal 50, @user.month_points
  end

  test 'check month coffee reward for 100 points' do
    user = User.create({email: 'user@gmail.com', password: '12345', month_points: 105})
    type = 'coffee'
    user.add_month_coffee_reward
    coffee_reward = user.rewards.first
    assert_equal type, coffee_reward['reward_type']
    assert_equal @start_month, coffee_reward['start_date']
    assert_equal @end_month, coffee_reward['end_date']
  end

  test 'check birthday month coffee reward' do
    start_month = @dob.beginning_of_month + @age.years
    end_month = @dob.end_of_month + @age.years
    @user.add_birthday_reward
    bod_reward = @user.rewards.first
    assert_equal start_month, bod_reward['start_date'].to_date
    assert_equal end_month, bod_reward['end_date'].to_date
  end

  test 'check cashback and tickets reward' do
    user = User.create({email: 'user@gmail.com', password: '12345'})
    10.times { user.transactions.create({sum: 120, country: 'Russia'}) }
    user.check_prize_transaction
    cashback_reward = user.rewards.where(reward_type: 'cashback')
    tickets_reward = user.rewards.where(reward_type: 'tickets')
    assert cashback_reward
    assert tickets_reward
  end

  test 'check user status' do
    user1 = User.create({email: 'user1@gmail.com', password: '12345', dob: @dob})
    user2 = User.create({email: 'user2@gmail.com', password: '12345', dob: @dob})
    user3 = User.create({email: 'user3@gmail.com', password: '12345', dob: @dob})
    user1.check_status(900)
    user2.check_status(1100)
    user3.check_status(5100)
    assert_equal 'standard', user1['status']
    assert_equal 'gold', user2['status']
    assert_equal 'platinum', user3['status']
  end



end