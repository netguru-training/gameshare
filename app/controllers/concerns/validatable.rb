module Validatable
  extend ActiveSupport::Concern

  included do
    validates :type, uniqueness: { scope: [:user_id, :game_id] }
  end
end
