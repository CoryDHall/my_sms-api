class UserSession < ApplicationRecord
  has_many :messages, -> { timeline }, dependent: :destroy, inverse_of: :user_session

  def self.find_or_create(session_id)
    if session_id.present?
      UserSession.find(session_id)
    else
      UserSession.create
    end
  end

  def create_message(attributes)
    messages.create!(attributes)
  end
end
