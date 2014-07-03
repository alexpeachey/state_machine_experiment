class UsersController < ApplicationController
  before_action :authenticate!, except: [:new, :create, :validate]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    machine = UserCreation.new(LogicalState.new)
    if machine.create! user_params
      redirect_to root_path, notice: 'Welcome to Twitly'
    else
      render :new
    end
  end

  def validate
    machine = UserValidation.new(LogicalState.new)
    if machine.validate! validation_params
      redirect_to root_path, notice: 'Thank you for validating'
    else
      redirect_to root_path, alert: 'We could not validate your account'
    end
  end

  private

  def user_params
    {
      email: params[:user][:email],
      handle: params[:user][:handle],
      password: params[:user][:password],
      session: session
    }
  end

  def validation_params
    {
      validation_token: params[:validation_token],
      session: session
    }
  end
end
