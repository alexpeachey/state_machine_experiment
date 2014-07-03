class SessionsController < ApplicationController
  before_action :authenticate!, except: [:create]

  def create
    machine = SessionCreation.new(LogicalState.new)
    if machine.create! user_params
      redirect_to root_path, notice: 'Welcome back.'
    else
      redirect_to root_path, alert: machine.failure_messages.join(', ')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path, notice: 'Signed out.'
  end

  private

  def user_params
    {
      email: params[:user][:email],
      password: params[:user][:password],
      session: session
    }
  end
end
