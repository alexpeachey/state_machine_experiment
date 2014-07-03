module ApplicationHelper
  def flash_message_class(name)
    return 'danger' if name == 'alert'
    return 'success' if name == 'notice'
    return 'info'
  end
end
