class FindPosts < EndState::Concluder
  def call
    params[:posts] = posts.sort { |a,b| b.created_at <=> a.created_at }
  end

  def rollback
    params[:posts] = nil
  end

  private

  def posts
    user.posts + user.relevant_posts
  end

  def user
    params[:user]
  end
end
