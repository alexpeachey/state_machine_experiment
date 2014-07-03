class FollowUser < EndState::Concluder
  def call
    params[:relationship] = relationship
    relationship.save
  end

  def rollback
    return unless params[:relationship].present?
    params[:relationship].destroy
  end

  private

  def relationship
    @relationship ||= user.relationships.build(follower_id: follower.id)
  end

  def follower
    params[:follower]
  end

  def user
    params[:user]
  end
end
