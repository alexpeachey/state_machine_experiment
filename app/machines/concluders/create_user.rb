class CreateUser < EndState::Concluder
  attr_defaultable :user_factory, -> { User }
  attr_defaultable :token_generator, -> { SecureRandom }

  def call
    params[:user] = user
    user.save
  end

  def rollback
    params[:user].destroy if params[:user]
  end

  private

  def user
    @user ||= user_factory.new(user_params)
  end

  def user_params
    params.select do |k,_|
      [:email, :handle, :password].include? k
    end.merge(
      password_confirmation: params[:password],
      validation_token: token_generator.uuid,
      validation_state: 'unvalidated'
    )
  end
end
