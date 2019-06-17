class Reward < ActiveRecord::Base

  belongs_to :user

  def remove_expired_rewards(date)
    Reward.where("end_date < #{date}").destroy_all
  end

  def remove_reward(user, type)
    Reward.where(reward_type: type, user_id: user.id).destroy_all
  end

end