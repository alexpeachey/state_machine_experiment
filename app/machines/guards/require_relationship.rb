class RequireRelationship < EndState::Guard
  def will_allow?
    params[:relationship] = relationship
    relationship.present?
  end

  private

  def relationship
    @relationship ||= user.relationships.where(follower_id: params[:follower_id]).first
  end

  def user
    params[:user]
  end
end
