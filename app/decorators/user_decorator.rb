class UserDecorator < Draper::Decorator
  delegate_all

  def author
    [user.firstname, user.lastname].compact.join(' ')
  end
end
