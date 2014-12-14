class Request < ActiveRecord::Base
  belongs_to :game
  belongs_to :giver, class_name: 'User', foreign_key: 'user_id_from'
  belongs_to :receiver, class_name: 'User', foreign_key: 'user_id_to'

  validates :user_id_from, uniqueness: { scope: [:user_id_to, :game_id] }

  def abc!
    return true if accepted_at.present?
    self.update(accepted_at: Time.current)
  end

  def reject!
    return true if rejected_at.present?
    self.update(rejected_at: Time.current)
  end
end
