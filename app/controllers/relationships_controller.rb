class RelationshipsController < ApplicationController
  before_action :authenticate!

  def create
    machine = UserFollow.new(LogicalState.new)
    if machine.follow! follow_params
      redirect_to users_path, notice: 'Follow successful.'
    else
      redirect_to users_path, alert: machine.failure_messages.join(', ')
    end
  end

  def destroy
    machine = UserUnfollow.new(LogicalState.new)
    if machine.unfollow! unfollow_params
      redirect_to users_path, notice: 'You have stopped following.'
    else
      redirect_to users_path, alert: machine.failure_messages.join(', ')
    end
  end

  private
  def follow_params
    {
      user_id: params[:relationship][:user_id],
      follower_id: current_user.id
    }
  end

  def unfollow_params
    {
      user_id: params[:id],
      follower_id: current_user.id
    }
  end
end
