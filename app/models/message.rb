class Message < ApplicationRecord
  belongs_to :user_session
  validates :body, presence: true, length: { maximum: 250 }
  validates :phone, presence: true, format: { with: /\A\+1\d{10}\z/ }
  validates :user_session_id, presence: true
  before_validation :format_phone_number
  validates :status, inclusion: { in: %w[accepted scheduled canceled queued sending sent failed delivered undelivered receiving received read] }, allow_nil: true
  scope :timeline, -> { order(created_at: :desc) }

  def format_phone_number
    self.phone = "+1#{phone.gsub(/\D/, '')}"
  end
end
