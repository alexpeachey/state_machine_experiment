class ValidateUser < EndState::Concluder
  attr_defaultable :validation, -> { Validation.new(user) }

  def call
    validation.validate!
  end

  def rollback
  end

  private

  def user
    params[:user]
  end
end
