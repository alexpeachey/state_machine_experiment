class PostsController < ApplicationController
  before_action :authenticate!

  def index
    machine = PostList.new(LogicalState.new)
    list_params = { user_id: current_user.id }
    if machine.list! list_params
      @posts = list_params[:posts]
    else
      @posts = []
    end
    @post = Post.new
  end

  def create
    machine = PostCreation.new(LogicalState.new)
    if machine.create_post!(post_params) || machine.create_reply!(post_params)
      redirect_to root_path, notice: 'Drivel added.'
    else
      redirect_to root_path, alert: machine.failure_messages.join(', ')
    end
  end

  private

  def post_params
    {
      user_id: current_user.id,
      message: params[:post][:message]
    }
  end
end
