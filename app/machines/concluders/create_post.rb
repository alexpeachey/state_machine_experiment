class CreatePost < EndState::Concluder
  def call
    params[:post] = post
    post.save
  end

  def rollback
    params[:post].destroy if params[:post].exists?
    params[:post] = nil
  end

  private

  def post
    @post ||= user.posts.build(message: params[:message])
  end

  def user
    params[:user]
  end
end
