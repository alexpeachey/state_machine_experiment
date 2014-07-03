class UnfollowUser < EndState::Concluder
  def call
    relationship.destroy
    true
  end

  def rollback
    params[:relationship] = user.relationships.create(follower_id: params[:follower_id])
  end

  private

  def relationship
    params[:relationship]
  end

  def user
    params[:user]
  end
end
