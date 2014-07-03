class RequireReplyMessage < EndState::Guard
  attr_defaultable :user_repository, -> { User }

  def will_allow?
    params[:original_poster] = original_poster
    original_poster.present?
  end

  private

  def original_poster
    return unless original_handle.present?
    @original_poster ||= user_repository.find_by_handle(original_handle)
  end

  def original_handle
    handle = message.match /@(\w+)\s/
    @original_handle ||= handle && handle[1]
  end

  def message
    params[:message]
  end
end
