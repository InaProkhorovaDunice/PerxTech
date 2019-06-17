class User < ActiveRecord::Base

  has_many :transactions, dependent: :destroy
  has_many :rewards, dependent: :destroy

  def add_points_per_transaction(sum, country)
    regional_coefficient = country == 'Russia' ? 1 : 2
    count_points = (sum / 100) * regional_coefficient * 10
    new_points = points + count_points
    new_month_points = month_points + count_points
    update(points: new_points, month_points: new_month_points)
    check_status(new_points)
    check_prize_transaction
  end

  def check_status(new_points)
    new_status = new_points >= 1000 ? (new_points < 5000 ? 'gold' : 'platinum') : 'standard'
    set_status(new_status)
  end

  def check_prize_transaction
    add_reward('cashback', Time.now) if transactions.where('sum > 100').count > 9
    update(new: 'new') if new == 'registered'
    if new == 'new'
      end_date = transactions&.first['created_at'] + 60.days
      if Time.now > end_date
        update(new: 'not_new')
      elsif transactions.sum('sum') > 1000
        add_reward('tickets', Time.now)
        update(new: 'not_new')
      end
    end
  end

  def add_month_coffee_reward
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    add_reward('coffee', start_date, end_date) if month_points >= 100
  end

  def add_birthday_reward
    age = Date.today.year - dob.year
    start_date = dob.beginning_of_month + age.years
    end_date = dob.end_of_month + age.years
    add_reward('coffee', start_date, end_date)
  end

  def add_quarter_reward
   start_day = Date.today - 3.month
   end_day = Date.today - 1.day
    if transactions.where(`created_at > #{start_day} AND created_at > #{end_day}`).sum('sum') > 2000
      new_points = points + 100
      update(new_points)
    end
  end

  def add_reward(type, start_date, end_date = nil)
    rewards.create(reward_type: type, start_date: start_date, end_date: end_date)
  end

  def set_status(new_status)
    if status != new_status
      update(status: new_status)
      add_reward('airport', Time.now) if new_status == 'gold'
    end
  end

  def reset_points
    new_points = points > last_year_points ? points : last_year_points
    check_status(new_points)
    old_points = points
    update(last_year_points: old_points, points: 0)
  end

  def reset_month_points
    update(month_points: 0)
  end
end