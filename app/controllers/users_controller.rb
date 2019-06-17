class UsersController < ApplicationController
  @currentUser = User.find_by(id: 1)

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @transaction = @user.find_by(id: 1)
  end

  def add_points

    sum = @transaction
  end

end
